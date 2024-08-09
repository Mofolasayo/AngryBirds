import 'package:angry_birds/levels/level1.dart';
import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameWonOverlay extends StatelessWidget {
  final MyGame game;

  const GameWonOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // color: Color.fromARGB(132, 20, 20, 20),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width / 2,
              height: MediaQuery.sizeOf(context).height / 1.3,
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xFF035DA7),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Expanded(
                // width: double.infinity,
                //height: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: SvgPicture.asset(
                            color: const Color(0xFFFFB159),
                            'assets/images/fill_star.svg',
                          ),
                        ),
                        const SizedBox(width: 30),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: SvgPicture.asset(
                            width: 60,
                            height: 60,
                            color: const Color(0xFFFFB159),
                            'assets/images/fill_star.svg',
                          ),
                        ),
                        const SizedBox(width: 30),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: SvgPicture.asset(
                            width: 60,
                            height: 60,
                            color: const Color(0xFFFFB159),
                            'assets/images/open_star.svg',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF047EE2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const Center(
                              child: Column(
                                children: [
                                  Text(
                                    'New Level Unlocked',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      height: 1,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Total Score',
                                    style: TextStyle(
                                      color: Colors.white,
                                      height: 1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '100',
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
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    game.overlays.remove('GameWonOverlay');
                                    game.overlays.add('welcomeScreenOverlay');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF035DA7),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: SvgPicture.asset(
                                      color: const Color(0xFFFFB159),
                                      'assets/images/menu_btn.svg',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                // Container(
                                //   padding: EdgeInsets.all(15),
                                //   width: 80,
                                //   height: 80,
                                //   decoration: BoxDecoration(
                                //       color: Color(0xFF035DA7),
                                //       border: Border.all(
                                //         color: Colors.white,
                                //         width: 3,
                                //       ),
                                //       borderRadius: BorderRadius.circular(100)),
                                //   child: SvgPicture.asset(
                                //     color: Color(0xFFFFB159),
                                //     'assets/images/restart_btn.svg',
                                //   ),
                                // ),
                                const SizedBox(width: 30),
                                GestureDetector(
                                  onTap: () {
                                    game.overlays.remove('GameWonOverlay');
                                    game.overlays.add('levelsOverlay');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF035DA7),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: SvgPicture.asset(
                                      color: const Color(0xFFFFB159),
                                      'assets/images/next_btn.svg',
                                    ),
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
          ],
        ),
      ),
    );
  }
}
