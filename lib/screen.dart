import 'package:flutter/material.dart';
import 'package:instastoryapp/storyPage.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoryPage(),
      ),
    );
  }
}
