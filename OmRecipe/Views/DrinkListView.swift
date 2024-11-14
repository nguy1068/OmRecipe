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
    @State private var currentPage = 1

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
                    List {
                        ForEach(drinks) { drink in
                            HStack(alignment: .top, spacing: 20) {
                                AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 70, height: 70)
                                .cornerRadius(8)
                                .clipped()

                                VStack(alignment: .leading, spacing: 10) {
                                    Text(drink.strDrink)
                                        .font(.headline)
                                    Button("View Details") {
                                        fetchDrinkDetail(idDrink: drink.idDrink) { detail in
                                            self.selectedDrinkDetail = detail
                                        }
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                }
                            }
                            .padding(.vertical, 5)
                            .onAppear {
                                if drink == drinks.last {
                                    loadMoreDrinks()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Drinks")
            .onAppear {
                fetchDrinks()
            }
            .sheet(item: $selectedDrinkDetail) { detail in
                DrinkDetailView(drinkDetail: detail)
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
                        [String: [Drink]].self, from: data)
                    DispatchQueue.main.async {
                        self.drinks = decodedResponse["drinks"]?.prefix(10).map { $0 } ?? []
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

    private func loadMoreDrinks() {
        currentPage += 1
        guard
            let url = URL(
                string:
                "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic&page=\(currentPage)"
            )
        else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(
                        [String: [Drink]].self, from: data)
                    DispatchQueue.main.async {
                        let newDrinks = decodedResponse["drinks"]?.prefix(10).map { $0 } ?? []
                        self.drinks.append(contentsOf: newDrinks)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error decoding data: \(error.localizedDescription)"
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }

    private func fetchDrinkDetail(idDrink: String, completion: @escaping (DrinkDetail?) -> Void) {
        guard
            let url = URL(
                string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)")
        else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(
                        [String: [DrinkDetail]].self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse["drinks"]?.first)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}

struct DrinkDetailView: View {
    let drinkDetail: DrinkDetail

    var body: some View {
        VStack(alignment: .leading) {
            Text(drinkDetail.strDrink)
                .font(.largeTitle)
                .padding(.bottom)
            if let imageUrl = drinkDetail.strDrinkThumb, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .cornerRadius(8)
                .clipped()
                .padding(.bottom)
            }
            if let category = drinkDetail.strCategory {
                Text("Category: \(category)")
                    .font(.headline)
                    .padding(.bottom)
            }
            if let alcoholic = drinkDetail.strAlcoholic {
                Text("Alcoholic: \(alcoholic)")
                    .font(.headline)
                    .padding(.bottom)
            }
            if let glass = drinkDetail.strGlass {
                Text("Glass: \(glass)")
                    .font(.headline)
                    .padding(.bottom)
            }
            if let instructions = drinkDetail.strInstructions {
                Text("Instructions: \(instructions)")
                    .font(.body)
                    .padding(.bottom)
            }
            if let ingredient1 = drinkDetail.strIngredient1 {
                Text("Ingredient 1: \(ingredient1)")
                    .font(.body)
                    .padding(.bottom)
            }
            if let ingredient2 = drinkDetail.strIngredient2 {
                Text("Ingredient 2: \(ingredient2)")
                    .font(.body)
                    .padding(.bottom)
            }
            if let ingredient3 = drinkDetail.strIngredient3 {
                Text("Ingredient 3: \(ingredient3)")
                    .font(.body)
                    .padding(.bottom)
            }
        }
        .padding()
    }
}
