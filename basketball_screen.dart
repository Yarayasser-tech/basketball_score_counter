import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:facebook/widgets/custom_elevated_button_pass_widget.dart';

enum Team {
  teamA,
  teamB,
}

enum Point {
  one,
  two,
  three,
}

class BasketballScreen extends StatefulWidget {
  const BasketballScreen({super.key});

  @override
  State<BasketballScreen> createState() => BasketballScreenState();
}

class BasketballScreenState extends State<BasketballScreen> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPoint({
    required Team team,
    required Point point,
  }) {
    setState(() {
      int points = 0;

      if (point == Point.one) {
        points = 1;
      } else if (point == Point.two) {
        points = 2;
      } else if (point == Point.three) {
        points = 3;
      }

      if (team == Team.teamA) {
        teamAScore += points;
      } else {
        teamBScore += points;
      }
    });
  }

  void resetScore() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/basketball.png',
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),

              // Blur behind the transparent container
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),

                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.88,

                  // Semi-transparent background
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(25),

                    // Transparent border
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.45),
                      width: 2,
                    ),
                  ),

                  child: Column(
                    children: [
                      const SizedBox(height: 35),

                      // Title
                      const Text(
                        'Basketball Counter',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CrustyRock',
                        ),
                      ),

                      const SizedBox(height: 45),

                      // Teams
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // =========================
                          // TEAM A
                          // =========================
                          Column(
                            children: [
                              const Text(
                                'Team A',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CrustyRock',
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                '$teamAScore',
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Add 1 Point
                              CustomElevatedButtonPassWidget(
                                onPressed: () {
                                  addPoint(
                                    team: Team.teamA,
                                    point: Point.one,
                                  );
                                },
                                point: 1,
                              ),

                              const SizedBox(height: 12),

                              // Add 2 Points
                              CustomElevatedButtonPassWidget(
                                onPressed: () {
                                  addPoint(
                                    team: Team.teamA,
                                    point: Point.two,
                                  );
                                },
                                point: 2,
                              ),

                              const SizedBox(height: 12),

                              CustomElevatedButtonPassWidget(
                                onPressed: () {
                                  addPoint(
                                    team: Team.teamA,
                                    point: Point.three,
                                  );
                                },
                                point: 3,
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 300,
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                          ),

                          Column(
                            children: [
                              const Text(
                                'Team B',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CrustyRock',
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                '$teamBScore',
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              CustomElevatedButtonPassWidget(
                                onPressed: () {
                                  addPoint(
                                    team: Team.teamB,
                                    point: Point.one,
                                  );
                                },
                                point: 1,
                              ),

                              const SizedBox(height: 12),

                              CustomElevatedButtonPassWidget(
                                onPressed: () {
                                  addPoint(
                                    team: Team.teamB,
                                    point: Point.two,
                                  );
                                },
                                point: 2,
                              ),

                              const SizedBox(height: 12),

                              CustomElevatedButtonPassWidget(
                                onPressed: () {
                                  addPoint(
                                    team: Team.teamB,
                                    point: Point.three,
                                  );
                                },
                                point: 3,
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(flex: 3,),

                      ElevatedButton(
                        onPressed: resetScore,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 350),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}