//
//  OmRecipeApp.swift
//  OmRecipe
//
//  Created by Dat Nguyen(Mike) on 2024-11-13.
//

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
