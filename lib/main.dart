import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:point/home.dart';
import 'package:point/map.dart';
import 'package:point/widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currenIndex = 2;

  final screens = [
    const MapScreen(),
    const AnimatedScrollOverlayPage(),
    const HomeScreen(),
    const SizedBox.shrink(),
    const SizedBox.shrink(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Euclid',
      ),
      home: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screens[currenIndex],
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30, left: 50, right: 50),
            child: SlideInUp(
              globalKey: GlobalKey(),
              duration: 1.seconds,
              repeat: true,
              child: CustomNavigationBar(
                currentIndex: currenIndex,
                onSelect: (index) {
                  setState(() {
                    currenIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedScrollOverlayPage extends StatefulWidget {
  const AnimatedScrollOverlayPage({super.key});

  @override
  State<AnimatedScrollOverlayPage> createState() =>
      _AnimatedScrollOverlayPageState();
}

class _AnimatedScrollOverlayPageState extends State<AnimatedScrollOverlayPage>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-1.5, 0)) //negative to go upwards
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: animation,
              child: Transform.scale(
                scale: 0.7,
                child: Container(
                  // height: 100,
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      const Text('Abuja Standard'),
                      const CircleAvatar(
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
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: TextButton(
              child: const Text('Animate'),
              onPressed: () {
                //the button that trigger the animation
                if (animation.status == AnimationStatus.completed) {
                  animationController.reverse();
                } else if (animation.status == AnimationStatus.dismissed) {
                  animationController.forward();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
