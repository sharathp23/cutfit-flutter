import 'dart:async';
import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/armcircle3.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/armswings2.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/doublelegdonkeykicks.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/jumpingjacks6.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/kneepushups3.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/kneepushups4.dart';

class ShoulderScreen extends StatefulWidget {
  @override
  _ShoulderScreenState createState() => _ShoulderScreenState();
}

class _ShoulderScreenState extends State<ShoulderScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  String bodyState = UserProfileStats.stats
      .firstWhere((e) => e['title'] == 'Body State')['value'];

  List<String>? exerciseList;
  List<String> underweightExercises = [
    'JUMPING JACKS',
    'ARM SWINGS',
    'ARM CIRCLES',
    'KNEE PUSH UP',
    'DOUBLE LEG DONKEY KICKS'
  ];

  List<String> normalExercises = [
    'JUMPING JACKS',
    'ARM SWINGS',
    'ARM CIRCLES',
    'KNEE PUSH UP',
    'DOUBLE LEG DONKEY KICKS'
  ];

  List<String> overweightExercises = [
    'ARM SWINGS',
    'ARM CIRCLES',
    'KNEE PUSH UP',
    'DOUBLE LEG DONKEY KICKS'
  ];

  List<String> obeseExercises = [
    'ARM SWINGS',
    'ARM CIRCLES',
    'KNEE PUSH UP',
    'DOUBLE LEG DONKEY KICKS'
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
        title: Text('Shoulder Workout'),
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
                              builder: (context) => JumpingJack6Screen()),
                        );
                      },
                      child: _buildExerciseTile('JUMPING JACKS',
                          'assets/animations/jumpingjacks.gif', '20:00'),
                    ),
                  _buildHorizontalLine(
                      exerciseList?.contains('ARM SWINGS') ?? false),
                  if (exerciseList?.contains('ARM SWINGS') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(5.6);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArmSwings2Screen()),
                        );
                      },
                      child: _buildExerciseTile('ARM SWINGS',
                          'assets/animations/armswings.gif', '00:30'),
                    ),
                  _buildHorizontalLine(
                      exerciseList?.contains('ARM CIRCLES') ?? false),
                  if (exerciseList?.contains('ARM CIRCLES') ?? false)
                    GestureDetector(
                      onTap: () {
                        _incrementCaloriesBurned(5.6);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArmCircles3Screen()),
                        );
                      },
                      child: _buildExerciseTile('ARM CIRCLES',
                          'assets/animations/armcircles.gif', '00:30'),
                    ),
                   _buildHorizontalLine(exerciseList?.contains('KNEE PUSH UPS') ?? false),
                  if (exerciseList?.contains('KNEE PUSH UPS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(6.98);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KneePushUp3Screen()),
                      );
                    },
                    child: _buildExerciseTile('KNEE PUSH UPS',
                        'assets/animations/kneepushups.gif', 'x14'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('DOUBLE LEG DONKEY KICKS') ?? false),
                  if (exerciseList?.contains('DOUBLE LEG DONKEY KICKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoublelegDonkeyKicksScreen()),
                      );
                    },
                    child: _buildExerciseTile('DOUBLE LEG DONKEY KICKS',
                        'assets/animations/doublelegdonkeykicks.gif', '00:20'),
                  ),
                   _buildHorizontalLine(exerciseList?.contains('KNEE PUSH UPS') ?? false),
                  if (exerciseList?.contains('KNEE PUSH UPS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(7.76);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KneePushUp4Screen()),
                      );
                    },
                    child: _buildExerciseTile('KNEE PUSH UPS',
                        'assets/animations/kneepushups.gif', 'x12'),
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
