class UserProfileStats {
  static List<Map<String, dynamic>> stats = [
    {
      "title": "Calories Burned",
      "value": "",
    },
    {
      "title": "Gender",
      "value": "",
    },
    {
      "title": "Weight",
      "value": "",
    },
    {
      "title": "Height",
      "value": "",
    },
    {
      "title": "Allergy",
      "value": "",
    },
    {
      "title": "Body State",
      "value": "",
    },
    // {
    //   "title": "Health Condition",
    //   "value": "",
    // },
  ];

 static void updateStats(
    String height,
    String weight,
    String caloriesBurned,
    String gender,
    String allergy,
    String bodyState,
    // String healthCondition
    ) {
  final heightIndex = stats.indexWhere((e) => e['title'] == 'Height');
  if (heightIndex >= 0) {
    stats[heightIndex]['value'] = height;
  }
  final weightIndex = stats.indexWhere((e) => e['title'] == 'Weight');
  if (weightIndex >= 0) {
    stats[weightIndex]['value'] = weight;
  }

  final caloriesBurnedIndex =
      stats.indexWhere((e) => e['title'] == 'Calories Burned');
  if (caloriesBurnedIndex >= 0) {
    stats[caloriesBurnedIndex]['value'] = caloriesBurned;
  }
  final genderIndex = stats.indexWhere((e) => e['title'] == 'Gender');
  if (genderIndex >= 0) {
    stats[genderIndex]['value'] = gender;
  }

  final allergyIndex = stats.indexWhere((e) => e['title'] == 'Allergy');
  if (allergyIndex >= 0) {
    stats[allergyIndex]['value'] = allergy;
  }

  final bodyStateIndex = stats.indexWhere((e) => e['title'] == 'Body State');
  if (bodyStateIndex >= 0) {
    stats[bodyStateIndex]['value'] = bodyState;
  }

  // final healthConditionIndex =
  //     stats.indexWhere((e) => e['title'] == 'Health Condition');
  // if (healthConditionIndex >= 0) {
  //   stats[healthConditionIndex]['value'] = healthCondition;
  // }
}
}
