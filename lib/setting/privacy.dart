import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This privacy policy explains how we collect, use, and protect your personal information when you use our application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '1. Information Collection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may collect personal information such as name, email, and other details you provide while using our services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '2. Use of Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use your information to provide better service, improve our features, and communicate updates or changes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '3. Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We implement appropriate security measures to protect your data from unauthorized access or disclosure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '4. Changes to Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our privacy policy from time to time. We encourage you to review it periodically.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '5. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions regarding this policy, please contact us at support@example.com.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Last updated: June 4, 2025',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
