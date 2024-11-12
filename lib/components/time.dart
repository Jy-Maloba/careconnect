import 'package:careconnect/constants.dart';
import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;
  const Time(
      {super.key,
      required this.time,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color timeBackgroundColor = isSelected ? secondaryLight : Colors.white;
    Color? timeColor = isSelected ? Colors.white : Colors.grey[700];
    Border timeBorder = isSelected
        ? Border.all(width: 2, color: secondaryLight)
        : Border.all(color: Colors.grey, width: 2);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            border: timeBorder,
            borderRadius: BorderRadius.circular(12),
            color: timeBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
          child: Text(
            time,
            style: TextStyle(fontSize: 14, color: timeColor),
          ),
        ),
      ),
    );
  }
}
