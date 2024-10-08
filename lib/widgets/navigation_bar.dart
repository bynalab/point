import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int)? onSelect;

  const CustomNavigationBar({super.key, this.currentIndex = 2, this.onSelect});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 2;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.onSelect?.call(index);
  }

  Color backgroundColor(int index) {
    return index == currentIndex ? const Color(0xFFFFA500) : Colors.black12;
  }

  double radius(int index) {
    return index == currentIndex ? 28 : 24;
  }

  @override
  Widget build(BuildContext context) {
    final icons = [
      Iconsax.search_normal,
      Iconsax.message5,
      Iconsax.home_1,
      Iconsax.heart5,
      Iconsax.user
    ];

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          return GestureDetector(
            onTap: () => setIndex(index),
            child: AnimatedSwitcher(
              duration: const Duration(microseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              // curve: Curves.easeInOut,
              child: CircleAvatar(
                key: ValueKey<int>(index == widget.currentIndex ? 1 : 0),
                radius: radius(index),
                backgroundColor: backgroundColor(index),
                child: Icon(
                  icons[index],
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
