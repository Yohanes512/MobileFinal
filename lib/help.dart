import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.teal,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Text(
              'Q: How do I create a new recipe?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'A: Go to the Recipe tab and tap the "+" button to open the recipe form. Fill out the required fields and submit.',
            ),
            SizedBox(height: 12),

            Text(
              'Q: Can I edit or delete a recipe?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'A: At this time, editing and deleting is only available for your own recipes. Tap on a recipe, then use the options in the top-right menu.',
            ),
            SizedBox(height: 12),

            Text(
              'Q: I forgot my password. What should I do?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'A: On the login screen, tap "Forgot password?" and follow the instructions to reset it.',
            ),
            SizedBox(height: 24),

            Text(
              'Need More Help?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'If your question is not listed, feel free to contact our support team.',
            ),
            SizedBox(height: 8),

            Text('📧 Email: support@yourappname.com'),
            Text('📞 Phone: +62-812-3456-7890'),
            Text('🌐 Website: www.yourappname.com/help'),
          ],
        ),
      ),
    );
  }
}
