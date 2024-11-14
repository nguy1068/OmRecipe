import SwiftUI

struct Drink: Identifiable, Codable {
    let id = UUID()
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String

    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        case strDrinkThumb
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
                    List(drinks) { drink in
                        VStack(alignment: .leading) {
                            Text(drink.strDrink)
                                .font(.headline)
                            AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                            .clipped()
                            Button("View Details") {
                                fetchDrinkDetail(idDrink: drink.idDrink) { detail in
                                    self.selectedDrinkDetail = detail
                                }
                            }
                        }
                        .padding(.vertical, 5)
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

        URLSession.shared.dataTask(with: url) { data, response, error in
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

    private func fetchDrinkDetail(idDrink: String, completion: @escaping (DrinkDetail?) -> Void) {
        guard
            let url = URL(
                string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)")
        else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
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
