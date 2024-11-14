import SwiftUI

@main
struct OmRecipeApp: App {
    @StateObject private var recipeData: RecipeData = .init()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(recipeData)
        }
    }
}
