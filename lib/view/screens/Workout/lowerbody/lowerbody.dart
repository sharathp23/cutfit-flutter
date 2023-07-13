import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/WeightedDonkeyKick.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/donkeykicks.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/doublelegdonkeykicks.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/frontbacklunges.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/jumpingjacks2.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/squats.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/squats2.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/waistslimmersquats.dart';

class LowerBodyScreen extends StatefulWidget {
  @override
  _LowerBodyScreenState createState() => _LowerBodyScreenState();
}

class _LowerBodyScreenState extends State<LowerBodyScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  String bodyState = UserProfileStats.stats
      .firstWhere((e) => e['title'] == 'Body State')['value'];

  List<String>? exerciseList;
  
 List<String> underweightExercises = [
  'JUMPING JACKS',
  'FRONT AND BACK LUNGES',
  'SQUATS'
];

List<String> normalExercises = [
  'JUMPING JACKS',
  'FRONT AND BACK LUNGES',
  'SQUATS',
  'DOUBLE LEG DONKEY KICKS',
  'WAIST SLIMMER SQUATS',
  'DONKEY KICKS'
];

List<String> overweightExercises = [
  'FRONT AND BACK LUNGES',
  'SQUATS',
  'DOUBLE LEG DONKEY KICKS',
  'WAIST SLIMMER SQUATS',
  'WEIGHTED DONKEY KICKS'
];

List<String> obeseExercises = [
  'SQUATS',
  'WAIST SLIMMER SQUATS',
  'WEIGHTED DONKEY KICKS'
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
        title: Text('Lower Body Workout'),
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
                   _buildHorizontalLine(exerciseList?.contains('JUMPING JACKS') ?? false),
                  if (exerciseList?.contains('JUMPING JACKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JumpingJack2Screen()),
                      );
                    },
                    child: _buildExerciseTile('JUMPING JACKS',
                        'assets/animations/jumpingjacks.gif', '20:00'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('SQUATS') ?? false),
                   if (exerciseList?.contains('SQUATS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.7);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SquatsScreen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'SQUATS', 'assets/animations/squats.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('WAIST SLIMMER SQUATS') ?? false),
                   if (exerciseList?.contains('WAIST SLIMMER SQUATS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WaistSlimmerSquatsScreen()),
                      );
                    },
                    child: _buildExerciseTile('WAIST SLIMMER SQUATS',
                        'assets/animations/waistslimmerdaysquats.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('FRONT AND BACK LUNGES') ?? false),
                   if (exerciseList?.contains('FRONT AND BACK LUNGES') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FrontAndBackLungesScreen()),
                      );
                    },
                    child: _buildExerciseTile('FRONT AND BACK LUNGES',
                        'assets/animations/frontandbacklunges.gif', 'x10'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('WEIGHTED DONKEY KICKS') ?? false),
                   if (exerciseList?.contains('WEIGHTED DONKEY KICKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeightedDonkeyKickScreen()),
                      );
                    },
                    child: _buildExerciseTile('WEIGHTED DONKEY KICKS',
                        'assets/animations/weighteddonkeykicks.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('SQUATS') ?? false),
                   if (exerciseList?.contains('SQUATS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Squats2Screen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'SQUATS', 'assets/animations/squats.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('DONKEY KICKS') ?? false),
                   if (exerciseList?.contains('DONKEY KICKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.7);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DonkeyKicksScreen()),
                      );
                    },
                    child: _buildExerciseTile('DONKEY KICKS',
                        'assets/animations/donkeykicks.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('DOUBLE LEG DONKEY KICKS') ?? false),
                   if (exerciseList?.contains('DOUBLE LEG DONKEY KICKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.8);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoubleLegDonkeyKicksScreen()),
                      );
                    },
                    child: _buildExerciseTile('DOUBLE LEG DONKEY KICKS',
                        'assets/animations/doublelegdonkeykicks.gif', 'x6'),
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
