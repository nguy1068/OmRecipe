import Foundation

enum DefaultRecipes {
    static let all: [Recipe] = [
        Recipe(
            thumbnailImagePath: "spaghetti",
            title: "Spaghetti Carbonara",
            description: "Classic Italian pasta dish with eggs, cheese, pancetta, and black pepper.",
            ingredients: ["1 pound spaghetti", "4 oz pancetta", "4 eggs", "1 cup Pecorino Romano", "1 cup Parmigiano-Reggiano", "Black pepper", "Salt"],
            steps: [
                "Cook pasta in salted water according to package instructions.",
                "Crisp pancetta in a large pan.",
                "Whisk eggs and cheese in a bowl.",
                "Toss hot pasta with pancetta, then quickly stir in egg mixture.",
                "Season with black pepper and serve immediately."
            ],
            prepTime: 15,
            cookTime: 20
        ),
        
        Recipe(
            thumbnailImagePath: "chicken_alfredo",
            title: "Chicken Alfredo",
            description: "Creamy pasta dish made with fettuccine, chicken, and a rich Alfredo sauce.",
            ingredients: ["1 pound fettuccine", "2 chicken breasts", "1 cup heavy cream", "1 cup Parmesan cheese", "2 tablespoons butter", "Garlic", "Salt", "Black pepper"],
            steps: [
                "Cook fettuccine according to package instructions.",
                "Sauté garlic in butter, then add chicken until cooked through.",
                "Stir in heavy cream and Parmesan cheese until smooth.",
                "Combine pasta with sauce and chicken.",
                "Season with salt and pepper before serving."
            ],
            prepTime: 10,
            cookTime: 20
        ),
        
        Recipe(
            thumbnailImagePath: "veg_stirfry",
            title: "Vegetable Stir-Fry",
            description: "Quick and colorful stir-fry with a variety of fresh vegetables.",
            ingredients: ["2 cups mixed vegetables (bell peppers, broccoli, carrots)", "2 tablespoons soy sauce", "1 tablespoon sesame oil", "1 teaspoon ginger", "1 teaspoon garlic", "Cooked rice or noodles"],
            steps: [
                "Heat sesame oil in a pan.",
                "Add garlic and ginger, sauté for 1 minute.",
                "Add mixed vegetables and stir-fry until tender.",
                "Pour in soy sauce and mix well.",
                "Serve over cooked rice or noodles."
            ],
            prepTime: 10,
            cookTime: 10
        ),
        
        Recipe(
            thumbnailImagePath: "beef_tacos",
            title: "Beef Tacos",
            description: "Flavorful tacos filled with seasoned ground beef and fresh toppings.",
            ingredients: ["1 pound ground beef", "Taco seasoning", "Taco shells", "Lettuce", "Tomato", "Cheese", "Sour cream"],
            steps: [
                "Cook ground beef in a skillet until browned.",
                "Add taco seasoning and water; simmer until thickened.",
                "Fill taco shells with beef mixture.",
                "Top with lettuce, tomato, cheese, and sour cream.",
                "Serve immediately."
            ],
            prepTime: 10,
            cookTime: 15
        ),
        
        Recipe(
            thumbnailImagePath: "caprese_salad",
            title: "Caprese Salad",
            description: "Fresh salad with mozzarella, tomatoes, basil, and a drizzle of balsamic vinegar.",
            ingredients: ["Fresh mozzarella", "Tomatoes", "Fresh basil", "Olive oil", "Balsamic vinegar", "Salt", "Pepper"],
            steps: [
                "Slice mozzarella and tomatoes.",
                "Layer mozzarella, tomatoes, and basil on a plate.",
                "Drizzle with olive oil and balsamic vinegar.",
                "Season with salt and pepper.",
                "Serve chilled."
            ],
            prepTime: 10,
            cookTime: 0
        ),
        
        Recipe(
            thumbnailImagePath: "shrimp_scampi",
            title: "Shrimp Scampi",
            description: "Succulent shrimp sautéed in garlic, butter, and white wine served over pasta.",
            ingredients: ["1 pound shrimp", "8 oz linguine", "4 cloves garlic", "1/2 cup white wine", "1/4 cup butter", "Parsley", "Lemon juice", "Salt", "Pepper"],
            steps: [
                "Cook linguine according to package instructions.",
                "Sauté garlic in butter until fragrant.",
                "Add shrimp and cook until pink.",
                "Pour in white wine and simmer for 2 minutes.",
                "Toss with linguine, parsley, and lemon juice before serving."
            ],
            prepTime: 10,
            cookTime: 10
        ),
        
        Recipe(
            thumbnailImagePath: "chili_con_carne",
            title: "Chili Con Carne",
            description: "Hearty stew made with ground beef, beans, and spices.",
            ingredients: ["1 pound ground beef", "1 can kidney beans", "1 can diced tomatoes", "1 onion", "Chili powder", "Cumin", "Salt", "Pepper"],
            steps: [
                "Cook onion and ground beef in a pot until browned.",
                "Add kidney beans, diced tomatoes, and spices.",
                "Simmer for 30 minutes.",
                "Serve hot with cornbread or rice."
            ],
            prepTime: 10,
            cookTime: 30
        )
    ]
}
