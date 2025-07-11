import 'dart:async';
import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import 'package:project_1/login.dart'; // Update the path if needed

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    // Delay for 2 seconds then navigate to LoginScreen
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('landing_page.jpg', fit: BoxFit.cover),

          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0), // Required for BackdropFilter
            ),
          ),

          // Overlay content (logo + spinner + text)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('logo.png', width: 500),
              const SizedBox(height: 24),
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(height: 12),
              const Text(
                "Loading...",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
