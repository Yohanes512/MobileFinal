import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'burger.dart'; // Make sure this import exists

class FriedRice extends StatelessWidget {
  const FriedRice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MorphingAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text('Fried Rice'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'food4.jpg', //
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "FRIED RICE",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("Emily", style: TextStyle(fontSize: 14)),
                    SizedBox(width: 6),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage(
                        'profile.jpg',
                      ), // ✅ New profile image
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Ingredients:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text("• 2 cups of cooked rice"),
            const Text("• 1 egg"),
            const Text("• 2 cloves garlic, minced"),
            const Text("• 1/4 cup mixed vegetables"),
            const Text("• 2 tbsp soy sauce"),
            const Text("• Salt & pepper to taste"),
            const SizedBox(height: 20),
            const Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text("• Heat oil in a wok and sauté garlic until fragrant"),
            const Text("• Add egg and scramble it"),
            const Text("• Stir in vegetables and cook for 2 minutes"),
            const Text("• Add rice and soy sauce, stir-fry evenly"),
            const Text("• Season with salt and pepper, mix well"),
            const SizedBox(height: 12),
            const Divider(),
            const Text(
              "Comment",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SwipeablePageRoute(builder: (context) => const Burger()),
                  );
                },
                child: const Text("Go to Burger"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
