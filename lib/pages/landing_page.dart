import 'package:careconnect/constants.dart';
import 'package:careconnect/pages/bottom_navBar.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  final String landingPageText = '''Book your
Doctor any
Time, anywhere.''';
  final TextStyle landingTextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 420,
            decoration: const BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              image: DecorationImage(image: AssetImage('images/doc.png')),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //just 2 clicks
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'JUST TWO CLICKS*',
                        style: TextStyle(color: Colors.grey[500], fontSize: 10),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.fiber_manual_record,
                            color: Colors.grey,
                            size: 14,
                          ),
                          const Icon(
                            Icons.fiber_manual_record,
                            color: Colors.grey,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            height: 8,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //Book your Doctor any Time, anywhere.
                  Text(
                    landingPageText,
                    style: landingTextStyle,
                  ),

                  const SizedBox(height: 18),

                  GestureDetector(
                    onTap: () {
                      //get started
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavbar()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 370,
                          decoration: BoxDecoration(
                              color: secondaryLight,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
