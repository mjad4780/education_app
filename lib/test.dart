import 'package:flutter/material.dart';

class Launching extends StatelessWidget {
  const Launching({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 428,
          height: 926,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 428,
                  height: 926,
                  decoration: const BoxDecoration(color: Color(0xFF0961F5)),
                ),
              ),
              Positioned(
                left: 49,
                top: 637,
                child: Container(
                  width: 330,
                  height: 330,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE8F1FF),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 53.23,
                top: 301.35,
                child: SizedBox(
                  width: 327.24,
                  height: 294.84,
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 156,
                top: 397,
                child: SizedBox(
                  width: 116,
                  height: 158,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 116,
                          height: 116,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 43.66,
                                top: 81.20,
                                child: Container(
                                  width: 22.07,
                                  height: 7.73,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/22x8"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 61.86,
                                top: 60.03,
                                child: Container(
                                  width: 3.88,
                                  height: 21.17,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/4x21"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 61.87,
                                top: 57.56,
                                child: Container(
                                  width: 3.87,
                                  height: 12.04,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/4x12"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 113,
                        child: Container(
                          width: 103,
                          height: 45,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const Stack(
                            children: [
                              Positioned(
                                left: 6,
                                top: 0,
                                child: Text(
                                  'EDUPRO',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF332DA1),
                                    fontSize: 30,
                                    fontFamily: 'Aubrey',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 2.20,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 29,
                                child: Text(
                                  'LEARN FROM HOME',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
