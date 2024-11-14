import SwiftUI

struct Drink: Identifiable, Codable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let instructions: String

    enum CodingKeys: String, CodingKey {
        case name
        case ingredients
        case instructions
    }
}

struct DrinkListView: View {
    @State private var drinks: [Drink] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

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
                            Text(drink.name)
                                .font(.headline)
                            Text("Ingredients: \(drink.ingredients.joined(separator: ", "))")
                                .font(.subheadline)
                            Text("Instructions: \(drink.instructions)")
                                .font(.body)
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Drinks")
            .onAppear {
                fetchDrinks()
            }
        }
    }

    private func fetchDrinks() {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/cocktail?name=margarita") else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue(
            "KlOwHnrc9G11N+KdMp95ZA==ehrOffBfa8hWwTol", forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Drink].self, from: data)
                    DispatchQueue.main.async {
                        self.drinks = decodedResponse
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
}
