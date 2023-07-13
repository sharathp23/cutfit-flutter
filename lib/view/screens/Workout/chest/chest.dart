import 'dart:async';
import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutfit/view/Screens/Workout/chest/jumpingjacks4.dart';
import 'package:cutfit/view/Screens/Workout/chest/kneepushups2.dart';
import 'package:cutfit/view/Screens/Workout/chest/pushups2.dart';
import 'package:cutfit/view/Screens/Workout/chest/triceps.dart';
import 'package:cutfit/view/Screens/Workout/chest/triceps2.dart';
import 'package:cutfit/view/Screens/Workout/chest/widearm2.dart';
import 'package:cutfit/view/Screens/Workout/chest/widearm3.dart';

class ChestScreen extends StatefulWidget {
  @override
  _ChestScreenState createState() => _ChestScreenState();
}

class _ChestScreenState extends State<ChestScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  String bodyState = UserProfileStats.stats
      .firstWhere((e) => e['title'] == 'Body State')['value'];

  List<String>? exerciseList;

  List<String> underweightExercises = ['JUMPING JACKS', 'KNEE PUSH UPS'];

  List<String> normalExercises = [
    'JUMPING JACKS',
    'PUSH UPS',
    'WIDE ARM PUSH UPS',
    'SINGLE LEG TRICEPS'
  ];

  List<String> overweightExercises = [
    'PUSH UPS',
    'WIDE ARM PUSH UPS',
    'SINGLE LEG TRICEPS',
    'KNEE PUSH UPS'
  ];

  List<String> obeseExercises = [
    'PUSH UPS',
    'WIDE ARM PUSH UPS',
    'KNEE PUSH UPS'
  ];

  @override
  void initState() {
    super.initState();
    _loadTotalCaloriesBurned();
  }

  Future<void> _loadTotalCaloriesBurned() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      totalCaloriesBurned = prefs.getDouble('totalCaloriesBurned') ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (bodyState) {
      case 'Underweight':
        exerciseList = underweightExercises;
        break;
      case 'Normal':
        exerciseList = normalExercises;
        break;
      case 'Overweight':
        exerciseList = overweightExercises;
        break;
      case 'Obese':
        exerciseList = obeseExercises;
        break;
      default:
        exerciseList = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chest Workout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          Text(
            'TOTAL CALORIES BURNED: ${totalCaloriesBurned.toStringAsFixed(2)}\nBody State: $bodyState',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          Flexible(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHorizontalLine(
                      exerciseList?.contains('JUMPING JACKS') ?? false),
                  if (exerciseList?.contains('JUMPING JACKS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(5.6);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JumpingJack4Screen()),
                        );
                      },
                      child: _buildExerciseTile('JUMPING JACKS',
                          'assets/animations/jumpingjacks.gif', '20:00'),
                    ),
                  _buildHorizontalLine(
                      exerciseList?.contains('PUSH UPS') ?? false),
                  if (exerciseList?.contains('PUSH UPS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(5.43);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PushUp2Screen()),
                        );
                      },
                      child: _buildExerciseTile(
                          'PUSH UPS', 'assets/animations/pushup.gif', 'x8'),
                    ),
                   _buildHorizontalLine(
                      exerciseList?.contains('WIDE ARM PUSH UPS') ?? false),
                  if (exerciseList?.contains('WIDE ARM PUSH UPS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.65);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WideArmPushUp2Screen()),
                      );
                    },
                    child: _buildExerciseTile('WIDE ARM PUSH UP',
                        'assets/animations/widearmpushups.gif', 'x8'),
                  ),
                  _buildHorizontalLine(
                      exerciseList?.contains('SINGLE LEG TRICEPS') ?? false),
                  if (exerciseList?.contains('SINGLE LEG TRICEPS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(3.88);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TricepsScreen()),
                        );
                      },
                      child: _buildExerciseTile('SINGLE LEG TRICEPS',
                          'assets/animations/singlelegtricepdips.gif', 'x10'),
                    ),
                  _buildHorizontalLine(
                      exerciseList?.contains('WIDE ARM PUSH UPS') ?? false),
                  if (exerciseList?.contains('WIDE ARM PUSH UPS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(4.65);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WideArmPushUp3Screen()),
                        );
                      },
                      child: _buildExerciseTile('WIDE ARM PUSH UPS',
                          'assets/animations/widearmpushups.gif', 'x6'),
                    ),
                  _buildHorizontalLine(
                      exerciseList?.contains('SINGLE LEG TRICEPS') ?? false),
                  if (exerciseList?.contains('SINGLE LEG TRICEPS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(3.88);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Triceps2Screen()),
                        );
                      },
                      child: _buildExerciseTile('SINGLE LEG TRICEPS',
                          'assets/animations/singlelegtricepdips.gif', 'x8'),
                    ),
                  _buildHorizontalLine(
                      exerciseList?.contains('KNEE PUSH UPS') ?? false),
                  if (exerciseList?.contains('KNEE PUSH UPS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(4.6);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KneePushUp2Screen()),
                        );
                      },
                      child: _buildExerciseTile('KNEE PUSH UP',
                          'assets/animations/kneepushups.gif', 'x8'),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseTile(String title, String gifPath, String count) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Image.asset(gifPath, height: 170),
          SizedBox(height: 10),
          Text(
            count,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

Widget _buildHorizontalLine(bool showLine) {
  return showLine
      ? Container(
          height: 1.0,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          color: Colors.grey[300],
        )
      : SizedBox(height: 0.0);
}

  void _incrementCaloriesBurned(double calories) async {
    setState(() {
      totalCaloriesBurned += calories;
    });
    await prefs.setDouble('totalCaloriesBurned', totalCaloriesBurned);
  }
}
