import SwiftUI

@main
struct OmRecipeApp: App {
    @StateObject private var recipeData: RecipeData = .init()

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(recipeData)
        }
    }
}
