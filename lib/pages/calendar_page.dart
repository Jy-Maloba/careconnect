import 'package:careconnect/constants.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'CalendarPage',
          style: TextStyle(fontSize: 32, color: secondaryLight),
        ),
      ),
    );
  }
}
