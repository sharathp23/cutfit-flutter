import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cutfit/config/UserProfile/userProfil.dart';
import 'package:cutfit/view/Screens/Workout/fullbody/mountainclimber.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JumpingJackScreen(),
    );
  }
}

class JumpingJackScreen extends StatefulWidget {
  @override
  _JumpingJackScreenState createState() => _JumpingJackScreenState();
}

class _JumpingJackScreenState extends State<JumpingJackScreen> {
  int _remainingSeconds = 20;
  Timer? _timer;
  final _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isTimerCompleted = false;
  double _caloriesBurned = 0.0; // initialize to zero
  final double _mets = 4.0; // moderate intensity exercise (4 METs)

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _assetsAudioPlayer.open(Audio('assets/audio/beep.mp3'));
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
          if (_remainingSeconds >= 1 && _remainingSeconds <= 5) {
            _assetsAudioPlayer.play();
          }
          if (_remainingSeconds == 0) {
            _isTimerCompleted = true;
            _timer?.cancel();
            UserProfileStats.stats.forEach((stat) {
              if (stat['title'] == 'Weight') {
                int weight = int.tryParse(stat['value']) ?? 70; // default weight to 70 if not available
                _caloriesBurned =
                    ((_mets * weight * _remainingSeconds) / 60)
                        .roundToDouble() /
                    100; // calculate calories burned and round off to 2 decimal places
              }
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime =
        '${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumping Jacks'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!_isTimerCompleted)
            Image.asset('assets/animations/jumpingjacks.gif', height: 300),
          SizedBox(height: 20),
          Text(
            'Jumping Jacks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '00:20',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            '00:$remainingTime',
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(height: 20),
          if (_isTimerCompleted)
            ElevatedButton(
              onPressed: () {
                double caloriesBurned = calculateCaloriesBurned(
                    20,
                    int.tryParse(UserProfileStats.stats
                            .firstWhere((stat) => stat['title'] == 'Weight')['value']) ??
                        70, // default weight to 70 if not available
                    _mets); // calculate calories burned for 20 seconds
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Workout Complete'),
content: Text(
'You burned ${caloriesBurned.toStringAsFixed(2)} calories.'),
actions: [
TextButton(
onPressed: () {
Navigator.pop(context);
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => MountainClimberScreen(),
),
);
},
child: Text('OK'),
),
],
),
);
},
child: Text('Next'),
),
],
),
);
}

double calculateCaloriesBurned(int seconds, int weight, double intensity) {
double caloriesPerSecond = 0.001 * intensity * weight;
return caloriesPerSecond * seconds;
}
}
