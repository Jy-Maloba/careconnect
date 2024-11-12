import 'package:careconnect/constants.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'InfoPage',
          style: TextStyle(fontSize: 32, color: secondaryLight),

        ),
      ),
    );
  }
}
