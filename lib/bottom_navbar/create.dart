import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_1/recipe_data.dart';
import 'package:project_1/dynamic_page.dart';

class RecipeFormPage extends StatefulWidget {
  const RecipeFormPage({super.key});

  @override
  State<RecipeFormPage> createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends State<RecipeFormPage> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<TextEditingController> ingredients = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> steps = [
    TextEditingController(),
    TextEditingController(),
  ];

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void addIngredient() {
    setState(() {
      ingredients.add(TextEditingController());
    });
  }

  void addStep() {
    setState(() {
      steps.add(TextEditingController());
    });
  }

  Widget uploadButton() {
    return GestureDetector(
      onTap: () async {
        final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            _pickedImage = File(pickedFile.path);
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            _pickedImage == null
                ? const Icon(Icons.camera_alt, size: 40)
                : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _pickedImage!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Patrick',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  'What recipe would you like to make today?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            CircleAvatar(backgroundImage: AssetImage('profile.jpg')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Menu name
            TextField(
              controller: menuNameController,
              decoration: InputDecoration(
                hintText: "Menu Name",
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "Write your description for your menu and your honest feeling on it!",
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Ingredients
            const Text(
              "Ingredient",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...ingredients.asMap().entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: entry.value,
                  decoration: InputDecoration(
                    hintText: "Ingredient ${entry.key + 1}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: addIngredient,
                child: const Text("Add new ingredient"),
              ),
            ),

            // Steps
            const SizedBox(height: 20),
            const Text("Steps", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...steps.asMap().entries.map(
              (entry) => Column(
                children: [
                  TextField(
                    controller: entry.value,
                    decoration: InputDecoration(
                      hintText: "Step ${entry.key + 1}",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: addStep,
                child: const Text("Add new steps"),
              ),
            ),

            // Upload Image
            const SizedBox(height: 16),
            const Text(
              "Upload Image ( Menu Thumbnail )",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            uploadButton(),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final newRecipe = Recipe(
                  title: menuNameController.text,
                  description: descriptionController.text,
                  ingredients: ingredients.map((e) => e.text).toList(),
                  steps: steps.map((e) => e.text).toList(),
                  imagePath: _pickedImage?.path ?? 'food1.jpg',
                );

                userRecipes.add(newRecipe);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Publish finish'),
                    duration: Duration(seconds: 2),
                  ),
                );

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DynamicRecipePage(recipe: newRecipe),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Publish"),
            ),
          ],
        ),
      ),
    );
  }
}
