import 'package:flutter/material.dart';
import 'package:cutfit/config/UserProfile/userProfil.dart';

class Meal {
  final String name;
  final String description;
  final String imageUrl;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  List<String> ingredients;

  Meal({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.ingredients,
  });

  String get allIngredients {
    // Return the concatenated string of ingredients
    return ingredients.join(', ');
  }
}

class MealsScreen extends StatefulWidget {
  const MealsScreen({Key? key}) : super(key: key);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final List<Meal> preWorkoutMeals = [
    Meal(
      name: 'Greek Yogurt with Berries and Granola',
      description:
          'A delicious and healthy pre-workout meal that is high in protein and complex carbohydrates.',
      imageUrl: 'assets/images/pre1jpg.jpg',
      calories: 300,
      protein: 20,
      carbs: 35,
      fat: 10,
      ingredients: [
        'Greek yogurt',
        'Mixed berries (strawberries, blueberries, raspberries)',
        'Granola (low-sugar and low-fat)',
      ],
    ),
    Meal(
      name: 'Avocado Toast with Egg',
      description:
          'A tasty and nutritious pre-workout meal that is packed with healthy fats and protein.',
      imageUrl: 'assets/images/pre2.jpg',
      calories: 350,
      protein: 18,
      carbs: 30,
      fat: 18,
      ingredients: [
        'Avocado',
        'Bread (whole grain or multigrain)',
        'Eggs',
        'Salt',
        'Pepper',
        'Additional toppings such as cherry tomatoes, microgreens, or hot sauce',
      ],
    ),
    Meal(
      name: 'Spinach and Mushroom Omelette',
      description:
          'A nutritious and delicious pre-workout meal that is high in protein and essential nutrients.',
      imageUrl: 'assets/images/pre7.jpg',
      calories: 300,
      protein: 20,
      carbs: 5,
      fat: 15,
      ingredients: [
        'Eggs',
        'Egg',
        'Spinach',
        'Mushrooms',
        'Onion',
        'Garlic',
        'Salt',
        'Pepper',
        'Olive oil',
      ],
    ),
    Meal(
      name: 'Chia Pudding with Mango and Coconut',
      description:
          'A tropical and energizing pre-workout meal that is rich in fiber, healthy fats, and essential nutrients.',
      imageUrl: 'assets/images/pre8.jpg',
      calories: 350,
      protein: 8,
      carbs: 45,
      fat: 18,
      ingredients: [
        'Chia seeds',
        'Coconut milk',
        'Mango',
        'Shredded coconut',
        'Honey',
        'Vanilla extract',
      ],
    ),
    Meal(
      name: 'Dosa with Chutney and Sambar',
      description:
          'A classic and flavorful pre-workout meal from South India that is rich in carbohydrates and essential nutrients.',
      imageUrl: 'assets/images/pre9.jpg',
      calories: 400,
      protein: 10,
      carbs: 65,
      fat: 10,
      ingredients: [
        'Dosa batter (made from rice and lentils)',
        'Coconut chutney (made from coconut, green chili, and spices)',
        'Sambar (a lentil and vegetable stew)',
      ],
    ),
    Meal(
      name: 'Peanut Butter and Banana Sandwich',
      description:
          'A classic pre-workout meal that is rich in carbohydrates and protein.',
      imageUrl: 'assets/images/pre3.jpg',
      calories: 400,
      protein: 18,
      carbs: 55,
      fat: 15,
      ingredients: [
        'Peanut butter',
        'Banana',
        'Bread (whole grain or multigrain)',
        'Honey or jam for added sweetness',
      ],
    ),
    Meal(
      name: 'Oatmeal with Almonds and Berries',
      description:
          'A filling and nutritious pre-workout meal that is high in fiber, protein, and healthy fats.',
      imageUrl: 'assets/images/pre4.jpg',
      calories: 350,
      protein: 12,
      carbs: 50,
      fat: 10,
      ingredients: [
        'Oatmeal (rolled oats)',
        'Almonds (sliced or chopped)',
        'Berries (such as blueberries, strawberries, or raspberries)',
      ],
    ),
    Meal(
      name: 'Whole Wheat Bagel with Cream Cheese',
      description:
          'A delicious and satisfying pre-workout meal that is high in protein and healthy fats.',
      imageUrl: 'assets/images/pre5.jpg',
      calories: 400,
      protein: 20,
      carbs: 50,
      fat: 15,
      ingredients: [
        'Whole wheat bagel',
        'Cream cheese (low-fat or regular)',
        'milk',
      ],
    ),
    Meal(
      name: 'Blueberry Smoothie with Greek Yogurt and Chia Seeds',
      description:
          'A refreshing and energizing pre-workout meal that is high in protein and antioxidants.',
      imageUrl: 'assets/images/pre6.jpg',
      calories: 300,
      protein: 15,
      carbs: 40,
      fat: 10,
      ingredients: [
        'Blueberries (fresh or frozen)',
        'Greek yogurt (low-fat or regular)',
        'Chia seeds',
      ],
    ),
  ];

  final List<Meal> postWorkoutMeals = [
    Meal(
      name: 'Chickpea and Vegetable Curry with Brown Rice',
      description:
          'A delicious and hearty post-workout meal that is rich in protein, fiber, and complex carbohydrates.',
      imageUrl: 'assets/images/post7.jpg',
      calories: 450,
      protein: 20,
      carbs: 70,
      fat: 12,
      ingredients: [
        'Chickpeas',
        'Mixed vegetables (such as carrots, green beans, and cauliflower)',
        'Brown rice',
        'Tomatoes',
        'Onion',
        'Garlic',
        'Ginger',
        'Coconut milk',
        'Vegetable oil',
        'Herbs and spices (such as cumin, coriander, turmeric, chili powder, and salt)',
      ],
    ),
    Meal(
      name: 'Spinach and Paneer Salad with Quinoa',
      description:
          'A light and refreshing post-workout meal that is packed with protein, fiber, and essential nutrients.',
      imageUrl: 'assets/images/post8.jpg',
      calories: 400,
      protein: 25,
      carbs: 40,
      fat: 15,
      ingredients: [
        'Spinach',
        'Paneer (Indian cottage cheese)',
        'Quinoa',
        'Cherry tomatoes',
        'Cucumber',
        'Red onion',
        'Lemon juice',
        'Olive oil',
        'Herbs and spices (such as oregano, thyme, and salt)',
      ],
    ),
    Meal(
      name: 'Moong Dal Khichdi with Yogurt',
      description:
          'A classic post-workout meal that is easy to digest and provides a balanced mix of protein, carbohydrates, and healthy fats.',
      imageUrl: 'assets/images/post9.jpg',
      calories: 350,
      protein: 15,
      carbs: 50,
      fat: 10,
      ingredients: [
        'Moong dal (split green gram)',
        'Rice',
        'Ghee (clarified butter)',
        'Cumin seeds',
        'Turmeric',
        'Salt',
        'Plain yogurt',
        'Cilantro',
        'Green chilies',
      ],
    ),
    Meal(
      name: 'Masala Omelette with Multigrain Toast',
      description:
          'A protein-rich and filling post-workout meal that is easy to prepare and delicious.',
      imageUrl: 'assets/images/post10.jpg',
      calories: 400,
      protein: 25,
      carbs: 30,
      fat: 20,
      ingredients: [
        'Eggs',
        'Onion',
        'Tomato',
        'Green chili',
        'Coriander leaves',
        'Turmeric',
        'Salt',
        'Multigrain bread',
        'Butter',
      ],
    ),
    Meal(
      name: 'Ragi Porridge with Almonds and Dates',
      description:
          'A nutrient-dense and energy-boosting post-workout meal that is rich in fiber, calcium, and antioxidants.',
      imageUrl: 'assets/images/post11.jpg',
      calories: 350,
      protein: 10,
      carbs: 45,
      fat: 15,
      ingredients: [
        'Ragi (finger millet) flour',
        'Almond milk',
        'Dates',
        'Almonds',
        'Cinnamon',
        'Cardamom',
        'Honey',
      ],
    ),
    Meal(
      name: 'Chapati Roll with Grilled Paneer and Vegetables',
      description:
          'A wholesome and flavorful post-workout meal that is packed with protein, fiber, and essential nutrients.',
      imageUrl: 'assets/images/post12.jpg',
      calories: 450,
      protein: 20,
      carbs: 60,
      fat: 15,
      ingredients: [
        'Chapati (Indian flatbread)',
        'Paneer (Indian cottage cheese)',
        'Mixed vegetables (such as bell peppers, onions, and mushrooms)',
        'Lemon juice',
        'Coriander leaves',
        'Cumin',
        'Ginger-garlic paste',
        'Salt',
        'Oil',
      ],
    ),
    Meal(
      name: 'Grilled Chicken with Roasted Vegetables and Quinoa',
      description:
          'A healthy and filling post-workout meal that is high in protein and complex carbohydrates.',
      imageUrl: 'assets/images/post1.jpg',
      calories: 450,
      protein: 35,
      carbs: 40,
      fat: 15,
      ingredients: [
        'Chicken breast (boneless, skinless)',
        'Assorted vegetables (such as bell peppers, carrots, and broccoli)',
        'Quinoa (cooked)',
        'Olive oil (for roasting)',
        'Herbs and spices (such as garlic powder, paprika, and thyme)',
      ],
    ),
    Meal(
      name: 'Salmon Poke Bowl',
      description:
          'A delicious and nutritious post-workout meal that is packed with omega-3 fatty acids and protein.',
      imageUrl: 'assets/images/post2.jpg',
      calories: 400,
      protein: 25,
      carbs: 45,
      fat: 15,
      ingredients: [
        'Salmon fillet (fresh or frozen)',
        'Sushi rice (cooked)',
        'Mixed vegetables (such as cucumbers, carrots, and avocado)',
        'Soy sauce or tamari',
        'Sesame oil',
        'Sesame seeds',
        'Green onions (sliced)',
        'Pickled ginger and wasabi (optional)',
      ],
    ),
    Meal(
      name: 'Grilled Sirloin Steak with Sweet Potato and Asparagus',
      description:
          'A hearty and nutritious post-workout meal that is high in protein and fiber.',
      imageUrl: 'assets/images/post3.jpg',
      calories: 500,
      protein: 45,
      carbs: 35,
      fat: 20,
      ingredients: [
        'Sirloin steak',
        'Sweet potatoes (peeled and cubed)',
        'Asparagus spears',
        'Olive oil',
        'Herbs and spices (such as rosemary, thyme, and garlic powder)',
        'Salt and pepper (to taste)',
      ],
    ),
    Meal(
      name: 'Quinoa and Black Bean Salad with Grilled Chicken',
      description:
          ' A light and refreshing post-workout meal that is high in protein and fiber.',
      imageUrl: 'assets/images/post4.jpg',
      calories: 400,
      protein: 30,
      carbs: 40,
      fat: 15,
      ingredients: [
        'Quinoa (cooked)',
        'Black beans (canned or cooked)',
        'Grilled chicken breast (sliced)',
        'Mixed vegetables (such as bell peppers, red onion, and cilantro)',
        'Lime juice',
        'Olive oil',
        'Salt and pepper (to taste)',
      ],
    ),
    Meal(
      name: 'Baked Salmon with Broccoli and Brown Rice',
      description:
          'A healthy and flavorful post-workout meal that is high in protein and omega-3 fatty acids.',
      imageUrl: 'assets/images/post5.jpg',
      calories: 450,
      protein: 35,
      carbs: 35,
      fat: 20,
      ingredients: [
        'Salmon fillet',
        'Broccoli',
        'Brown rice',
        'Olive oil',
        'Lemon juice',
        'Garlic',
        'Salt and pepper (to taste)',
      ],
    ),
    Meal(
      name: 'Lentil Soup with Grilled Chicken Breast',
      description:
          'A warming and comforting post-workout meal that is high in protein and fiber.',
      imageUrl: 'assets/images/post6.jpg',
      calories: 350,
      protein: 30,
      carbs: 35,
      fat: 10,
      ingredients: [
        'Lentils',
        'Grilled chicken breast',
        'Carrots',
        'Celery',
        'Onion',
        'Garlic',
        'Vegetable broth',
        'Olive oil',
        'Herbs and spices (such as thyme, bay leaves, salt, and pepper)',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WORKOUT MEALS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff131429),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('WORKOUT MEALS')),
            backgroundColor: Color(0xff131429),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Pre-Workout Meals'),
                Tab(text: 'Post-Workout Meals'),
              ],
            ),
          ),
          body: Container(
            color: Color(0xff131429), // set background color to deep blue
            child: TabBarView(
              children: [
                buildMealList(preWorkoutMeals),
                buildMealList(postWorkoutMeals),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMealList(List<Meal> meals) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
          color: Colors.white,
          height: 1), // Set height to 1 for a thinner divider
      itemCount: meals.length,
      itemBuilder: (context, index) {
        // Check if the allergy value from user's stats matches the meal's name or ingredients
        bool shouldShowMeal = true;
        String allergyValue = UserProfileStats.stats
            .firstWhere((element) => element['title'] == 'Allergy')['value'];
        if (allergyValue.isNotEmpty) {
          String mealName = meals[index].name.toLowerCase();
          String mealIngredients =
              meals[index].ingredients.join(', ').toLowerCase();
          List<String> allergyValues = allergyValue.toLowerCase().split(',');
          // Split the allergy value by comma to handle multiple values
          for (String value in allergyValues) {
            // Check if the meal's name or ingredients contain the allergy value
            if (mealName.contains(value.trim()) ||
                mealIngredients.contains(value.trim())) {
              shouldShowMeal = false;
              break;
            }
          }
        }
        return shouldShowMeal
            ? Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(meals[index].imageUrl),
                    ),
                    title: Text(
                      meals[index].name,
                      style: TextStyle(
                          color: Colors.white), // set text color to white
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8), // Add line spacing with SizedBox
                        Text(
                          '${meals[index].calories} kcal',
                          style: TextStyle(
                              color: Colors.white), // set text color to white
                        ),
                        SizedBox(height: 4), // Add line spacing with SizedBox
                        Text(
                          '${meals[index].protein}g protein, ${meals[index].carbs}g carbs, ${meals[index].fat}g fat',
                          style: TextStyle(
                              color: Colors.white), // set text color to white
                        ),
                        SizedBox(height: 4), // Add line spacing with SizedBox
                        Text(
                          meals[index].description,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8), // Add line spacing with SizedBox
                      ],
                    ),
                  ),
                ],
              )
            : Container(); // Return an empty container if meal should not be shown
      },
    );
  }

  void _showPopupMessage(String allergyValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Add BuildContext parameter
        return AlertDialog(
          title: Text('Allergy Alert'),
          content: Text(
              'Since you are allergic to $allergyValue, you should stay away from $allergyValue ingredients. These are the meals that do not contain $allergyValue:'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:work_out/config/UserProfile/userProfil.dart';

// class Meal {
//   final String name;
//   final String description;
//   final String imageUrl;
//   final int calories;
//   final int protein;
//   final int carbs;
//   final int fat;
//   List<String> ingredients;

//   Meal({
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.calories,
//     required this.protein,
//     required this.carbs,
//     required this.fat,
//     required this.ingredients,
//   });

//   String get allIngredients {
//     // Return the concatenated string of ingredients
//     return ingredients.join(', ');
//   }
// }

// class MealsScreen extends StatefulWidget {
//   const MealsScreen({Key? key}) : super(key: key);

//   @override
//   _MealsScreenState createState() => _MealsScreenState();
// }

// class _MealsScreenState extends State<MealsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     String allergyValue = UserProfileStats.stats
//         .firstWhere((element) => element['title'] == 'Allergy')['value'];
//     if (allergyValue.isNotEmpty) {
//       _showPopupMessage(allergyValue);
//     }
//   }

//   final List<Meal> preWorkoutMeals = [
//     Meal(
//       name: 'Greek Yogurt with Berries and Granola',
//       description:
//           'A delicious and healthy pre-workout meal that is high in protein and complex carbohydrates.',
//       imageUrl: 'assets/images/pre1jpg.jpg',
//       calories: 300,
//       protein: 20,
//       carbs: 35,
//       fat: 10,
//       ingredients: [
//         'Greek yogurt',
//         'Mixed berries (strawberries, blueberries, raspberries)',
//         'Granola (low-sugar and low-fat)',
//       ],
//     ),
  //   Meal(
  //     name: 'Avocado Toast with Egg',
  //     description:
  //         'A tasty and nutritious pre-workout meal that is packed with healthy fats and protein.',
  //     imageUrl: 'assets/images/pre2.jpg',
  //     calories: 350,
  //     protein: 18,
  //     carbs: 30,
  //     fat: 18,
  //     ingredients: [
  //       'Avocado',
  //       'Bread (whole grain or multigrain)',
  //       'Egg',
  //       'Salt',
  //       'Pepper',
  //       'Additional toppings such as cherry tomatoes, microgreens, or hot sauce',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Peanut Butter and Banana Sandwich',
  //     description:
  //         'A classic pre-workout meal that is rich in carbohydrates and protein.',
  //     imageUrl: 'assets/images/pre3.jpg',
  //     calories: 400,
  //     protein: 18,
  //     carbs: 55,
  //     fat: 15,
  //     ingredients: [
  //       'Peanut butter',
  //       'Banana',
  //       'Bread (whole grain or multigrain)',
  //       'Honey or jam for added sweetness',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Oatmeal with Almonds and Berries',
  //     description:
  //         'A filling and nutritious pre-workout meal that is high in fiber, protein, and healthy fats.',
  //     imageUrl: 'assets/images/pre4.jpg',
  //     calories: 350,
  //     protein: 12,
  //     carbs: 50,
  //     fat: 10,
  //     ingredients: [
  //       'Oatmeal (rolled oats)',
  //       'Almonds (sliced or chopped)',
  //       'Berries (such as blueberries, strawberries, or raspberries)',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Whole Wheat Bagel with Cream Cheese',
  //     description:
  //         'A delicious and satisfying pre-workout meal that is high in protein and healthy fats.',
  //     imageUrl: 'assets/images/pre5.jpg',
  //     calories: 400,
  //     protein: 20,
  //     carbs: 50,
  //     fat: 15,
  //     ingredients: [
  //       'Whole wheat bagel',
  //       'Cream cheese (low-fat or regular)',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Blueberry Smoothie with Greek Yogurt and Chia Seeds',
  //     description:
  //         'A refreshing and energizing pre-workout meal that is high in protein and antioxidants.',
  //     imageUrl: 'assets/images/pre6.jpg',
  //     calories: 300,
  //     protein: 15,
  //     carbs: 40,
  //     fat: 10,
  //     ingredients: [
  //       'Blueberries (fresh or frozen)',
  //       'Greek yogurt (low-fat or regular)',
  //       'Chia seeds',
  //     ],
  //   ),
  // ];

//   final List<Meal> postWorkoutMeals = [
//     Meal(
//       name: 'Grilled Chicken with Roasted Vegetables and Quinoa',
//       description:
//           'A healthy and filling post-workout meal that is high in protein and complex carbohydrates.',
//       imageUrl: 'assets/images/post1.jpg',
//       calories: 450,
//       protein: 35,
//       carbs: 40,
//       fat: 15,
//       ingredients: [
//         'Chicken breast (boneless, skinless)',
//         'Assorted vegetables (such as bell peppers, carrots, and broccoli)',
//         'Quinoa (cooked)',
//         'Olive oil (for roasting)',
//         'Herbs and spices (such as garlic powder, paprika, and thyme)',
//       ],
//     ),
  //   Meal(
  //     name: 'Salmon Poke Bowl',
  //     description:
  //         'A delicious and nutritious post-workout meal that is packed with omega-3 fatty acids and protein.',
  //     imageUrl: 'assets/images/post2.jpg',
  //     calories: 400,
  //     protein: 25,
  //     carbs: 45,
  //     fat: 15,
  //     ingredients: [
  //       'Salmon fillet (fresh or frozen)',
  //       'Sushi rice (cooked)',
  //       'Mixed vegetables (such as cucumbers, carrots, and avocado)',
  //       'Soy sauce or tamari',
  //       'Sesame oil',
  //       'Sesame seeds',
  //       'Green onions (sliced)',
  //       'Pickled ginger and wasabi (optional)',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Grilled Sirloin Steak with Sweet Potato and Asparagus',
  //     description:
  //         'A hearty and nutritious post-workout meal that is high in protein and fiber.',
  //     imageUrl: 'assets/images/post3.jpg',
  //     calories: 500,
  //     protein: 45,
  //     carbs: 35,
  //     fat: 20,
  //     ingredients: [
  //       'Sirloin steak',
  //       'Sweet potatoes (peeled and cubed)',
  //       'Asparagus spears',
  //       'Olive oil',
  //       'Herbs and spices (such as rosemary, thyme, and garlic powder)',
  //       'Salt and pepper (to taste)',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Quinoa and Black Bean Salad with Grilled Chicken',
  //     description:
  //         ' A light and refreshing post-workout meal that is high in protein and fiber.',
  //     imageUrl: 'assets/images/post4.jpg',
  //     calories: 400,
  //     protein: 30,
  //     carbs: 40,
  //     fat: 15,
  //     ingredients: [
  //       'Quinoa (cooked)',
  //       'Black beans (canned or cooked)',
  //       'Grilled chicken breast (sliced)',
  //       'Mixed vegetables (such as bell peppers, red onion, and cilantro)',
  //       'Lime juice',
  //       'Olive oil',
  //       'Salt and pepper (to taste)',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Baked Salmon with Broccoli and Brown Rice',
  //     description:
  //         'A healthy and flavorful post-workout meal that is high in protein and omega-3 fatty acids.',
  //     imageUrl: 'assets/images/post5.jpg',
  //     calories: 450,
  //     protein: 35,
  //     carbs: 35,
  //     fat: 20,
  //     ingredients: [
  //       'Salmon fillet',
  //       'Broccoli',
  //       'Brown rice',
  //       'Olive oil',
  //       'Lemon juice',
  //       'Garlic',
  //       'Salt and pepper (to taste)',
  //     ],
  //   ),
  //   Meal(
  //     name: 'Lentil Soup with Grilled Chicken Breast',
  //     description:
  //         'A warming and comforting post-workout meal that is high in protein and fiber.',
  //     imageUrl: 'assets/images/post6.jpg',
  //     calories: 350,
  //     protein: 30,
  //     carbs: 35,
  //     fat: 10,
  //     ingredients: [
  //       'Lentils',
  //       'Grilled chicken breast',
  //       'Carrots',
  //       'Celery',
  //       'Onion',
  //       'Garlic',
  //       'Vegetable broth',
  //       'Olive oil',
  //       'Herbs and spices (such as thyme, bay leaves, salt, and pepper)',
  //     ],
  //   ),
  // ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'WORKOUT MEALS',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         primaryColor: Color(0xff131429),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Center(child: Text('WORKOUT MEALS')),
//             backgroundColor: Color(0xff131429),
//             bottom: TabBar(
//               tabs: [
//                 Tab(text: 'Pre-Workout Meals'),
//                 Tab(text: 'Post-Workout Meals'),
//               ],
//             ),
//           ),
//           body: Container(
//             color: Color(0xff131429), // set background color to deep blue
//             child: TabBarView(
//               children: [
//                 buildMealList(preWorkoutMeals),
//                 buildMealList(postWorkoutMeals),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildMealList(List<Meal> meals) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => Divider(
//           color: Colors.white,
//           height: 1), // Set height to 1 for a thinner divider
//       itemCount: meals.length,
//       itemBuilder: (context, index) {
//         // Check if the allergy value from user's stats matches the meal's name or ingredients
//         bool shouldShowMeal = true;
//         String allergyValue = UserProfileStats.stats
//             .firstWhere((element) => element['title'] == 'Allergy')['value'];
//         if (allergyValue.isNotEmpty) {
//           String mealName = meals[index].name.toLowerCase();
//           String mealIngredients =
//               meals[index].ingredients.join(', ').toLowerCase();
//           // Use .join(', ') to concatenate the ingredients list into a string
//           // and then call .toLowerCase() to convert it to lowercase
//           if (mealName.contains(allergyValue.toLowerCase()) ||
//               mealIngredients.contains(allergyValue.toLowerCase())) {
//             shouldShowMeal = false;
//           }
//         }

//         return shouldShowMeal
//             ? Column(
//                 children: [
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(meals[index].imageUrl),
//                     ),
//                     title: Text(
//                       meals[index].name,
//                       style: TextStyle(
//                           color: Colors.white), // set text color to white
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8), // Add line spacing with SizedBox
//                         Text(
//                           '${meals[index].calories} kcal',
//                           style: TextStyle(
//                               color: Colors.white), // set text color to white
//                         ),
//                         SizedBox(height: 4), // Add line spacing with SizedBox
//                         Text(
//                           '${meals[index].protein}g protein, ${meals[index].carbs}g carbs, ${meals[index].fat}g fat',
//                           style: TextStyle(
//                               color: Colors.white), // set text color to white
//                         ),
//                         SizedBox(height: 4), // Add line spacing with SizedBox
//                         Text(
//                           meals[index].description,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         SizedBox(height: 8), // Add line spacing with SizedBox
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//             : Container(); // Return an empty container if meal should not be shown
//       },
//     );
//   }

//   void _showPopupMessage(String allergyValue) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // Add BuildContext parameter
//         return AlertDialog(
//           title: Text('Allergy Alert'),
//           content: Text(
//               'Since you are allergic to $allergyValue, you should stay away from $allergyValue ingredients. These are the meals that do not contain $allergyValue:'),
//           actions: <Widget>[
//             ElevatedButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
