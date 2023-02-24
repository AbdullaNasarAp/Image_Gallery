import 'package:assignment_thebrewapps/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(
          title: "Gallery",
          ls: 0,
          fontwght: FontWeight.bold,
          fontsz: 25,
        ),
      ),
    );
  }
}
