import 'package:flutter/material.dart';
import 'package:test_app/view/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(
          name: "Hi,Welcome",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
