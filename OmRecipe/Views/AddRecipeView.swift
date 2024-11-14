import PhotosUI
import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeData: RecipeData
    @Environment(\.dismiss) var dismiss: DismissAction

    @State private var recipeTitle: String = ""
    @State private var recipeDescription: String = ""
    @State private var recipeIngredients: [String] = []
    @State private var recipeSteps: [String] = []
    @State private var recipePrepTime: Int = 0
    @State private var recipeCookTime: Int = 0
    @State private var inputImage: UIImage?
    @State private var thumbnailImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // PhotoPicker
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        VStack {
                            if let thumbnail = thumbnailImage {
                                thumbnail
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(8)
                            } else {
                                Image(systemName: "photo")
                                    .font(.system(size: 44))
                            }
                            Spacer()
                            Text("Select a Recipe Image")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(.blue)
                        )
                    }
                    .padding()
                    .onChange(of: selectedItem) { newItem in
                        guard let newItem = newItem else { return }
                        Task {
                            if let data = try? await newItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data)
                            {
                                inputImage = uiImage
                                thumbnailImage = Image(uiImage: uiImage)
                            }
                        }
                    }

                    // Recipe Title
                    TextInput(label: "Title", placeholder: "Enter recipe title", text: $recipeTitle).padding(.bottom)
                    // Recipe Description
                    TextInput(label: "Description", placeholder: "Enter a brief description", text: $recipeDescription).padding(.bottom)
                    // Ingredients
                    IngredientListView(ingredients: $recipeIngredients).padding(.bottom)
                    // Steps
                    StepsListView(steps: $recipeSteps).padding(.bottom)

                    // Times
                    VStack {
                        TimeInputView(timeValue: $recipePrepTime, label: "Prep Time (mins)")
                        TimeInputView(timeValue: $recipeCookTime, label: "Cook Time (mins)")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Save") {
                        if recipeTitle.isEmpty || recipeDescription.isEmpty || recipeIngredients.isEmpty || recipeSteps.isEmpty || recipePrepTime == 0 || recipeCookTime == 0 {
                            showAlert = true
                        } else {
                            var newRecipe = Recipe(
                                thumbnailImagePath: nil,
                                title: recipeTitle,
                                description: recipeDescription,
                                ingredients: recipeIngredients,
                                steps: recipeSteps,
                                prepTime: recipePrepTime,
                                cookTime: recipeCookTime
                            )

                            if let image = inputImage {
                                let imagePath = saveImage(image: image, for: newRecipe) ?? "default_recipe"
                                newRecipe.thumbnailImagePath = imagePath
                            } else {
                                newRecipe.thumbnailImagePath = "default_recipe"
                            }

                            recipeData.addNewRecipe(recipe: newRecipe)
                            dismiss()
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Please fill in all the required fields."), dismissButton: .default(Text("OK")))
        }
    }
}
