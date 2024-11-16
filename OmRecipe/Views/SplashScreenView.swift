import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @EnvironmentObject var recipeData: RecipeData

    var body: some View {
        if isActive {
            MainTabView()
                .environmentObject(recipeData)
        } else {
            VStack {
                Image("omrecipe_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
