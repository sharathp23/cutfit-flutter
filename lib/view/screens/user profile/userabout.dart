import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cutfit/config/UserProfile/userProfil.dart';

class UserProfile1Screen extends StatefulWidget {
  @override
  _UserProfile1ScreenState createState() => _UserProfile1ScreenState();
}

class _UserProfile1ScreenState extends State<UserProfile1Screen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _genderController = TextEditingController();
  final _allergyController = TextEditingController();
  final _healthConditionController = TextEditingController();
  late String _allergy = '';
  double? _bmiValue;
  String? _bodyState;
  late String _healthCondition = '';
  List<String> _allergyList = [
    'Peanuts',
    'Tree Nuts',
    'Milk',
    'Eggs',
    'Fish',
    'Shellfish',
    'Wheat',
    'Soy'
  ];

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _heightController.text = prefs.getString('height') ?? '';
      _weightController.text = prefs.getString('weight') ?? '';
      _genderController.text = prefs.getString('gender') ?? '';
      _allergyController.text = prefs.getString('allergy') ?? '';
      _bmiValue = prefs.getDouble('bmi');
      _bodyState = prefs.getString('body_state');
      _healthConditionController.text =
          prefs.getString('health_condition') ?? '';
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('height', _heightController.text);
    prefs.setString('weight', _weightController.text);
    prefs.setString('gender', _genderController.text);
    prefs.setString('allergy', _allergyController.text);
    prefs.setDouble('bmi', _bmiValue ?? 0.0);
    prefs.setString('body_state', _bodyState ?? '');
    prefs.setString('health_condition', _healthConditionController.text);

    // Update stats
    final stats = UserProfileStats.stats;
    final heightIndex = stats.indexWhere((e) => e['title'] == 'Height');
    if (heightIndex >= 0) {
      stats[heightIndex]['value'] = _heightController.text;
    }
    final weightIndex = stats.indexWhere((e) => e['title'] == 'Weight');
    if (weightIndex >= 0) {
      stats[weightIndex]['value'] = _weightController.text;
    }
    final genderIndex = stats.indexWhere((e) => e['title'] == 'Gender');
    if (genderIndex >= 0) {
      stats[genderIndex]['value'] = _genderController.text;
    }
    final allergyIndex = stats.indexWhere((e) => e['title'] == 'Allergy');
    if (allergyIndex >= 0) {
      stats[allergyIndex]['value'] = _allergyController.text;
    }
    final bmiIndex = stats.indexWhere((e) => e['title'] == 'BMI');
    if (bmiIndex >= 0) {
      stats[bmiIndex]['value'] = _bmiValue.toString();
    }
    final bodyStateIndex = stats.indexWhere((e) => e['title'] == 'Body State');
    if (bodyStateIndex >= 0) {
      stats[bodyStateIndex]['value'] = _bodyState ?? '';
    }
    final healthConditionIndex =
        stats.indexWhere((e) => e['title'] == 'Health Condition');
    if (healthConditionIndex >= 0) {
      stats[healthConditionIndex]['value'] = _healthConditionController.text;
    }

    double height = double.tryParse(_heightController.text) ?? 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      String bodyState = '';
      if (bmi < 18.5) {
        bodyState = 'Underweight';
      } else if (bmi < 25) {
        bodyState = 'Normal';
      } else if (bmi < 30) {
        bodyState = 'Overweight';
      } else {
        bodyState = 'Obese';
      }
      setState(() {
        _bmiValue = bmi;
        _bodyState = bodyState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff131429),
        title: Text(
          'User Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff131429),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: 'Height (in cm)',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabled: true,
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _saveProfileData();
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    labelText: 'Weight (in kg)',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabled: true,
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _saveProfileData();
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabled: true,
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _saveProfileData();
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _allergyController,
                  decoration: InputDecoration(
                    labelText: 'Allergy',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Peanuts, Milk, Eggs, Fish, Wheat etc',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabled: true,
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your allergy';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _saveProfileData();
                  },
                ),
                // SizedBox(height: 16.0),
                // TextFormField(
                //   controller: _healthConditionController,
                //   decoration: InputDecoration(
                //     labelText: 'Health Condition',
                //     labelStyle: TextStyle(color: Colors.white),
                //     hintText:
                //         'Heart Disease, High Blood Pressure, Asthma, Arthritis, Leg pain, etc.',
                //     hintStyle: TextStyle(color: Colors.grey),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //     enabled: true,
                //   ),
                //   style: TextStyle(color: Colors.white),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your health condition';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     _saveProfileData();
                //   },
                SizedBox(height: 18),
                Center(
                  child: Text(
                    'BMI: ${_bmiValue?.toStringAsFixed(1) ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text(
                    'Body State: ${_bodyState ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _saveProfileData();
    super.dispose();
  }
}
