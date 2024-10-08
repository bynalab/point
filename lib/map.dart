// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            options: MapOptions(
              backgroundColor: Colors.black,
              // initialCenter: LatLng(51.509364, -0.128928),
              initialZoom: 5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.bynalab.point',
              ),
              MarkerLayer(
                markers: const [
                  Marker(
                    point: LatLng(30, 40),
                    width: 80,
                    height: 80,
                    child: FlutterLogo(),
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
                          duration: Duration(seconds: 1),
                          repeat: true,
                          child: TextField(
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
                      // SizedBox(width: 10),
                      Expanded(
                        child: ZoomIn(
                          globalKey: GlobalKey(),
                          duration: Duration(seconds: 1),
                          repeat: true,
                          child: CircleAvatar(
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
                                  duration: Duration(seconds: 1),
                                  repeat: true,
                                  child: !showLayerMenu
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(
                                                () => showLayerMenu = true);
                                          },
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.white70,
                                            child: Icon(
                                              Icons.stacked_bar_chart,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ),
                                if (showLayerMenu)
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.symmetric(vertical: 20),
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(Iconsax.security_user),
                                              SizedBox(width: 10),
                                              Text('Cosy areas'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          color: Colors.transparent,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.wallet_outlined),
                                              SizedBox(width: 10),
                                              Text('Price'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          color: Colors.transparent,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(Iconsax.security_user),
                                              SizedBox(width: 10),
                                              Text('Infrastructure'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
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
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Row(
                                              children: const [
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
                                      // controller.repeat(reverse: true);
                                    },
                                  ).fadeIn(
                                    duration: Duration(milliseconds: 500),
                                  )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ZoomIn(
                                  globalKey: GlobalKey(),
                                  duration: Duration(seconds: 1),
                                  repeat: true,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
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
                                  duration: Duration(seconds: 1),
                                  repeat: true,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
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
                    SizedBox(height: 115),
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
