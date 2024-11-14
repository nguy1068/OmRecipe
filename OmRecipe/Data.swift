import SwiftUI

class RecipeData: ObservableObject {
    @Published var recipes: [Recipe] = []

    init() {
        // Load default recipes from DefaultRecipes.swift
        recipes = DefaultRecipes.all
    }

    // Function to add a new recipe
    func addNewRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }

    // Function to edit an existing recipe
    func editRecipe(at index: Int, with updatedRecipe: Recipe) {
        recipes[index] = updatedRecipe
    }

    // Function to delete a recipe
    func deleteRecipe(at index: Int) {
        recipes.remove(at: index)
    }
}
