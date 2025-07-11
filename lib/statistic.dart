import 'package:flutter/material.dart';

class RecipeStatPage extends StatefulWidget {
  const RecipeStatPage({super.key});

  @override
  State<RecipeStatPage> createState() => _RecipeStatPageState();
}

class _RecipeStatPageState extends State<RecipeStatPage> {
  double _ratingThreshold = 3.0;

  final List<Map<String, dynamic>> recipes = [
    {'title': 'Sushi', 'likes': 150, 'rating': 4.5},
    {'title': 'Pizza', 'likes': 120, 'rating': 3.7},
    {'title': 'Rendang', 'likes': 300, 'rating': 4.9},
    {'title': 'Salad', 'likes': 80, 'rating': 2.9},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredRecipes =
        recipes
            .where((recipe) => recipe['rating'] >= _ratingThreshold)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Statistics"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Minimum Rating", style: TextStyle(fontSize: 18)),
                Slider(
                  value: _ratingThreshold,
                  min: 0,
                  max: 5,
                  divisions: 10,
                  label: _ratingThreshold.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _ratingThreshold = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Filtered List
            Expanded(
              child:
                  filteredRecipes.isEmpty
                      ? const Center(child: Text("No recipes found."))
                      : ListView.builder(
                        itemCount: filteredRecipes.length,
                        itemBuilder: (context, index) {
                          final recipe = filteredRecipes[index];
                          return Card(
                            child: ListTile(
                              title: Text(recipe['title']),
                              subtitle: Text(
                                'Likes: ${recipe['likes']} • Rating: ${recipe['rating']}',
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
