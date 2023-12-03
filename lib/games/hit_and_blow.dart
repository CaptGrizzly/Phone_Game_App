import 'dart:math';
import 'package:flutter/material.dart';
import '../home.dart';

class HitAndBlowScreen extends StatefulWidget {
  const HitAndBlowScreen({super.key});

  @override
  State<HitAndBlowScreen> createState() => _HitAndBlowScreenState();
}

class _HitAndBlowScreenState extends State<HitAndBlowScreen> {
  static List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.black,
    Colors.white,
  ];

  static Random rand = Random();

  List<Color> solution = [
    colors[rand.nextInt(colors.length)],
    colors[rand.nextInt(colors.length)],
    colors[rand.nextInt(colors.length)],
    colors[rand.nextInt(colors.length)]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: solution.length,
                itemBuilder: (ctx, index) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: solution[index],
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    )
                  ),
                )
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GameHomeScreen())
                );
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}