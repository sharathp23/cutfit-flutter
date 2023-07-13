import 'dart:async';
import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:flutter/material.dart';
import 'package:cutfit/view/Screens/Workout/abs/jumpingjacks3.dart';
import 'package:cutfit/view/Screens/Workout/abs/leglift.dart';
import 'package:cutfit/view/Screens/Workout/abs/leglift2.dart';
import 'package:cutfit/view/Screens/Workout/abs/mountainclimber2.dart';
import 'package:cutfit/view/Screens/Workout/abs/mountainclimber3.dart';
import 'package:cutfit/view/Screens/Workout/abs/plankjacks.dart';
import 'package:cutfit/view/Screens/Workout/abs/plankjacks2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsScreen extends StatefulWidget {
  @override
  _AbsScreenState createState() => _AbsScreenState();
}

class _AbsScreenState extends State<AbsScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  String bodyState = UserProfileStats.stats
      .firstWhere((e) => e['title'] == 'Body State')['value'];

  List<String>? exerciseList;

 List<String> underweightExercises = [
'JUMPING JACKS',
'LEG LIFTS'
];

List<String> normalExercises = [
'JUMPING JACKS',
'PLANK JACKS',
'MOUNTAIN CLIMBER',
'LEG LIFTS',
'PUSH UPS',
'WIDE ARM PUSH UPS'
];

List<String> overweightExercises = [
'PLANK JACKS',
'MOUNTAIN CLIMBER',
'LEG LIFTS',
'PUSH UPS',
'WIDE ARM PUSH UPS',
'SINGLE LEG TRICEPS'
];

List<String> obeseExercises = [
'PLANK JACKS',
'MOUNTAIN CLIMBER',
'LEG LIFTS',
'PUSH UPS',
'WIDE ARM PUSH UPS',
'SINGLE LEG TRICEPS'
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
        title: Text('Abs Workout'),
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
                              builder: (context) => JumpingJack3Screen()),
                        );
                      },
                      child: _buildExerciseTile('JUMPING JACKS',
                          'assets/animations/jumpingjacks.gif', '20:00'),
                    ),
                   _buildHorizontalLine(exerciseList?.contains('MOUNTAIN CLIMBER') ?? false),
                    if (exerciseList?.contains('MOUNTAIN CLIMBER') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(14.7);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MountainClimber2Screen()),
                      );
                    },
                    child: _buildExerciseTile('MOUNTAIN CLIMBER',
                        'assets/animations/mountainclimber.gif', 'x16'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('LEG LIFTS') ?? false),
                  if (exerciseList?.contains('LEG LIFTS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(6.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LegLiftScreen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'LEG LIFTS', 'assets/animations/leglift.gif', 'x16'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('PLANK JACKS') ?? false),
                  if (exerciseList?.contains('PLANK JACKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(6.98);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlankJacksScreen()),
                      );
                    },
                    child: _buildExerciseTile('PLANK JACKS',
                        'assets/animations/plankjacks.gif', 'x20'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('MOUNTAIN CLIMBER') ?? false),
                  if (exerciseList?.contains('MOUNTAIN CLIMBER') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(11.8);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MountainClimber3Screen()),
                      );
                    },
                    child: _buildExerciseTile('MOUNTAIN CLIMBER',
                        'assets/animations/mountainclimber.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('LEG LIFTS') ?? false),
                  if (exerciseList?.contains('LEG LIFTS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.82);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LegLift2Screen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'LEG LIFTS', 'assets/animations/leglift.gif', 'x14'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('PLANK JACKS') ?? false),
                  if (exerciseList?.contains('PLANK JACKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(6.98);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlankJacks2Screen()),
                      );
                    },
                    child: _buildExerciseTile('PLANK JACKS',
                        'assets/animations/plankjacks.gif', 'x20'),
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
