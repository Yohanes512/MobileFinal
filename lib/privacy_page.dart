import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.teal,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Effective Date: July 11, 2025',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you use YourAppName.',
            ),
            SizedBox(height: 16),

            Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '- Personal Information: name, email, etc.\n'
              '- Usage Data: pages visited, features used, etc.\n'
              '- Device Info: device type, IP address, etc.',
            ),
            SizedBox(height: 16),

            Text(
              '3. How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We use your data to provide services, improve functionality, and communicate updates.',
            ),
            SizedBox(height: 16),

            Text(
              '4. Data Sharing and Disclosure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We do not sell your data. We may share information with trusted providers or as required by law.',
            ),
            SizedBox(height: 16),

            Text(
              '5. Cookies and Tracking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may use cookies to improve the user experience. You can disable them in your browser settings.',
            ),
            SizedBox(height: 16),

            Text(
              '6. Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We take appropriate security measures to protect your data.'),
            SizedBox(height: 16),

            Text(
              '7. Your Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You can request access, updates, or deletion of your personal data by contacting us.',
            ),
            SizedBox(height: 16),

            Text(
              '8. Children\'s Privacy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We do not knowingly collect data from users under 13.'),
            SizedBox(height: 16),

            Text(
              '9. Changes to This Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may update this policy from time to time. All updates will be posted here.',
            ),
            SizedBox(height: 16),

            Text(
              '10. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'If you have questions, contact us at: support@yourappname.com',
            ),
          ],
        ),
      ),
    );
  }
}
