import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cutfit/view/screens/Meditation/meditation.dart';
import 'package:cutfit/view/screens/quotes/quotes.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  List<String> breathingDialogs = [
    'Breathe in and out for 5 minutes.',
    'Inhale for 4 counts, hold for 7 counts, exhale for 8 counts.',
    'Breathe in deeply through your nose, then exhale slowly through your mouth.',
    'Inhale deeply and fill your lungs with air, then exhale slowly and completely.',
    'Breathe in for 4 counts, hold for 4 counts, and exhale for 4 counts.',
    'Take a deep breath in, hold it for a few seconds, and then exhale slowly.',
    'Inhale through your nose for 4 counts, hold for 4 counts, and exhale through your mouth for 6 counts.',
    'Breathe in slowly for 5 seconds, hold for 3 seconds, and exhale for 7 seconds.',
    'Inhale deeply and exhale slowly, focusing on your breath and letting go of any tension.',
    'Breathe in and out slowly and deeply, feeling the rise and fall of your chest with each breath.'
  ];

  int currentDialogIndex = 0;

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  void playOmChanting() async {
    await assetsAudioPlayer.open(
      Audio('assets/audio/om_chanting.mp3'),
    );
    assetsAudioPlayer.play();
    print('Om Chanting audio played successfully.');
  }

  void stopOmChanting() async {
    assetsAudioPlayer.stop();
  }

  void navigateToMeditation1Screen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Meditation1Screen()),
    );
  }

  void navigateToQuotesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuotesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/meditation_bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Breathing Dialog'),
                    content: Text(breathingDialogs[currentDialogIndex]),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (currentDialogIndex ==
                              breathingDialogs.length - 1) {
                            // last dialog, go back to first dialog
                            currentDialogIndex = 0;
                          } else {
                            currentDialogIndex++;
                          }
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Breathing Dialog'),
                              content:
                                  Text(breathingDialogs[currentDialogIndex]),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Done'),
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
              },
              child: Text('Start Breathing'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateToMeditation1Screen();
              },
              child: Text('Meditation'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateToQuotesScreen();
              },
              child: Text('Quotes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                playOmChanting();
              },
              child: Text('Om Chanting'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                stopOmChanting();
              },
              child: Text('Stop Om Chanting'),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
