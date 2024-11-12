import 'package:careconnect/constants.dart';
import 'package:flutter/material.dart';

class Specialities extends StatelessWidget {
  final String? image;
  final String? name;
  final bool isSelected;
  final VoidCallback onTap;
  const Specialities(
      {super.key,
      required this.image,
      required this.name,
      required this.isSelected,
      required this.onTap});

  // final bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    Color borderColor = isSelected ? secondaryLight : Colors.white;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: borderColor, width: 3),
                image: DecorationImage(
                    image: AssetImage('images/$image'),
                    onError: (exception, stackTrace) =>
                        const AssetImage('images/doctor.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22)),
              child: Text(
                name ?? 'Unknown',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: secondaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            )
        ],
      ),
    );
  }
}
