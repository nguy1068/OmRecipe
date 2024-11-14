import SwiftUI

// TODO: Create a struct named Recipe.
struct Recipe: Identifiable {
    var thumbnailImagePath: String?
    var id: UUID
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
    var prepTime: Int
    var cookTime: Int

    init(thumbnailImagePath: String? = "default_recipe", title: String, description: String, ingredients: [String], steps: [String], prepTime: Int, cookTime: Int) {
        self.thumbnailImagePath = thumbnailImagePath
        self.id = UUID()
        self.title = title
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.prepTime = prepTime
        self.cookTime = cookTime
    }
}

// TODO: Add id property using UUID() to uniquely identify each recipe.
func generateUUID() {
    let uuid = NSUUID().uuidString
    print(uuid)
}
