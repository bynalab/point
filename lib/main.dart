import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:point/screens/home_screen.dart';
import 'package:point/screens/map_screen.dart';
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
    const StackedScrollScreen(),
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

class StackedScrollScreen extends StatefulWidget {
  const StackedScrollScreen({super.key});

  @override
  State<StackedScrollScreen> createState() => _StackedScrollScreenState();
}

class _StackedScrollScreenState extends State<StackedScrollScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const overlapThreshold = 100.0;
    final opacity = (_scrollOffset / overlapThreshold).clamp(0.0, 1.0);
    final topPosition =
        (overlapThreshold - _scrollOffset).clamp(0.0, overlapThreshold);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 300,
                  color: Colors.blueAccent,
                  child: const Center(
                    child: Text(
                      'Scroll Up',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 1000,
                  color: Colors.greenAccent,
                  child: const Center(
                    child: Text(
                      'Additional Content',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: topPosition,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: _scrollOffset < overlapThreshold,
              child: Opacity(
                opacity: opacity,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: 300,
                    color: Colors.amberAccent,
                    child: const Center(
                      child: Text(
                        'Hidden Widget',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
