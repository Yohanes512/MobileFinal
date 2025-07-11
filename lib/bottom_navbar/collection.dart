import 'package:flutter/material.dart';
import 'package:project_1/sushi.dart';
import 'package:project_1/dynamic_page.dart';
import 'package:project_1/recipe_data.dart'; // Contains Recipe and userRecipes

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  final listFilter = <ItemFilter>[
    ItemFilter(1, 'Favorite Recipe'),
    ItemFilter(2, 'My Recipe'),
  ];

  final listProduct = <ItemProduct>[
    ItemProduct(
      name: 'Sushi',
      photo: 'food1.jpg',
      desc: 'Fav',
      tags: [1], // Favorite Recipe
    ),
    ItemProduct(
      name: 'Egg Fried Rice',
      photo: 'food1.jpg',
      desc: 'Your Recipe',
      tags: [2], // My Recipe (static)
    ),
  ];

  List<ItemProduct> get staticFilteredProducts {
    final activeFilters = listFilter
        .where((filter) => filter.isSelected)
        .map((f) => f.id);

    if (activeFilters.isEmpty || activeFilters.contains(1)) {
      return listProduct.where((p) => p.tags.contains(1)).toList();
    }

    return [];
  }

  List<Recipe> get dynamicFilteredRecipes {
    final activeFilters = listFilter
        .where((filter) => filter.isSelected)
        .map((f) => f.id);

    if (activeFilters.isEmpty || activeFilters.contains(2)) {
      return userRecipes;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final hasStatic = staticFilteredProducts.isNotEmpty;
    final hasDynamic = dynamicFilteredRecipes.isNotEmpty;

    final totalItems =
        staticFilteredProducts.length + dynamicFilteredRecipes.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting and Profile Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Patrick',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Welcome to your collection',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(backgroundImage: AssetImage('profile.jpg')),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search your collection',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              spacing: 8,
              children:
                  listFilter.map((filter) {
                    return FilterChip(
                      label: Text(filter.name),
                      selected: filter.isSelected,
                      onSelected: (selected) {
                        setState(() => filter.isSelected = selected);
                      },
                      labelStyle: const TextStyle(color: Colors.black),
                      checkmarkColor: Colors.black,
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Your Collection',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Combined Recipe List
          totalItems == 0
              ? const Padding(
                padding: EdgeInsets.all(16),
                child: Text("No recipes found."),
              )
              : SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12, bottom: 8),
                  children: [
                    ...staticFilteredProducts.map(
                      (item) => _buildStaticCard(item, context),
                    ),
                    ...dynamicFilteredRecipes.map(
                      (recipe) => _buildDynamicCard(recipe, context),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildStaticCard(ItemProduct item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Sushi()),
        );
      },
      child: _buildCard(item.name, item.photo, item.desc),
    );
  }

  Widget _buildDynamicCard(Recipe recipe, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DynamicRecipePage(recipe: recipe),
          ),
        );
      },
      child: _buildCard(recipe.title, recipe.imagePath, 'Your Recipe'),
    );
  }

  Widget _buildCard(String title, String imagePath, String subtitle) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(subtitle),
          ),
        ],
      ),
    );
  }
}

class ItemFilter {
  final int id;
  final String name;
  bool isSelected;

  ItemFilter(this.id, this.name, [this.isSelected = false]);
}

class ItemProduct {
  final String name;
  final String photo;
  final String desc;
  final List<int> tags;

  ItemProduct({
    required this.name,
    required this.photo,
    required this.desc,
    required this.tags,
  });
}
