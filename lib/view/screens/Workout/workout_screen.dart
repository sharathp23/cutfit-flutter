import 'package:flutter/material.dart';
import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:cutfit/view/Screens/Workout/abs/abs.dart';
import 'package:cutfit/view/Screens/Workout/arm/arm.dart';
import 'package:cutfit/view/Screens/Workout/chest/chest.dart';
import 'package:cutfit/view/Screens/Workout/fullbody/fullbody.dart';
import 'package:cutfit/view/Screens/Workout/leg/leg.dart';
import 'package:cutfit/view/Screens/Workout/lowerbody/lowerbody.dart';
import 'package:cutfit/view/Screens/Workout/shoulder/shoulder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final _scrollController = ScrollController();
  late SharedPreferences prefs;
  double totalCaloriesBurned = 0.0;
  String bodyState = '';
  // String healthCondition = '';
  String allergy = '';
  String height = '';
  String gender = '';
  String weight = '';

  @override
  void initState() {
    super.initState();
    _loadTotalCaloriesBurned();
  }

  Future<void> _loadTotalCaloriesBurned() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      totalCaloriesBurned = prefs.getDouble('totalCaloriesBurned') ?? 0.0;
      bodyState = UserProfileStats.stats
          .firstWhere((e) => e['title'] == 'Body State')['value'];
      // healthCondition = UserProfileStats.stats
      //     .firstWhere((e) => e['title'] == 'Health Condition')['value'];
      allergy = UserProfileStats.stats
          .firstWhere((e) => e['title'] == 'Allergy')['value'];
      gender = UserProfileStats.stats
          .firstWhere((e) => e['title'] == 'Gender')['value'];
      height = UserProfileStats.stats
          .firstWhere((e) => e['title'] == 'Height')['value'];
      weight = UserProfileStats.stats
          .firstWhere((e) => e['title'] == 'Weight')['value'];
      UserProfileStats.updateStats(
          height,
          weight,
          totalCaloriesBurned.toStringAsFixed(2),
          gender,
          allergy,
          bodyState,
          // healthCondition
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Screen'),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullBodyScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/fullbody.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LowerBodyScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/lowerbody.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AbsScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/abs.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChestScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/chest.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArmScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/arm.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LegScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/leg.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoulderScreen()),
                      );
                    },
                    child: Section(image: 'assets/images/shoulder.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String image;

  Section({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
