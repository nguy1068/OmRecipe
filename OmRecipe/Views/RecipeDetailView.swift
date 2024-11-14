import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State private var completedSteps: [Bool] = []

    init(recipe: Recipe) {
        self.recipe = recipe
        _completedSteps = State(initialValue: Array(repeating: false, count: recipe.steps.count))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Prep and Cook Time Chips
                HStack {
                    ChipView(label: "⌛️\(recipe.prepTime) mins")
                    ChipView(label: "🔥\(recipe.cookTime) mins")
                }
                .padding(.horizontal)
                .padding(.bottom, 10)

                // Image with 16:9 ratio
                let uiImage = loadImage(for: recipe) ?? UIImage(named: recipe.thumbnailImagePath ?? "default_recipe")
                if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 3 / 4)
                        .clipped()
                        .padding(.bottom, 5)
                } else {
                    Image("default_recipe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 3 / 4)
                        .clipped()
                        .padding(.bottom, 5)
                }

                Text(recipe.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                // Ingredients
                Text("🔗Ingredients:")
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                    .padding(.top, 10)

                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("• \(ingredient)")
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                }

                // Steps with Checkboxes
                Text("⚡️Steps:")
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    .padding(.top, 10)

                ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top) {
                        Button(action: {
                            completedSteps[index].toggle()
                        }) {
                            Image(systemName: completedSteps[index] ? "checkmark.square.fill" : "checkmark.square")
                        }
                        Text(step).padding(.top, -3)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditRecipeView(recipe: recipe)) {
                    Text("Edit").font(.headline)
                }
            }
        }
        .onAppear {
            completedSteps = Array(repeating: false, count: recipe.steps.count)
        }
    }
}
