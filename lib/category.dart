import 'package:flutter/material.dart';

class Recipe {
  final String title;
  final String imagePath;
  final String description;

  Recipe({
    required this.title,
    required this.imagePath,
    required this.description,
  });
}

List<Recipe> breakfastRecipes = [
  Recipe(
    title: 'Avocado Toast',
    imagePath: 'food1.jpg',
    description: 'Crispy toast with avocado and seasoning.',
  ),
  Recipe(
    title: 'Pancakes',
    imagePath: 'food2.jpeg',
    description: 'Fluffy pancakes with syrup.',
  ),
];

List<Recipe> lunchRecipes = [
  Recipe(
    title: 'Grilled Chicken',
    imagePath: 'food1.jpg',
    description: 'Chicken breast with veggies.',
  ),
];

List<Recipe> dinnerRecipes = [
  Recipe(
    title: 'Spaghetti Bolognese',
    imagePath: 'food2.jpeg',
    description: 'Pasta with beef sauce.',
  ),
];

List<Recipe> dessertRecipes = [
  Recipe(
    title: 'Ice Cream Sundae',
    imagePath: 'food1.jpg',
    description: 'Scoops of ice cream with toppings.',
  ),
];

class CategoryRecipePage extends StatelessWidget {
  final String categoryTitle;
  final List<Recipe> recipes;

  const CategoryRecipePage({
    super.key,
    required this.categoryTitle,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  recipe.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(recipe.title),
              subtitle: Text(recipe.description),
            ),
          );
        },
      ),
    );
  }
}
