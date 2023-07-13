import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class WaterIntakeCalculator extends StatefulWidget {
  @override
  _WaterIntakeCalculatorState createState() => _WaterIntakeCalculatorState();
}

class _WaterIntakeCalculatorState extends State<WaterIntakeCalculator> {
  double _weight = 60.0;
  double _activityFactor = 1.0;
  double _climateFactor = 1.0;
  double _result = 0.0;
  bool _enableReminder = false;
  int _reminderInterval = 2; // in hours
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _weight = prefs.getDouble('weight') ?? 60.0;
      _activityFactor = prefs.getDouble('activityFactor') ?? 1.0;
      _climateFactor = prefs.getDouble('climateFactor') ?? 1.0;
      _result = prefs.getDouble('result') ?? 0.0;
      _enableReminder = prefs.getBool('enableReminder') ?? false;
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('weight', _weight);
    await prefs.setDouble('activityFactor', _activityFactor);
    await prefs.setDouble('climateFactor', _climateFactor);
    await prefs.setDouble('result', _result);
    await prefs.setBool('enableReminder', _enableReminder);
  }

  void _calculateWaterIntake() {
    setState(() {
      _result = (_weight * _activityFactor * _climateFactor) / 28.3;
      if (_enableReminder) {
        _scheduleWaterReminder();
      }
      _saveData();
    });
  }

  Future<void> _scheduleWaterReminder() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'water_reminder_channel',
      'Water Reminder',
      'Channel for water reminder notifications',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Time to drink water',
        'Remember to drink water regularly!',
        tz.TZDateTime.from(_getNextWaterReminderTime(), tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  DateTime _getNextWaterReminderTime() {
    var now = DateTime.now();
    var nextReminderTime = now
        .add(Duration(hours: _reminderInterval - now.hour % _reminderInterval));
    return nextReminderTime;
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Intake Calculator'),
      ),
      backgroundColor: Color(0xff131429),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Weight (kg)',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 150.0,
                  child: TextFormField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Weight (kg)',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        _weight = double.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Activity Level',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<double>(
                  value: _activityFactor,
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _activityFactor = value!;
                    });
                  },
                  items: <DropdownMenuItem<double>>[
                    DropdownMenuItem<double>(
                      value: 1.0,
                      child: Text(
                        'Sedentary',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.2,
                      child: Text(
                        'Lightly active',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.4,
                      child: Text(
                        'Moderately active',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.6,
                      child: Text(
                        'Very active',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Climate',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<double>(
                  value: _climateFactor,
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _climateFactor = value!;
                    });
                  },
                  items: <DropdownMenuItem<double>>[
                    DropdownMenuItem<double>(
                      value: 1.0,
                      child: Text(
                        'Cold',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.2,
                      child: Text(
                        'Moderate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.4,
                      child: Text(
                        'Hot',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Enable reminder',
                  style: TextStyle(color: Colors.white),
                ),
                Switch(
                  value: _enableReminder,
                  onChanged: (value) {
                    setState(() {
                      _enableReminder = value;
                      if (_enableReminder) {
                        _showReminderIntervalDialog();
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateWaterIntake,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Drink ${_result.toStringAsFixed(1)} liters of water per day',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showReminderIntervalDialog() async {
    int? newInterval = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reminder Interval'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Set the interval for the water reminder (in hours)'),
              SizedBox(height: 16.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Reminder interval'),
                onChanged: (value) {
                  setState(() {
                    _reminderInterval = int.parse(value);
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_reminderInterval);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    if (newInterval != null) {
      setState(() {
        _reminderInterval = newInterval;
      });
    } else {
      setState(() {
        _enableReminder = false;
      });
    }
  }
}
