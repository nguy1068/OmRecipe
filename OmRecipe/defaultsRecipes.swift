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
        ),
        
        Recipe(
            thumbnailImagePath: "pancakes",
            title: "Fluffy Pancakes",
            description: "Light and fluffy pancakes perfect for breakfast.",
            ingredients: ["1 cup flour", "2 tablespoons sugar", "2 teaspoons baking powder", "1/2 teaspoon salt", "1 cup milk", "1 egg", "2 tablespoons melted butter"],
            steps: [
                "In a bowl, mix flour, sugar, baking powder, and salt.",
                "In another bowl, whisk milk, egg, and melted butter.",
                "Combine wet and dry ingredients until just mixed.",
                "Heat a pan and pour batter to form pancakes.",
                "Cook until bubbles form, then flip and cook until golden."
            ],
            prepTime: 10,
            cookTime: 15
        ),

        Recipe(
            thumbnailImagePath: "lasagna",
            title: "Classic Lasagna",
            description: "Layered pasta dish with meat, cheese, and marinara sauce.",
            ingredients: ["9 lasagna noodles", "1 pound ground beef", "2 cups marinara sauce", "15 oz ricotta cheese", "2 cups mozzarella cheese", "1/2 cup Parmesan cheese", "1 egg", "Salt", "Pepper"],
            steps: [
                "Cook lasagna noodles according to package instructions.",
                "Brown ground beef in a pan, then add marinara sauce.",
                "In a bowl, mix ricotta cheese, egg, salt, and pepper.",
                "Layer noodles, meat sauce, and cheese mixture in a baking dish.",
                "Top with mozzarella and Parmesan, then bake at 375°F for 30 minutes."
            ],
            prepTime: 20,
            cookTime: 45
        ),

        Recipe(
            thumbnailImagePath: "greek_salad",
            title: "Greek Salad",
            description: "Refreshing salad with cucumbers, tomatoes, olives, and feta cheese.",
            ingredients: ["Cucumbers", "Tomatoes", "Red onion", "Kalamata olives", "Feta cheese", "Olive oil", "Red wine vinegar", "Oregano", "Salt"],
            steps: [
                "Chop cucumbers, tomatoes, and red onion.",
                "In a bowl, combine vegetables, olives, and feta.",
                "Drizzle with olive oil and red wine vinegar.",
                "Season with oregano and salt, then toss gently.",
                "Serve immediately."
            ],
            prepTime: 10,
            cookTime: 0
        ),

        Recipe(
            thumbnailImagePath: "beef_stroganoff",
            title: "Beef Stroganoff",
            description: "Tender beef in a creamy mushroom sauce served over egg noodles.",
            ingredients: ["1 pound beef sirloin", "8 oz mushrooms", "1 onion", "2 cups beef broth", "1 cup sour cream", "2 tablespoons flour", "Egg noodles", "Salt", "Pepper"],
            steps: [
                "Cook egg noodles according to package instructions.",
                "Sauté onions and mushrooms in a pan.",
                "Add sliced beef and cook until browned.",
                "Stir in flour, then add beef broth and simmer.",
                "Mix in sour cream before serving over noodles."
            ],
            prepTime: 15,
            cookTime: 30
        ),

        Recipe(
            thumbnailImagePath: "banana_bread",
            title: "Banana Bread",
            description: "Moist and delicious banana bread perfect for breakfast or a snack.",
            ingredients: ["3 ripe bananas", "1/3 cup melted butter", "1 teaspoon baking soda", "Pinch of salt", "3/4 cup sugar", "1 egg", "1 teaspoon vanilla extract", "1 cup flour"],
            steps: [
                "Preheat oven to 350°F.",
                "Mash bananas in a bowl and mix in melted butter.",
                "Stir in baking soda and salt, then add sugar, egg, and vanilla.",
                "Mix in flour until just combined.",
                "Pour into a greased loaf pan and bake for 60 minutes."
            ],
            prepTime: 10,
            cookTime: 60
        ),

        Recipe(
            thumbnailImagePath: "vegetable_soup",
            title: "Vegetable Soup",
            description: "Hearty and healthy soup packed with fresh vegetables.",
            ingredients: ["2 carrots", "2 celery stalks", "1 onion", "2 potatoes", "4 cups vegetable broth", "1 can diced tomatoes", "Salt", "Pepper", "Herbs"],
            steps: [
                "Chop all vegetables into small pieces.",
                "Sauté onion, carrots, and celery in a pot.",
                "Add potatoes, diced tomatoes, and broth.",
                "Simmer until vegetables are tender.",
                "Season with salt, pepper, and herbs before serving."
            ],
            prepTime: 15,
            cookTime: 30
        ),

        Recipe(
            thumbnailImagePath: "stuffed_peppers",
            title: "Stuffed Peppers",
            description: "Bell peppers stuffed with a savory mixture of rice, meat, and spices.",
            ingredients: ["4 bell peppers", "1 pound ground turkey", "1 cup cooked rice", "1 can diced tomatoes", "1 onion", "1 teaspoon Italian seasoning", "Salt", "Pepper"],
            steps: [
                "Preheat oven to 375°F.",
                "Cut tops off bell peppers and remove seeds.",
                "Cook onion and ground turkey in a pan until browned.",
                "Mix in cooked rice, diced tomatoes, and seasonings.",
                "Stuff mixture into peppers and bake for 30 minutes."
            ],
            prepTime: 15,
            cookTime: 30
        ),

        Recipe(
            thumbnailImagePath: "chocolate_chip_cookies",
            title: "Chocolate Chip Cookies",
            description: "Classic cookies loaded with chocolate chips.",
            ingredients: ["1 cup butter", "1 cup sugar", "1 cup brown sugar", "2 eggs", "2 teaspoons vanilla", "3 cups flour", "1 teaspoon baking soda", "2 cups chocolate chips"],
            steps: [
                "Preheat oven to 350°F.",
                "Cream butter, sugar, and brown sugar together.",
                "Add eggs and vanilla, mixing well.",
                "Stir in flour and baking soda, then fold in chocolate chips.",
                "Drop spoonfuls onto a baking sheet and bake for 10-12 minutes."
            ],
            prepTime: 15,
            cookTime: 12
        ),

        Recipe(
            thumbnailImagePath: "quiche",
            title: "Vegetable Quiche",
            description: "Savory pie filled with eggs, cheese, and fresh vegetables.",
            ingredients: ["1 pie crust", "4 eggs", "1 cup milk", "1 cup mixed vegetables (spinach, bell peppers, onions)", "1 cup cheese", "Salt", "Pepper"],
            steps: [
                "Preheat oven to 375°F.",
                "Whisk eggs and milk in a bowl, season with salt and pepper.",
                "Spread vegetables and cheese in the pie crust.",
                "Pour egg mixture over the top.",
                "Bake for 30-35 minutes until set."
            ],
            prepTime: 15,
            cookTime: 35
        )

    ]
}
