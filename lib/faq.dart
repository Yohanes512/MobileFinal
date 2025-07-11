import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How do I create and publish a recipe?',
      'answer': '''
To create a recipe, follow these steps:

1. Go to the **Recipe Form** page.
2. Enter your **Menu Name** (e.g., “Spicy Ramen”).
3. Write a **Description** of your dish and your thoughts about it.
4. Add your **Ingredients**. You can tap "Add new ingredient" to input more.
5. Add **Steps** for how to prepare the recipe. Each step can also include an image using the upload button.
6. Optionally, upload a **Video** for the recipe.
7. Upload an **Image Thumbnail** that represents your dish.
8. When you're done, tap the **"Publish"** button.

After publishing:
- Your recipe will be saved to the recipe list.
- You’ll see a confirmation SnackBar.
- Then, it will automatically navigate you to the recipe’s own page.

Happy cooking! 🍳
''',
    },
    {
      'question': 'Can I edit a recipe after publishing?',
      'answer':
          'Currently, editing a recipe is not supported. You can delete and recreate it if needed.',
    },
    {
      'question': 'Where do my recipes appear after publishing?',
      'answer':
          'Published recipes appear in the “Newest Recipe” section and the “My Recipes” collection screen.',
    },
    {
      'question': 'How many ingredients or steps can I add?',
      'answer':
          'You can add as many ingredients or steps as you need. Just tap “Add new ingredient” or “Add new steps”.',
    },
    {
      'question': 'Is uploading an image or video required?',
      'answer':
          'No, but uploading at least a thumbnail image makes your recipe more attractive and easier to recognize.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return ExpansionTile(
            title: Text(
              faq['question']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Text(
                  faq['answer']!,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
