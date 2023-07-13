import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Meditation {
  final String name;
  final String imageAsset;
  final String audioAsset;
  final int duration;

  Meditation({
    required this.name,
    required this.imageAsset,
    required this.audioAsset,
    required this.duration,
  });
}

final List<Meditation> meditations = [
  Meditation(
    name: 'Energizing Morning Meditation',
    imageAsset: 'assets/images/morning_meditation_1.jpg',
    audioAsset: 'assets/audio/morning_meditation_1.mp3',
    duration: 334,
  ),
  Meditation(
    name: 'Gratitude and Mindfulness Meditation',
    imageAsset: 'assets/images/morning_meditation_2.jpg',
    audioAsset: 'assets/audio/morning_meditation_2.mp3',
    duration: 336,
  ),
  Meditation(
    name: 'Healing and Renewal Meditation',
    imageAsset: 'assets/images/morning_meditation_3.jpg',
    audioAsset: 'assets/audio/morning_meditation_3.mp3',
    duration: 302,
  ),
  Meditation(
    name: 'Stress Relief and Focus Meditation',
    imageAsset: 'assets/images/morning_meditation_4.jpg',
    audioAsset: 'assets/audio/morning_meditation_4.mp3',
    duration: 300,
  ),
  Meditation(
    name: 'Morning Mindful Breathing Meditation',
    imageAsset: 'assets/images/morning_meditation_5.jpg',
    audioAsset: 'assets/audio/morning_meditation_5.mp3',
    duration: 336,
  ),
];

class MorningMeditationScreen extends StatefulWidget {
  @override
  _MorningMeditationScreenState createState() =>
      _MorningMeditationScreenState();
}

class _MorningMeditationScreenState extends State<MorningMeditationScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  int currentMeditationIndex = 0;
  Timer? timer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadMeditation(0);
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    timer?.cancel();
    super.dispose();
  }

  void _loadMeditation(int index) {
    currentMeditationIndex = index;
    assetsAudioPlayer.open(
      Audio.file(meditations[index].audioAsset),
      autoStart: false, // pause the audio initially
    );
    setState(() {});
  }

  void _play() async {
    await assetsAudioPlayer.play();
    isPlaying = true; // set isPlaying to true
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (assetsAudioPlayer.currentPosition.value.inSeconds >=
          meditations[currentMeditationIndex].duration) {
        _stop();
      }
    });
  }

  void _pause() {
    assetsAudioPlayer.pause();
    isPlaying = false; // set isPlaying to false
    timer?.cancel();
    setState(() {});
  }

  void _stop() {
    assetsAudioPlayer.stop();
    isPlaying = false; // set isPlaying to false
    timer?.cancel();
    setState(() {});
  }

  Widget _buildListItem(BuildContext context, int index) {
    final meditation = meditations[index];
    final isCurrent = currentMeditationIndex == index;
    return ListTile(
      onTap: () {
        if (!isCurrent) {
          _loadMeditation(index);
        }
      },
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(meditation.imageAsset),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        meditation.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        '${meditation.duration ~/ 60}:${(meditation.duration % 60).toString().padLeft(2, '0')}',
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      trailing: isCurrent
          ? IconButton(
              onPressed: _pause,
              icon: Icon(Icons.pause),
            )
          : IconButton(
              onPressed: _play,
              icon: Icon(Icons.play_arrow),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentMeditation = meditations[currentMeditationIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('MORNING MEDITATION'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentMeditation.imageAsset),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentMeditation.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${currentMeditation.duration ~/ 60}:${(currentMeditation.duration % 60).toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: meditations.length,
              itemBuilder: _buildListItem,
            ),
          ),
          if (isPlaying)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value: assetsAudioPlayer.currentPosition.value.inSeconds /
                    currentMeditation.duration,
              ),
            ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _stop,
                  icon: Icon(Icons.stop),
                  color: Colors.grey[600],
                ),
                SizedBox(width: 16),
                if (isPlaying)
                  IconButton(
                    onPressed: _pause,
                    icon: Icon(Icons.pause),
                    color: Colors.grey[600],
                  )
                else
                  IconButton(
                    onPressed: _play,
                    icon: Icon(Icons.play_arrow),
                    color: Colors.grey[600],
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// class MorningMeditationScreen extends StatelessWidget {
//   final List<String> _morningMeditationTitles = [
//     'Morning Meditation 1',
//     'Morning Meditation 2',
//     'Morning Meditation 3',
//     'Morning Meditation 4',
//     'Morning Meditation 5',
//   ];

//   final List<String> _morningMeditationAudios = [
//     'assets/audio/morning_meditation_1.mp3',
//     'assets/audio/morning_meditation_2.mp3',
//     'assets/audio/morning_meditation_3.mp3',
//     'assets/audio/morning_meditation_4.mp3',
//     'assets/audio/morning_meditation_5.mp3',
//   ];

//   final List<String> _morningMeditationImages = [
//     'assets/images/morning_meditation_1.jpg',
//     'assets/images/morning_meditation_2.jpg',
//     'assets/images/morning_meditation_3.jpg',
//     'assets/images/morning_meditation_4.jpg',
//     'assets/images/morning_meditation_5.jpg',
//   ];

//   void _playAudio(BuildContext context, String audioPath) {
//     AudioCache audioCache = AudioCache();
//     try {
//       audioCache.play(audioPath);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Widget _buildMorningMeditationCard(BuildContext context, int index) {
//     return GestureDetector(
//       onTap: () {
//         _playAudio(context, _morningMeditationAudios[index]);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(_morningMeditationImages[index]),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//             decoration: BoxDecoration(
//               color: Colors.black54,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(16.0),
//                 bottomRight: Radius.circular(16.0),
//               ),
//             ),
//             child: Text(
//               _morningMeditationTitles[index],
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Morning Meditation'),
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemCount: _morningMeditationTitles.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//           childAspectRatio: 0.6,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return _buildMorningMeditationCard(context, index);
//         },
//       ),
//     );
//   }
// }
