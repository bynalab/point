import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showLayerMenu = false;
  AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              backgroundColor: Colors.black,
              initialCenter: LatLng(59.9343, 30.3351),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.bynalab.point',
              ),
              const MarkerLayer(
                markers: [
                  CustomMaker(
                    point: LatLng(59.9445, 30.3350),
                    child: CustomerMakerItem(
                      distance: '10,3 mn P',
                    ),
                  ),
                  CustomMaker(
                    point: LatLng(59.9349, 30.3420),
                    child: CustomerMakerItem(
                      distance: '11 mn P',
                    ),
                  ),
                  CustomMaker(
                    point: LatLng(59.9345, 30.3580),
                    child: CustomerMakerItem(
                      distance: '7,8 mn P',
                    ),
                  ),
                  CustomMaker(
                    point: LatLng(59.9200, 30.3070),
                    child: CustomerMakerItem(
                      distance: '13,3 mn P',
                    ),
                  ),
                  CustomMaker(
                    point: LatLng(59.9348, 30.3158),
                    child: CustomerMakerItem(
                      distance: '8,5 mn P',
                    ),
                  ),
                  CustomMaker(
                    point: LatLng(59.9410, 30.3141),
                    child: CustomerMakerItem(
                      distance: '6,95 mn P',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ZoomIn(
                          globalKey: GlobalKey(),
                          duration: const Duration(seconds: 1),
                          repeat: true,
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Saint Petersburg',
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Iconsax.search_normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ZoomIn(
                          globalKey: GlobalKey(),
                          duration: const Duration(seconds: 1),
                          repeat: true,
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.sort),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ZoomIn(
                                  globalKey: GlobalKey(),
                                  duration: const Duration(seconds: 1),
                                  repeat: true,
                                  child: !showLayerMenu
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(
                                                () => showLayerMenu = true);
                                          },
                                          child: const CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.white70,
                                            child: Icon(
                                              Icons.stacked_bar_chart,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                                if (showLayerMenu)
                                  Container(
                                    width: 200,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(Iconsax.security_user),
                                              SizedBox(width: 10),
                                              Text('Cosy areas'),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          color: Colors.transparent,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(Icons.wallet_outlined),
                                              SizedBox(width: 10),
                                              Text('Price'),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          color: Colors.transparent,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(Iconsax.security_user),
                                              SizedBox(width: 10),
                                              Text('Infrastructure'),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            controller
                                                ?.reverse()
                                                .whenComplete(() {
                                              setState(() {
                                                showLayerMenu = false;
                                              });
                                            });
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: const Row(
                                              children: [
                                                Icon(Iconsax.security_user),
                                                SizedBox(width: 10),
                                                Text('Without any layer'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animate(
                                    onPlay: (controller) {
                                      this.controller = controller;
                                    },
                                  ).fadeIn(
                                    duration: const Duration(milliseconds: 500),
                                  )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ZoomIn(
                                  globalKey: GlobalKey(),
                                  duration: const Duration(seconds: 1),
                                  repeat: true,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white70,
                                      child: Icon(
                                        Icons.arrow_outward_rounded,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                ZoomIn(
                                  globalKey: GlobalKey(),
                                  duration: const Duration(seconds: 1),
                                  repeat: true,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.sort,
                                          size: 20,
                                          color: Color(0xFFA5957E),
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          'List of variants',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFA5957E),
                                          ),
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
                    const SizedBox(height: 115),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerMakerItem extends StatelessWidget {
  final String distance;
  const CustomerMakerItem({super.key, required this.distance});

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      globalKey: GlobalKey(),
      delay: const Duration(seconds: 1),
      repeat: true,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.amber[700],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Text(
          distance,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomMaker extends Marker {
  const CustomMaker({
    required super.point,
    required super.child,
    super.height = 40,
    super.width = 70,
  });
}
