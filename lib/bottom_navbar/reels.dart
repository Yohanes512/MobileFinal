import 'package:flutter/material.dart';
import 'package:project_1/sushi.dart';
import 'dart:ui';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  final items = List.generate(
    20,
    (i) => {'image': 'food1.jpg', 'caption': 'Item ${i + 1}'},
  );

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
                  'Will you find your recipe on the reels?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('Swipe right or left', style: TextStyle(fontSize: 11)),
              ],
            ),
            CircleAvatar(backgroundImage: AssetImage('profile.jpg')),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Center(
              child: Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 100,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.deepPurple[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _ImageCard(item['image']!, item['caption']!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

class _ImageCard extends StatelessWidget {
  final String imagePath;
  final String caption;

  const _ImageCard(this.imagePath, this.caption, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Sushi()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 140,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            caption,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
