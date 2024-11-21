import SwiftUI

struct Drink: Identifiable, Codable, Equatable {
    let id = UUID()
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String

    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        case strDrinkThumb
    }

    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.idDrink == rhs.idDrink
    }
}

struct DrinkDetail: Identifiable, Codable {
    let id = UUID()
    let idDrink: String
    let strDrink: String
    let strCategory: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?

    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        case strCategory
        case strAlcoholic
        case strGlass
        case strInstructions
        case strDrinkThumb
        case strIngredient1
        case strIngredient2
        case strIngredient3
    }
}

struct DrinkListView: View {
    @State private var drinks: [Drink] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var selectedDrinkDetail: DrinkDetail?
    @State private var isSheetPresented = false
    @State private var currentIndex = 0

    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView("Loading drinks...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    Spacer()
                    GeometryReader { geometry in
                        ZStack {
                            ForEach(
                                currentIndex ..< min(currentIndex + 100, drinks.count), id: \.self
                            ) { index in
                                CardView(
                                    drink: drinks[index], selectedDrinkDetail: $selectedDrinkDetail,
                                    isSheetPresented: $isSheetPresented
                                )
                                .frame(width: geometry.size.width, height: geometry.size.height) //
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Drinks🥃🧃🍸☕️")
            .onAppear {
                fetchDrinks()
            }
            .sheet(isPresented: $isSheetPresented) {
                if let detail = selectedDrinkDetail {
                    DrinkDetailView(drinkDetail: detail)
                } else {
                    Text("No details available")
                }
            }
        }
    }

    private func fetchDrinks() {
        guard
            let url = URL(
                string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic")
        else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(
                        [String: [Drink]].self, from: data
                    )
                    DispatchQueue.main.async {
                        self.drinks = decodedResponse["drinks"]?.prefix(100).map { $0 } ?? []
                        self.isLoading = false
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error decoding data: \(error.localizedDescription)"
                        self.isLoading = false
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }.resume()
    }

    struct DrinkDetailView: View {
        let drinkDetail: DrinkDetail

        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(drinkDetail.strDrink)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    if let imageUrl = drinkDetail.strDrinkThumb, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(
                                    width: UIScreen.main.bounds.width - 32,
                                    height: (UIScreen.main.bounds.width - 32) * 3 / 4
                                )
                                .clipped()
                                .cornerRadius(12)
                        } placeholder: {
                            ProgressView()
                                .frame(
                                    width: UIScreen.main.bounds.width - 32,
                                    height: (UIScreen.main.bounds.width - 32) * 3 / 4
                                )
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    }

                    if let category = drinkDetail.strCategory {
                        DetailRow(label: "Category:", value: category, isMultiline: false)
                    }

                    if let alcoholic = drinkDetail.strAlcoholic {
                        DetailRow(label: "Alcoholic:", value: alcoholic, isMultiline: false)
                    }

                    if let glass = drinkDetail.strGlass {
                        DetailRow(label: "Glass:", value: glass, isMultiline: false)
                    }

                    if let instructions = drinkDetail.strInstructions {
                        DetailRow(label: "Instructions:", value: instructions, isMultiline: true)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Main Ingredients")
                            .font(.headline)
                            .padding(.bottom, 4)

                        if let ingredient1 = drinkDetail.strIngredient1 {
                            Text("• \(ingredient1)")
                        }
                        if let ingredient2 = drinkDetail.strIngredient2 {
                            Text("• \(ingredient2)")
                        }
                        if let ingredient3 = drinkDetail.strIngredient3 {
                            Text("• \(ingredient3)")
                        }
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle(drinkDetail.strDrink)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    struct DetailRow: View {
        let label: String
        let value: String
        let isMultiline: Bool

        var body: some View {
            if isMultiline {
                VStack(alignment: .leading) {
                    Text("\(label)")
                        .fontWeight(.semibold)
                        .frame(width: 120, alignment: .leading) // Adjust width as needed
                    Spacer()
                    Text(value)
                        .multilineTextAlignment(.leading)
                }.padding()
            } else {
                HStack(alignment: .top) {
                    Text("\(label)")
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .leading) // Adjust width as needed
                    Text(value)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.padding()
            }
        }
    }
}
