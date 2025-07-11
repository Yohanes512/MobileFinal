import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'friedrice.dart';

class Pizza extends StatelessWidget {
  const Pizza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MorphingAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text('Pizza'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'food2.jpeg', // Replace with your pizza image
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
                  "PIZZA",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("Mario", style: TextStyle(fontSize: 14)),
                    SizedBox(width: 6),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('profile.jpg'),
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
            const Text("• 2 1/2 cups of all-purpose flour"),
            const Text("• 1 cup of warm water"),
            const Text("• 1 tsp yeast"),
            const Text("• 1/2 cup pizza sauce"),
            const Text("• 1 cup shredded mozzarella cheese"),
            const SizedBox(height: 20),
            const Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              "• In a bowl, mix flour, water, and yeast. Let it rise.",
            ),
            const Text("• Roll out dough and place on a pizza tray."),
            const Text("• Spread sauce and add cheese."),
            const Text("• Bake at 220°C (425°F) for 15–20 minutes."),
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
                    SwipeablePageRoute(builder: (context) => const FriedRice()),
                  );
                },
                child: const Text("Go to Fried Rice"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
