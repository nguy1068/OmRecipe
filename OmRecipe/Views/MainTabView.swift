import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            RecipeListView()
                .tabItem {
                    Label("Foods", systemImage: "fork.knife")
                }

            DrinkListView()
                .tabItem {
                    Label("Drinks", systemImage: "cup.and.saucer")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(RecipeData()) // Ensure to provide the environment object
    }
}
