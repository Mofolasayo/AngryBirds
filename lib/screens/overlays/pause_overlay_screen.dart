import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PauseOverlay extends StatelessWidget {
  const PauseOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(132, 20, 20, 20),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width / 2,
              height: MediaQuery.sizeOf(context).height / 1.6,
              padding: EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Color(0xFF035DA7),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Paused',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF047EE2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Current Score',
                                    style: TextStyle(
                                      color: Colors.white,
                                      height: 1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '10,000',
                                    style: TextStyle(
                                      color: Colors.white,
                                      height: 1,
                                      fontSize: 50,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF035DA7),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: SvgPicture.asset(
                                    color: Color(0xFFFFB159),
                                    'assets/images/menu_btn.svg',
                                  ),
                                ),
                                SizedBox(width: 30),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF035DA7),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: SvgPicture.asset(
                                    color: Color(0xFFFFB159),
                                    'assets/images/restart_btn.svg',
                                  ),
                                ),
                                SizedBox(width: 30),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF035DA7),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: SvgPicture.asset(
                                    color: Color(0xFFFFB159),
                                    'assets/images/next_btn.svg',
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
              ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF035DA7),
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SvgPicture.asset(
                  color: Color(0xFFFFB159),
                  'assets/images/close_btn.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
