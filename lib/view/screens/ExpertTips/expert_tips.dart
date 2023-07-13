import 'package:flutter/material.dart';

class ExpertTipsScreen extends StatelessWidget {
  final List<String> tips = [
    '1. Exercise regularly: Physical activity is important for overall health and fitness. Aim for at least 30 minutes of moderate-intensity exercise most days of the week.',
    '2. Eat a balanced diet: A healthy diet is key to maintaining a healthy weight and reducing the risk of chronic diseases. Make sure your diet includes a variety of fruits, vegetables, whole grains, lean protein, and healthy fats.',
    '3. Get enough sleep: Adequate sleep is essential for optimal health and well-being. Most adults need 7-9 hours of sleep per night.',
    '4. Manage stress: Chronic stress can have negative effects on both physical and mental health. Find ways to manage stress, such as meditation, exercise, or talking with a therapist.',
    '5. Avoid harmful habits: Avoid smoking, excessive alcohol consumption, and other harmful habits that can negatively impact your health.',
    '6. Stay hydrated: Drinking plenty of water is important for maintaining good health and preventing dehydration. Aim for at least 8 glasses of water a day.',
    '7. Practice good posture: Good posture can prevent back pain and improve breathing and circulation. Make sure to stand and sit up straight, and avoid slouching.',
    '8. Take breaks from screens: Too much screen time can cause eye strain and other health problems. Take breaks from your phone, computer, and TV throughout the day.',
    '9. Stay active throughout the day: Even if you have a desk job, try to stay active by taking short walks or stretching throughout the day.',
    '10. Socialize: Spending time with friends and family can improve mental health and reduce the risk of depression and anxiety.',
    '11. Warm up before exercising: A proper warm-up can prevent injury and improve performance. Spend 5-10 minutes doing light cardio and stretching before your workout.',
    '12. Use proper form: Proper form is essential for preventing injury and getting the most out of your workout. If you are not sure how to do an exercise, ask a trainer or watch a tutorial.',
    '13. Mix it up: Doing the same workout routine day after day can lead to boredom and plateauing. Mix it up by trying new exercises, changing the order of your routine, or increasing the intensity.',
    '14. Set realistic goals: Setting realistic goals can help you stay motivated and track your progress. Make sure your goals are specific, measurable, and achievable.',
    '15. Rest and recover: Rest and recovery are just as important as exercise itself. Give your body time to recover by taking rest days, getting enough sleep, and stretching.',
    '16. Listen to your body: Pay attention to how your body feels during and after exercise. If you feel pain or discomfort, stop and seek advice from a professional.',
    '17. Stay accountable: Find a workout buddy or join a fitness group to stay accountable and motivated. Share your progress and cheer each other on.',
    '18. Be consistent: Consistency is key for seeing results. Make exercise a regular part of your routine, and stick with it even on days when you don\'t feel like it.',
    '19. Stay hydrated during workouts: Drinking water during your workout can prevent dehydration and improve performance. Aim to drink at least 8-16 ounces of water every 15-20 minutes during exercise.',
    '20. Cool down after exercising: Cooling down can help prevent muscle soreness and improve recovery. Spend 5-10 minutes doing light cardio and stretching after your workout.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EXPERT TIPS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff131429),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff131429),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Tips for a Healthy Lifestyle',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: tips.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                tips[index],
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
