import 'package:careconnect/constants.dart';
import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final VoidCallback onTap;
  const Dates(
      {super.key,
      required this.day,
      required this.date,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color dateBackgroundColor = isSelected ? secondaryLight : Colors.white;
    Color dateColor = isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: dateBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(fontSize: 14, color: dateColor),
            ),
            Text(date,
                style: TextStyle(
                    fontSize: 14,
                    color: dateColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
