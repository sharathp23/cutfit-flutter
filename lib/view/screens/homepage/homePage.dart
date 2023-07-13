import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:cutfit/view/screens/user%20profile/userProfil.dart';
import 'package:cutfit/view/screens/user%20profile/userabout.dart';
import '../../../controller/tabs controllers/workOutTabController.dart';
import '../../../controller/userController/userController.dart';
import '../../../helpers/string_methods.dart';
import 'componenets/usernameAndProfile.dart';
import 'package:cutfit/view/Screens/Allergy/allergy_screen.dart';
import 'package:cutfit/view/Screens/ExpertTips/expert_tips.dart';
import 'package:cutfit/view/Screens/homepage/bloodpressure.dart';
import 'package:cutfit/view/Screens/homepage/bmicalculator.dart';
import 'package:cutfit/view/screens/homepage/notification.dart';
import 'package:cutfit/view/Screens/Meals/meals_screen.dart';
import 'package:cutfit/view//Screens/Meditation/meditation_screen.dart';
import 'package:cutfit/view/Screens/Trainers/trainers_screen.dart';
import 'package:cutfit/view//Screens/Workout/workout_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final UserInformationController userInformationController =
      Get.put(UserInformationController());

  final CustomTabBarController _tabx = Get.put(CustomTabBarController());

  GlobalKey _menuIconKey = GlobalKey();

  void _onUpdateProfilePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfile1Screen(),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Stack(
    children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            // Center app bar text
            child: Text(
              'CUT FIT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.yellow, width: 2.0),
            ),
            child: Tooltip(
              message: 'Update Your Profile',
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile1Screen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ProfileAndUsername(
                    onProfileImgTap: () {
                      Get.to(() => const UserProfile());
                    },
                    username: capitalize(
                      userInformationController.username.value,
                    ),
                    profileImg:
                        userInformationController.userProfileImg.value,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildScreenImage(
                    image: 'assets/images/workout.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutScreen(),
                        ),
                      );
                    },
                  ),
                  _buildScreenImage(
                    image: 'assets/images/meals.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildScreenImage(
                    image: 'assets/images/meditation.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MeditationScreen(),
                        ),
                      );
                    },
                  ),
                  _buildScreenImage(
                    image: 'assets/images/allergy.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllergyScreen(),
                        ),
                      );
                    },
                  ),
                  _buildScreenImage(
                    image: 'assets/images/trainers.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainersScreen(),
                        ),
                      );
                    },
                  ),
                  _buildScreenImage(
                    image: 'assets/images/expert_tips.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpertTipsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.home, color: Colors.black),
                            const SizedBox(height: 5),
                            Text('Home', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BMI_Screen()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.calculate, color: Colors.black),
                            Text('BMI Calculator'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BloodPressureScreen()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.favorite, color: Colors.black),
                            Text('Blood Pressure'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WaterIntakeCalculator()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.water_drop, color: Colors.black),
                            Text('Water Intake'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScreenImage(
      {required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
