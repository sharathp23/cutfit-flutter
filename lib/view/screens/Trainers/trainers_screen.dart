import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class Trainer {
  final String name;
  final String specialty;
  final String profileImageAssetPath;
  final String experience;
  final String education;
  final String certifications;
  final String contactInfo;
  final String website;
  final String city;
  final double rating;
  final String videoUrl;

  Trainer({
    required this.name,
    required this.specialty,
    required this.profileImageAssetPath,
    required this.experience,
    required this.education,
    required this.certifications,
    required this.contactInfo,
    required this.website,
    required this.city,
    required this.rating,
    required this.videoUrl,
  });
}

class TrainersScreen extends StatelessWidget {
  final List<Trainer> trainers = [
    Trainer(
        name: 'Yasmin Karachiwala',
        specialty: 'Pilates',
        profileImageAssetPath: 'assets/images/tr1.jpg',
        experience: 'Over 25 years',
        education: 'Pilates Master Trainer',
        certifications: 'Stott Pilates, Balanced Body University, Basi Pilates',
        rating: 4.7,
        contactInfo: '02266716664',
        website: 'https://www.bodyimage.in/',
        city: 'Mumbai',
        videoUrl: 'https://www.youtube.com/@Yasminbodyimage'),
    Trainer(
        name: 'Shwetambari Shetty',
        specialty: 'Zumba',
        profileImageAssetPath: 'assets/images/tr2.jpg',
        experience: 'Over 10 years',
        education: 'Zumba Education Specialist',
        certifications: 'Zumba, Piloxing, Strong by Zumba, Masala Bhangra',
        rating: 4.7,
        contactInfo: 'https://in.linkedin.com/in/shwetambarishetty',
        website: 'www.zumbawithshweta.com',
        city: 'Mumbai',
        videoUrl: 'https://www.youtube.com/@shwetambarishetty6339'),
    Trainer(
        name: 'Shivoham',
        specialty: 'Yoga and Fitness',
        profileImageAssetPath: 'assets/images/tr3.jpg',
        experience: 'Over 15 years',
        education: 'Diploma in Yoga and Naturopathy',
        certifications: 'Certified Yoga Instructor',
        rating: 4.8,
        contactInfo: 'sandeep@sandsfit.in',
        website: 'https://in.linkedin.com/in/sandeep-sachdev-667759b',
        city: 'Bengaluru',
        videoUrl: 'https://www.youtube.com/@crossfitom'),
    Trainer(
        name: 'Namrata Purohit',
        specialty: 'Pilates',
        profileImageAssetPath: 'assets/images/tr4.jpg',
        experience: 'Over 10 years',
        education: 'Pilates Master Trainer',
        certifications: 'Balanced Body University, The Pilates Standard',
        rating: 4.6,
        contactInfo: 'info@namratapurohit.com',
        website: 'http://www.namratapurohit.com/',
        city: 'Mumbai',
        videoUrl: 'https://www.youtube.com/@NamrataPurohitOfficial'),
    Trainer(
        name: 'Kunal Rajput',
        specialty: 'Functional Training',
        profileImageAssetPath: 'assets/images/tr5.jpg',
        experience: 'Over 8 years',
        education: 'Functional Training Specialist',
        certifications: 'TRX, Kettlebell, Animal Flow',
        rating: 4.5,
        contactInfo: 'https://www.instagram.com/subtle.strength/?hl=en',
        website: 'www.kunalrajputfitness.com',
        city: 'Delhi',
        videoUrl: 'https://www.youtube.com/@subtle.strength'),
    Trainer(
        name: 'Jitendra Chouksey',
        specialty: 'Fitness and Nutrition',
        profileImageAssetPath: 'assets/images/tr6.jpg',
        experience: '10 years',
        education: 'Bachelors Degree in Computer Science',
        certifications: 'Certified Fitness Trainer, Certified Nutritionist',
        rating: 4.9,
        contactInfo: 'sumayadalmia@gmail.com',
        website: 'https://sumaya.in/',
        city: 'Mumbai',
        videoUrl: 'https://www.youtube.com/@Fittrjc'),
    Trainer(
        name: 'Rujuta Diwekar',
        specialty: 'Nutrition',
        profileImageAssetPath: 'assets/images/tr7.jpg',
        experience: '20 years',
        education:
            'Bachelor of Science in Home Science, Post Graduate in Sports Science and Nutrition',
        certifications:
            'Certified Sports Nutritionist, Certified Diabetes Educator',
        rating: 4.8,
        contactInfo: 'info@rujutadiwekar.com',
        website: 'https://www.rujutadiwekar.com/engage.aspx',
        city: 'Mumbai',
        videoUrl: 'https://www.youtube.com/@Rujutadiwekarofficial'),
    Trainer(
        name: 'Guru Mann',
        specialty: 'Fitness',
        profileImageAssetPath: 'assets/images/tr8.jpg',
        experience: '15 years',
        education: 'Bachelor of Science in Health and Physical Education',
        certifications:
            'Certified Fitness Trainer, Certified Sports Nutritionist',
        rating: 4.6,
        contactInfo: 'info@gurumann.com',
        website: 'http://www.gurumann.com/',
        city: 'Los Angeles',
        videoUrl: 'https://www.youtube.com/user/TheBodyworkouts'),
    Trainer(
        name: 'Sangram Chougule',
        specialty: 'Bodybuilding and Fitness',
        profileImageAssetPath: 'assets/images/tr9.jpg',
        experience: 'Over 15 years',
        education: 'Bachelors Degree in Commerce',
        certifications: 'Certified Fitness Trainer',
        rating: 4.7,
        contactInfo: '081476 65800',
        website: 'https://www.instagram.com/karthikkittureddy4/',
        city: 'Pune',
        videoUrl: 'https://www.youtube.com/@sangramchouguleofficial'),
  ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRAINERS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff131429),
      ),
      body: Container(
        color: Color(0xff131429), // set background color to blue
        child: ListView.builder(
          itemCount: trainers.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage(trainers[index].profileImageAssetPath),
              ),
              title: Text(
                trainers[index].name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                trainers[index].specialty,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TrainerDetailsScreen(trainer: trainers[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TrainerDetailsScreen extends StatelessWidget {
  final Trainer trainer;

  TrainerDetailsScreen({required this.trainer});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trainer.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200, // replace with actual image height
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(trainer.profileImageAssetPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${trainer.name}, ${trainer.specialty}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Display the trainer's experience, education, and certifications
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Experience'),
              subtitle: Text(trainer.experience),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Education'),
              subtitle: Text(trainer.education),
            ),
            ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Certifications'),
              subtitle: Text(trainer.certifications),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('City'),
              subtitle: Text(trainer.city),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(trainer.website); // Launch website URL
              },
              child: ListTile(
                leading: Icon(Icons.language),
                title: Text('Website'),
                subtitle: Text(
                  trainer.website,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(trainer.videoUrl); // Launch YouTube URL
              },
              child: ListTile(
                leading: Icon(Icons.play_circle_fill),
                title: Text('Youtube'),
                subtitle: Text(
                  trainer.videoUrl,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Display the trainer's rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8),
                Text('${trainer.rating}'),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
