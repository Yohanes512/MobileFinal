import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'sushi.dart'; // Make sure this import exists

class Burger extends StatelessWidget {
  const Burger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MorphingAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text('Burger'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'food3.jpg', //
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
                  "BURGER",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text(
                      "Alex",
                      style: TextStyle(fontSize: 14),
                    ), // ✅ Name updated
                    SizedBox(width: 6),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage(
                        'profile.jpg',
                      ), // ✅ Change to your new profile image
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
            const Text("• 2 beef patties"),
            const Text("• 2 burger buns"),
            const Text("• Lettuce, tomato, onion slices"),
            const Text("• Cheese slices"),
            const Text("• Ketchup and mayonnaise"),
            const SizedBox(height: 20),
            const Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text("• Grill beef patties until fully cooked"),
            const Text("• Toast burger buns lightly on a pan"),
            const Text(
              "• Assemble with lettuce, tomato, onions, patties, cheese",
            ),
            const Text("• Add ketchup and mayonnaise to taste"),
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

            // 🟢 Navigation Button to Pizza
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SwipeablePageRoute(builder: (context) => const Sushi()),
                  );
                },
                child: const Text("Go to Sushi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
