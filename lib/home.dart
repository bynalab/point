// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Color(0xFFF6E8D8), // Soft beige
            Color(0xFFFFF8EF), // Light cream
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: context.scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideInLeft(
                            globalKey: GlobalKey(),
                            duration: 2.seconds,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Iconsax.location5,
                                    size: 20,
                                    color: Color(0xFFA5957E),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'Saint Petersburg',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0,
                                      color: Color(0xFFA5957E),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ZoomIn(
                            globalKey: GlobalKey(),
                            repeat: true,
                            duration: 1.seconds,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.amber[700],
                              backgroundImage: AssetImage('images/db.jpeg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi, Marina',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFA5957E),
                            ),
                          ),
                          SlideInUp(
                            globalKey: GlobalKey(),
                            duration: 1.seconds,
                            child: Text(
                              'let\'s select your perfect place',
                              style: TextStyle(
                                fontSize: 36,
                                height: 1,
                                color: Color(0xFF232220),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ZoomIn(
                        globalKey: GlobalKey(),
                        repeat: true,
                        duration: 1.seconds,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.1,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber[700],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BUY',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0, end: 1034),
                                      duration: Duration(seconds: 1),
                                      builder: (_, value, __) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      'offers',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ZoomIn(
                        globalKey: GlobalKey(),
                        repeat: true,
                        duration: 1.seconds,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.1,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white70,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'RENT',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFA5957E),
                                  ),
                                ),
                                Column(
                                  children: [
                                    TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0, end: 2212),
                                      duration: Duration(seconds: 1),
                                      builder: (_, value, __) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFFA5957E),
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      'offers',
                                      style: TextStyle(
                                        color: Color(0xFFA5957E),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SlideInUp(
                    globalKey: GlobalKey(),
                    duration: 500.milliseconds,
                    repeat: true,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          DecoratedImageContainer(
                            imagePath: 'images/13.jpeg',
                            location: 'Gladkova St., 25',
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'images/002.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 5,
                                        left: 10,
                                        right: 10,
                                      ),
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Text('Trefovela St., 43'),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'images/002.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: 5,
                                            left: 10,
                                            right: 10,
                                          ),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              Text('Trefovela St., 43'),
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'images/003.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: 5,
                                            left: 10,
                                            right: 10,
                                          ),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              Text('Trefovela St., 43'),
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DecoratedImageContainer extends StatelessWidget {
  final String imagePath;
  final String location;

  const DecoratedImageContainer({
    super.key,
    required this.imagePath,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(imagePath),
        ),
        SlideInLeft(
          globalKey: GlobalKey(),
          repeat: true,
          duration: 1.seconds,
          child: Container(
            margin: EdgeInsets.only(
              bottom: 10,
              left: 20,
              right: 20,
            ),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(location),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
