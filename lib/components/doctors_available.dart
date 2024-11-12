import 'package:careconnect/components/time.dart';
import 'package:flutter/material.dart';

class DoctorsAvailable extends StatefulWidget {
  final String name;
  final String image;
  const DoctorsAvailable({super.key, required this.name, required this.image});

  @override
  State<DoctorsAvailable> createState() => _DoctorsAvailableState();
}

class _DoctorsAvailableState extends State<DoctorsAvailable> {
  int selectedTimeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/${widget.image}'),
                      radius: 26,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.star,
                              color: Colors.amber[700],
                            ),
                            Text(
                              '5.0',
                              style: TextStyle(
                                color: Colors.amber[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Text(
                          '10+ years experienced',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(4, (index) {
                return Time(
                    time: ['8:00', '9:00', '10:00', '14:00'][index],
                    isSelected: selectedTimeIndex == index,
                    onTap: () {
                      setState(() {
                        selectedTimeIndex = index;
                      });
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
