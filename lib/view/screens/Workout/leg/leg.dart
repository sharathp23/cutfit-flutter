import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutfit/view/Screens/Workout/leg/corestrengthening.dart';
import 'package:cutfit/view/Screens/Workout/leg/donkeykicks2.dart';
import 'package:cutfit/view/Screens/Workout/leg/frontbacklunges.dart';
import 'package:cutfit/view/Screens/Workout/leg/leglift3.dart';
import 'package:cutfit/view/Screens/Workout/leg/sidehop.dart';
import 'package:cutfit/view/Screens/Workout/leg/skiabs.dart';
import 'package:cutfit/view/Screens/Workout/leg/squats3.dart';

class LegScreen extends StatefulWidget {
  @override
  _LegScreenState createState() => _LegScreenState();
}

class _LegScreenState extends State<LegScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;

  String bodyState = UserProfileStats.stats
      .firstWhere((e) => e['title'] == 'Body State')['value'];

  List<String>? exerciseList;

  List<String> underweightExercises = [
    'SIDE HOP',
    'SQUATS',
    'LEG LIFT',
    'FRONT AND BACK LUNGES',
    'CORE STRENGTHENING'
  ];
  List<String> normalExercises = [
    'SIDE HOP',
    'SQUATS',
    'LEG LIFT',
    'FRONT AND BACK LUNGES',
    'CORE STRENGTHENING',
    'DONKEY KICKS',
    'SKI ABS'
  ];
  List<String> overweightExercises = [
    'SQUATS',
    'LEG LIFT',
    'FRONT AND BACK LUNGES',
    'CORE STRENGTHENING',
    'DONKEY KICKS',
    'SKI ABS'
  ];
  List<String> obeseExercises = [
    'SQUATS',
    'LEG LIFT',
    'FRONT AND BACK LUNGES',
    'CORE STRENGTHENING',
    'DONKEY KICKS',
    'SKI ABS'
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
        title: Text('Leg Workout'),
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
                  _buildHorizontalLine(exerciseList?.contains('SIDE HOP') ?? false),
            if (exerciseList?.contains('SIDE HOP') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SidehopScreen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'SIDE HOP', 'assets/animations/sidehop.gif', '20:00'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('SQUATS') ?? false),
                  if (exerciseList?.contains('SQUATS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(3.7);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Squats3Screen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'SQUATS', 'assets/animations/squats.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('LEG LIFT') ?? false),
                  if (exerciseList?.contains('LEG LIFT') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LegLift3Screen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'LEG LIFT', 'assets/animations/leglift.gif', 'x12'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('FRONT AND BACK LUNGES') ?? false),
                  if (exerciseList?.contains('FRONT AND BACK LUNGES') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.4);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FrontAndBackLunges2Screen()),
                      );
                    },
                    child: _buildExerciseTile('FRONT AND BACK LUNGES',
                        'assets/animations/frontandbacklunges.gif', 'x14'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('DONKEY KICKS') ?? false),
                  if (exerciseList?.contains('DONKEY KICKS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(4.4);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DonkeyKicks2Screen()),
                      );
                    },
                    child: _buildExerciseTile('DONKEY KICKS',
                        'assets/animations/donkeykicks.gif', 'x16'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('CORE STRENGTHENING') ?? false),
                  if (exerciseList?.contains('CORE STRENGTHENING') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoreScreen()),
                      );
                    },
                    child: _buildExerciseTile('CORE STRENGTHENING',
                        'assets/animations/corestrengthening.gif', '00:20'),
                  ),
                  _buildHorizontalLine(exerciseList?.contains('SKI ABS') ?? false),
                  if (exerciseList?.contains('SKI ABS') ?? false)
                  GestureDetector(
                    onTap: () {
                      _incrementCaloriesBurned(5.6);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SkiabsScreen()),
                      );
                    },
                    child: _buildExerciseTile(
                        'SKI ABS', 'assets/animations/skiabs.gif', '00:20'),
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
