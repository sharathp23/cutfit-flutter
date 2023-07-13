import 'dart:async';
import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutfit/view/Screens/Workout/arm/armswings.dart';
import 'package:cutfit/view/Screens/Workout/arm/armcircles.dart';
import 'package:cutfit/view/Screens/Workout/arm/armcircles2.dart';
import 'package:cutfit/view/Screens/Workout/arm/inchworm.dart';
import 'package:cutfit/view/Screens/Workout/arm/jumpingjacks5.dart';
import 'package:cutfit/view/Screens/Workout/arm/onearmtriceps.dart';
import 'package:cutfit/view/Screens/Workout/arm/punches.dart';
import 'package:cutfit/view/Screens/Workout/arm/pushup3.dart';
import 'package:cutfit/view/Screens/Workout/arm/spidermanplank.dart';
import 'package:cutfit/view/Screens/Workout/arm/triceps3.dart';

class ArmScreen extends StatefulWidget {
  @override
  _ArmScreenState createState() => _ArmScreenState();
}

class _ArmScreenState extends State<ArmScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  String bodyState = UserProfileStats.stats
      .firstWhere((e) => e['title'] == 'Body State')['value'];

  List<String>? exerciseList;

  List<String> underweightExercises = [
  'ARM CIRCLES',
  'ARM SWINGS',
  'INCHWORMS',
  'SINGLE LEG TRICEPS',
  'JUMPING JACKS'
];

List<String> normalExercises = [
  'ARM CIRCLES',
  'ARM SWINGS',
  'INCHWORMS',
  'SINGLE LEG TRICEPS',
  'JUMPING JACKS',
  'PUNCHES',
  'PUSH UPS',
  'SPIDERMAN PLANK',
  'ONE ARM TRICEPS PISH UPS'
];

List<String> overweightExercises = [
  'ARM SWINGS',
  'INCHWORMS',
  'SINGLE LEG TRICEPS',
  'JUMPING JACKS',
  'ONE ARM TRICEPS PUSH UPS',
  'PUNCHES',
  'PUSH UPS',
  'ONE ARM TRICEPS PISH UPS'
];

List<String> obeseExercises = [
  'INCHWORMS',
  'SINGLE LEG TRICEPS',
  'JUMPING JACKS',
  'PUNCHES',
  'PUSH UPS',
  'ONE ARM TRICEPS PISH UPS'
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
        title: Text('Arm Workout'),
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
                  _buildHorizontalLine(exerciseList?.contains('ARM SWINGS') ?? false),
            if (exerciseList?.contains('ARM SWINGS') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmSwingsScreen()),
                );
              },
              child: _buildExerciseTile('ARM SWINGS',
                  'assets/animations/armswings.gif', '30:00'),
            ),
            _buildHorizontalLine(exerciseList?.contains('ARM CIRCLES') ?? false),
            if (exerciseList?.contains('ARM CIRCLES') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArmCirclesScreen()),
                );
              },
              child: _buildExerciseTile('ARM CIRCLES',
                  'assets/animations/armcircles.gif', '00:30'),
            ),
            _buildHorizontalLine(exerciseList?.contains('SINGLE LEG TRICEPS') ?? false),
            if (exerciseList?.contains('SINGLE LEG TRICEPS') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.88);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Triceps3Screen()),
                );
              },
              child: _buildExerciseTile(
                  'SINGLE LEG TRICEPS', 'assets/animations/singlelegtricepdips.gif', 'x10'),
            ),
            _buildHorizontalLine(exerciseList?.contains('ARM CIRCLES') ?? false),
            if (exerciseList?.contains('ARM CIRCLES') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmCircles2Screen()),
                );
              },
              child: _buildExerciseTile(
                  'ARM CIRCLES', 'assets/animations/armcircles.gif', '00:30'),
            ),
            _buildHorizontalLine(exerciseList?.contains('ONE ARM TRICEPS PUSH UPS') ?? false),
            if (exerciseList?.contains('ONE ARM TRICEPS PUSH UPS') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(3.88);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OneArmTricepsScreen()),
                );
              },
              child: _buildExerciseTile('ONE ARM TRICEPS PUSH UPS',
                  'assets/animations/onearmtriceppushups.gif', 'x6'),
            ),
             _buildHorizontalLine(exerciseList?.contains('JUMPING JACKS') ?? false),
                  if (exerciseList?.contains('JUMPING JACKS') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JumpingJack5Screen()),
                );
              },
              child: _buildExerciseTile('JUMPING JACKS',
                  'assets/animations/jumpingjacks.gif', '00:20'),
            ),
            _buildHorizontalLine(exerciseList?.contains('SPIDERMAN PLANK') ?? false),
            if (exerciseList?.contains('SPIDERMAN PLANK') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(4.65);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SpidermanPlankScreen()),
                );
              },
              child: _buildExerciseTile('SPIDERMAN PLANK',
                  'assets/animations/spidermanplank.gif', 'x10'),
            ),
            _buildHorizontalLine(exerciseList?.contains('PUNCHES') ?? false),
            if (exerciseList?.contains('PUNCHES') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.6);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PunchesScreen()),
                );
              },
              child: _buildExerciseTile('PUNCHES',
                  'assets/animations/punches.gif', '00:20'),
            ),
            _buildHorizontalLine(exerciseList?.contains('PUSH UPS') ?? false),
            if (exerciseList?.contains('PUSH UPS') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.82);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PushUp3Screen()),
                );
              },
              child: _buildExerciseTile('PUSH UPS',
                  'assets/animations/pushup.gif', 'x10'),
            ),
             _buildHorizontalLine(exerciseList?.contains('INCHWORMS') ?? false),
             if (exerciseList?.contains('INCHWORMS') ?? false)
            GestureDetector(
              onTap: () {
                _incrementCaloriesBurned(5.43);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InchwormScreen()),
                );
              },
              child: _buildExerciseTile('INCHWORMS',
                  'assets/animations/inchworm.gif', 'x8'),
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