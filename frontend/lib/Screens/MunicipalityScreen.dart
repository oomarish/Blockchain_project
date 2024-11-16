import 'package:flutter/material.dart';

class Municipalityscreen extends StatelessWidget {
  const Municipalityscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1200,
          height: 916,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(color: Color(0xFFD9D9D9)),
                    top: BorderSide(color: Color(0xFFD9D9D9)),
                    right: BorderSide(color: Color(0xFFD9D9D9)),
                    bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 240,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 160),
                decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Municipality 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 72,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0.02,
                                letterSpacing: -2.16,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Adresse',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 32,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 498,
                decoration: const BoxDecoration(color: Color(0xFFFEF7FF)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 88,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 1200, height: 88),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(4),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Overline',
                                            style: TextStyle(
                                              color: Color(0xFF49454F),
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.11,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'List item',
                                            style: TextStyle(
                                              color: Color(0xFF1D1B20),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.09,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Supporting line text lorem ipsum dolor sit amet, consectetur.',
                                            style: TextStyle(
                                              color: Color(0xFF49454F),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '100+',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF49454F),
                                          fontSize: 11,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 0.13,
                                          letterSpacing: 0.50,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, right: 4, bottom: 4),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(11),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 7,
                                                      left: 6,
                                                      right: 6,
                                                      bottom: 7.60,
                                                    ),
                                                    child: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFF65558F),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFCAC4D0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 88,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 1200, height: 88),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(4),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Overline',
                                            style: TextStyle(
                                              color: Color(0xFF49454F),
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.11,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'List item',
                                            style: TextStyle(
                                              color: Color(0xFF1D1B20),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.09,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Supporting line text lorem ipsum dolor sit amet, consectetur.',
                                            style: TextStyle(
                                              color: Color(0xFF49454F),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '100+',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF49454F),
                                          fontSize: 11,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 0.13,
                                          letterSpacing: 0.50,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, right: 4, bottom: 4),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(11),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 7,
                                                      left: 6,
                                                      right: 6,
                                                      bottom: 7.60,
                                                    ),
                                                    child: const Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFF65558F),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFCAC4D0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 88,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 1200, height: 88),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Overline',
                                            style: TextStyle(
                                              color: Color(0xFF49454F),
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.11,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'List item',
                                            style: TextStyle(
                                              color: Color(0xFF1D1B20),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.09,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Supporting line text lorem ipsum dolor sit amet, consectetur.',
                                            style: TextStyle(
                                              color: Color(0xFF49454F),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '100+',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF49454F),
                                          fontSize: 11,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 0.13,
                                          letterSpacing: 0.50,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, right: 4, bottom: 4),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(11),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 7,
                                                      left: 6,
                                                      right: 6,
                                                      bottom: 7.60,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFF65558F),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFCAC4D0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 79,
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 32,
                  right: 32,
                  bottom: 160,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: const BorderSide(color: Color(0xFFD9D9D9)),
                    top: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                    right: const BorderSide(color: Color(0xFFD9D9D9)),
                    bottom: const BorderSide(color: Color(0xFFD9D9D9)),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 262,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
