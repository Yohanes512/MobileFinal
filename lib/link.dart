import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Useful Links'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Visit Our Website'),
            onTap: () => _launchURL('https://www.yourappname.com'),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Contact Support'),
            onTap: () => _launchURL('mailto:support@yourappname.com'),
          ),
          ListTile(
            leading: const Icon(Icons.facebook),
            title: const Text('Follow on Facebook'),
            onTap: () => _launchURL('https://facebook.com/yourappname'),
          ),
          ListTile(
            leading: const Icon(Icons.video_library),
            title: const Text('Watch on YouTube'),
            onTap: () => _launchURL('https://youtube.com/@yourappname'),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Source Code on GitHub'),
            onTap: () => _launchURL('https://github.com/yourusername/yourrepo'),
          ),
        ],
      ),
    );
  }
}
