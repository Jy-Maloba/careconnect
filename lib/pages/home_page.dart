import 'dart:math';

import 'package:careconnect/components/dates.dart';
import 'package:careconnect/components/doctors_available.dart';
import 'package:careconnect/components/specialities.dart';
import 'package:careconnect/constants.dart';
import 'package:careconnect/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool online = true;
  int value = 1;

  int selectedSpecialIndex = 0; //for speciality selection
  int selectedDateIndex = 3; // for date selection

  List<Map<String, String>> specialityList = [
    {'image': 'oculist.jpg', 'name': 'Oculist'},
    {'image': 'dentist.jpeg', 'name': 'Dentist'},
    {'image': 'neurologist.jpeg', 'name': 'Neurologist'},
    {'image': 'cardiologist.jpeg', 'name': 'Cardiologist'},
    {'image': 'dermatologist.jpeg', 'name': 'Dermatologist'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header with profile info and icons
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('images/arina.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Arina Denver',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Female, 25 y.o',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.search, size: 32),
                        SizedBox(width: 10),
                        Icon(Icons.notifications, size: 32),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),

              //online offline toggle
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  height: 32,
                  width: double.infinity,
                  child: AnimatedToggleSwitch<int>.size(
                    current: min(value, 2),
                    style: ToggleStyle(
                      backgroundColor: Colors.white,
                      indicatorColor:
                          value == 0 ? secondaryLight : Colors.black,
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(16.0),
                      indicatorBorderRadius: BorderRadius.circular(16),
                    ),
                    values: const [0, 1],
                    iconOpacity: 1.0,
                    selectedIconScale: 1.0,
                    indicatorSize: const Size.fromWidth(200),
                    iconAnimationType: AnimationType.onHover,
                    styleAnimationType: AnimationType.onHover,
                    spacing: 1.0,
                    customIconBuilder: (context, local, global) {
                      final text = const ['Online', 'Offline'][local.index];
                      return Center(
                          child: Text(text,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.lerp(Colors.black, Colors.white,
                                      local.animationValue))));
                    },
                    borderWidth: 0.0,
                    onChanged: (i) => setState(() => value = i),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              //speciality - see all text
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Speciality',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 14,
                          color: secondaryLight,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              //specialist images list
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specialityList.length,
                  itemBuilder: (context, index) {
                    return Specialities(
                      image: specialityList[index]['image'],
                      name: specialityList[index]['name'],
                      isSelected: selectedSpecialIndex == index,
                      onTap: () {
                        setState(() {
                          selectedSpecialIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today 6 June',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.calendar_month_outlined)
                  ],
                ),
              ),

              const SizedBox(height: 8),
              Row(
                children: List.generate(7, (index) {
                  return Dates(
                      day: ['S', 'M', 'T', 'W', 'T', 'F', 'S'][index],
                      date: (5 + index).toString(),
                      isSelected: selectedDateIndex == index,
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      });
                }),
              ),
              const SizedBox(height: 15),
              //Doctors
              const Text(
                'Doctors',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DoctorsAvailable(name: 'Vinny Vang', image: 'vinny.jpg'),
                    DoctorsAvailable(name: 'Sam Ayrton', image: 'sam.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Appointments

              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: secondaryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '7 June 9:00 AM',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Appointments',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
