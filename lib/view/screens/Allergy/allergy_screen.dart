import 'package:flutter/material.dart';
import 'package:cutfit/config/UserProfile/userProfil.dart';

class AllergyScreen extends StatefulWidget {
  const AllergyScreen({Key? key}) : super(key: key);

  @override
  _AllergyScreenState createState() => _AllergyScreenState();
}

class _AllergyScreenState extends State<AllergyScreen> {
  List<String> _selectedAllergens = [];
  String? _ingredients;

  final List<String> _allergens = [
    'Peanuts',
    'Tree Nuts',
    'Milk',
    'Eggs',
    'Fish',
    'Shellfish',
    'Wheat',
    'Soy'
  ];

  final TextEditingController _ingredientsController = TextEditingController();
  bool? _isAllergic;

  void _checkAllergy(BuildContext context) {
    if (_selectedAllergens.isNotEmpty && _ingredients != null) {
      bool isAllergic = false;
      String? detectedAllergen;
      for (String allergen in _selectedAllergens) {
        if (allergen == 'Wheat') {
          if (_ingredients!.toLowerCase().contains('wheat') ||
              _ingredients!.toLowerCase().contains('flour') ||
              _ingredients!.toLowerCase().contains('bread') ||
              _ingredients!.toLowerCase().contains('pasta') ||
              _ingredients!.toLowerCase().contains('cereal') ||
              _ingredients!.toLowerCase().contains('cracker') ||
              _ingredients!.toLowerCase().contains('wheat germ') ||
              _ingredients!.toLowerCase().contains('semolina') ||
              _ingredients!.toLowerCase().contains('durum') ||
              _ingredients!.toLowerCase().contains('spelt') ||
              _ingredients!.toLowerCase().contains('kamut') ||
              _ingredients!.toLowerCase().contains('bulgur') ||
              _ingredients!.toLowerCase().contains('farina') ||
              _ingredients!.toLowerCase().contains('malt') ||
              _ingredients!.toLowerCase().contains('breadcrumbs') ||
              _ingredients!.toLowerCase().contains('couscous')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Peanuts') {
          if (_ingredients!.toLowerCase().contains('peanuts') ||
              _ingredients!.toLowerCase().contains('groundnuts') ||
              _ingredients!.toLowerCase().contains('goober peas') ||
              _ingredients!.toLowerCase().contains('beer nuts') ||
              _ingredients!.toLowerCase().contains('mandelonas') ||
              _ingredients!.toLowerCase().contains('nut meat') ||
              _ingredients!.toLowerCase().contains('peanut butter') ||
              _ingredients!.toLowerCase().contains('peanut oil') ||
              _ingredients!.toLowerCase().contains('artificial nuts') ||
              _ingredients!.toLowerCase().contains('mixed nuts') ||
              _ingredients!.toLowerCase().contains('monkey nuts') ||
              _ingredients!.toLowerCase().contains('paleo nuts') ||
              _ingredients!.toLowerCase().contains('nut') ||
              _ingredients!.toLowerCase().contains('gianduja') ||
              _ingredients!.toLowerCase().contains('praline') ||
              _ingredients!.toLowerCase().contains('nutella')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Tree Nuts') {
          if (_ingredients!.toLowerCase().contains('almonds') ||
              _ingredients!.toLowerCase().contains('tree nuts') ||
              _ingredients!.toLowerCase().contains('tree nut') ||
              _ingredients!.toLowerCase().contains('cashews') ||
              _ingredients!.toLowerCase().contains('walnuts') ||
              _ingredients!.toLowerCase().contains('pecans') ||
              _ingredients!.toLowerCase().contains('pistachios') ||
              _ingredients!.toLowerCase().contains('macadamia nuts') ||
              _ingredients!.toLowerCase().contains('pine nuts') ||
              _ingredients!.toLowerCase().contains('chestnuts') ||
              _ingredients!.toLowerCase().contains('hazelnuts') ||
              _ingredients!.toLowerCase().contains('filberts') ||
              _ingredients!.toLowerCase().contains('nut oils') ||
              _ingredients!.toLowerCase().contains('nut pastes') ||
              _ingredients!.toLowerCase().contains('marzipan')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Milk') {
          if (_ingredients!.toLowerCase().contains('milk') ||
              _ingredients!.toLowerCase().contains('butter') ||
              _ingredients!.toLowerCase().contains('cream') ||
              _ingredients!.toLowerCase().contains('cheese') ||
              _ingredients!.toLowerCase().contains('whey') ||
              _ingredients!.toLowerCase().contains('casein') ||
              _ingredients!.toLowerCase().contains('lactose') ||
              _ingredients!.toLowerCase().contains('curds') ||
              _ingredients!.toLowerCase().contains('ghee') ||
              _ingredients!.toLowerCase().contains('yogurt') ||
              _ingredients!.toLowerCase().contains('cottage cheese') ||
              _ingredients!.toLowerCase().contains('sour cream') ||
              _ingredients!.toLowerCase().contains('milk powder') ||
              _ingredients!.toLowerCase().contains('evaporated milk') ||
              _ingredients!.toLowerCase().contains('condensed milk') ||
              _ingredients!.toLowerCase().contains('buttermilk') ||
              _ingredients!.toLowerCase().contains('cheese powder')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Eggs') {
          if (_ingredients!.toLowerCase().contains('eggs') ||
              _ingredients!.toLowerCase().contains('egg') ||
              _ingredients!.toLowerCase().contains('egg whites') ||
              _ingredients!.toLowerCase().contains('egg yolks') ||
              _ingredients!.toLowerCase().contains('albumin') ||
              _ingredients!.toLowerCase().contains('globulin') ||
              _ingredients!.toLowerCase().contains('ovomucin') ||
              _ingredients!.toLowerCase().contains('ovoglobulin')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Fish') {
          if (_ingredients!.toLowerCase().contains('fish') ||
              _ingredients!.toLowerCase().contains('anchovies') ||
              _ingredients!.toLowerCase().contains('fishes') ||
              _ingredients!.toLowerCase().contains('cod') ||
              _ingredients!.toLowerCase().contains('haddock') ||
              _ingredients!.toLowerCase().contains('salmon') ||
              _ingredients!.toLowerCase().contains('tuna') ||
              _ingredients!.toLowerCase().contains('trout') ||
              _ingredients!.toLowerCase().contains('halibut') ||
              _ingredients!.toLowerCase().contains('bass') ||
              _ingredients!.toLowerCase().contains('catfish') ||
              _ingredients!.toLowerCase().contains('mahi mahi') ||
              _ingredients!.toLowerCase().contains('tilapia') ||
              _ingredients!.toLowerCase().contains('perch') ||
              _ingredients!.toLowerCase().contains('pike') ||
              _ingredients!.toLowerCase().contains('flounder') ||
              _ingredients!.toLowerCase().contains('whitefish') ||
              _ingredients!.toLowerCase().contains('smelt') ||
              _ingredients!.toLowerCase().contains('sardines') ||
              _ingredients!.toLowerCase().contains('shellfish') ||
              _ingredients!.toLowerCase().contains('crab') ||
              _ingredients!.toLowerCase().contains('lobster') ||
              _ingredients!.toLowerCase().contains('shrimp') ||
              _ingredients!.toLowerCase().contains('clams') ||
              _ingredients!.toLowerCase().contains('mussels') ||
              _ingredients!.toLowerCase().contains('oysters') ||
              _ingredients!.toLowerCase().contains('scallop')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Shellfish') {
          if (_ingredients!.toLowerCase().contains('shellfish') ||
              _ingredients!.toLowerCase().contains('crab') ||
              _ingredients!.toLowerCase().contains('lobster') ||
              _ingredients!.toLowerCase().contains('shrimp') ||
              _ingredients!.toLowerCase().contains('clams') ||
              _ingredients!.toLowerCase().contains('mussels') ||
              _ingredients!.toLowerCase().contains('oysters') ||
              _ingredients!.toLowerCase().contains('scallop')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        } else if (allergen == 'Soy') {
          if (_ingredients!.toLowerCase().contains('soy') ||
              _ingredients!.toLowerCase().contains('soybean') ||
              _ingredients!.toLowerCase().contains('soy sauce') ||
              _ingredients!.toLowerCase().contains('tofu') ||
              _ingredients!.toLowerCase().contains('miso') ||
              _ingredients!.toLowerCase().contains('tempeh') ||
              _ingredients!.toLowerCase().contains('edamame')) {
            isAllergic = true;
            detectedAllergen = allergen;
            break;
          }
        }
      }
      setState(() {
        _isAllergic = isAllergic;
        if (detectedAllergen != null) {
          String measures = '';
          if (detectedAllergen == 'Wheat') {
            measures = 'Avoid foods that contain wheat or wheat products.\n'
                'Check food labels carefully for hidden sources of wheat, such as bread, pasta, crackers, and cereals.\n'
                'Inform restaurant staff and food servers about the wheat allergy.\n'
                'If you accidentally ingest wheat and experience digestive problems (such as diarrhea, nausea, or vomiting), skin reactions (such as hives, itching, or swelling), difficulty breathing or wheezing, or anaphylaxis, seek immediate medical attention.';
          } else if (detectedAllergen == 'Peanuts') {
            measures = 'Avoid eating peanuts and peanut products\n'
                'Check food labels carefully for hidden sources of peanuts\n'
                'Inform restaurant staff and food servers about the peanut allergy\n'
                'Carry an epinephrine auto-injector at all times and know how to use it.';
          } else if (detectedAllergen == 'Milk') {
            measures =
                'Be sure to read food labels carefully to check for the presence of milk or any milk-based ingredients. Milk can be found in many products, even those that you may not expect, such as bread, crackers, and salad dressings.\n'
                'Be sure to avoid cross-contamination of foods that may contain milk allergens. This means keeping utensils, plates, and cooking surfaces clean and avoiding sharing them with other people who may be using milk or milk-based products.\n'
                'If you are eating out, it is important to inform the restaurant staff and food servers about your milk allergy. This can help them take necessary precautions while preparing and serving your food.\n';
          } else if (detectedAllergen == 'Tree Nuts') {
            measures =
                'Avoid all tree nuts and tree nut products, including nut oils, butters, and extracts.\n'
                'Carefully read food labels and ingredient lists, and avoid foods that contain or may contain tree nuts.\n'
                'Inform restaurant staff and food servers about the tree nut allergy\n'
                'Be cautious when eating foods from bakeries, ice cream parlors, and candy stores, as they often use tree nuts in their products.';
          } else if (detectedAllergen == 'Fish') {
            measures =
                ' Always read food labels to check for fish and fish products as ingredients. Fish can be listed under different names, so its important to be aware of all the different names that fish can go by.\n'
                'Avoid cross-contamination by using separate utensils and cookware when preparing fish-free meals. Also, make sure to thoroughly clean any surfaces that have come in contact with fish.\n'
                'Inform restaurant staff and food servers about the Fish allergy\n'
                'When eating out, inform the server or chef about your fish allergy and ask about the ingredients in the dishes. Be aware that fish may be used as a flavor enhancer in some dishes.';
          } else if (detectedAllergen == 'Eggs') {
            measures =
                'Avoid foods that contain eggs or egg products such as mayonnaise, custard, cake, and cookies.\n'
                'Check food labels carefully for hidden sources of eggs such as in baked goods, pasta, salad dressings, and sauces.\n'
                'Inform restaurant staff and food servers about the egg allergy, and ask for recommendations on safe menu items.\n'
                'Be cautious of cross-contamination in food preparation areas, and ask for separate utensils and cooking equipment to avoid contact with eggs.';
          } else if (detectedAllergen == 'Shellfish') {
            measures =
                'Always read food labels to check for shellfish and shellfish products as ingredients. Shellfish can be listed under different names, so its important to be aware of all the different names that shellfish can go by.\n'
                'When eating out, inform the server or chef about your shellfish allergy and ask about the ingredients in the dishes. Be aware that shellfish may be used as a flavor enhancer in some dishes.\n'
                'Avoid cross-contamination by using separate utensils and cookware when preparing shellfish-free meals. Also, make sure to thoroughly clean any surfaces that have come in contact with shellfish';
          } else if (detectedAllergen == 'Soy') {
            measures =
                'Avoid foods that contain soy protein or soy flour, such as tofu, soy milk, and soy sauce.\n'
                'Read food labels carefully for any soy-containing ingredients.\n'
                'Be cautious when eating out, especially at Asian restaurants, as soy is a common ingredient in many dishes.\n'
                'Inform restaurant staff and food servers about the soy allergy and ask about the ingredients in the dishes before ordering';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(measures),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 15),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ALLERGY DETECTION',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    value: _allergens[0],
                    hint: Text(
                      'Select an allergen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    dropdownColor:
                        Colors.blue, // set the background color to blue
                    style: TextStyle(
                        color: Colors.white), // set the text color to white
                    onChanged: (value) {
                      setState(() {
                        _selectedAllergens.add(value!);
                      });
                    },
                    items: [
                      // Display saved allergy from user profile stats list
                      ...UserProfileStats.stats
                          .where((stat) =>
                              stat['title'] == 'Allergy' &&
                              stat['value'] != null &&
                              stat['value'].toString().isNotEmpty)
                          .map((stat) => DropdownMenuItem<String>(
                                value: stat['value'].toString(),
                                child: Text(
                                  stat['value'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                      // Display other allergens from the _allergens list
                      ..._allergens
                          .where((allergen) =>
                              UserProfileStats.stats
                                  .where((stat) => stat['title'] == 'Allergy')
                                  .toList()
                                  .isEmpty ||
                              !UserProfileStats.stats
                                  .where((stat) => stat['title'] == 'Allergy')
                                  .toList()[0]['value']
                                  .toString()
                                  .contains(allergen))
                          .map((allergen) => DropdownMenuItem<String>(
                                value: allergen,
                                child: Text(
                                  allergen,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _ingredientsController,
                    decoration: InputDecoration(
                      hintText: 'Enter ingredients',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _ingredients = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _checkAllergy(context);
                    },
                    child: Text(
                      'Detect',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),
                if (_isAllergic != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _isAllergic!
                        ? Text(
                            'This food is not safe to consume',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                          )
                        : Text(
                            'This food is safe to consume',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18.0,
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
}





// import 'package:flutter/material.dart';

// class AllergyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Allergies'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//               child: Text(
//                 'Common Allergens',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             Container(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   _buildFoodCard(context, 'Peanuts', 'assets/images/peanuts.jpg'),
//                   _buildFoodCard(context, 'Milk', 'assets/images/milk.jpg'),
//                   _buildFoodCard(context, 'Wheat', 'assets/images/wheats.jpg'),
//                   _buildFoodCard(context, 'Eggs', 'assets/images/eggs.jpg'),
//                   _buildFoodCard(context, 'Fish', 'assets/images/fish.jpg'),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//               child: Text(
//                 'Non-Allergens',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             Container(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   _buildFoodCard(context, 'Carrots', 'assets/images/carrots.jpg'),
//                   _buildFoodCard(context, 'Broccoli', 'assets/images/brocolli.jpg'),
//                   _buildFoodCard(context, 'Apples', 'assets/images/apples.jpg'),
//                   _buildFoodCard(context, 'Blueberries', 'assets/images/blueberries.jpg'),
//                   _buildFoodCard(context, 'Rice', 'assets/images/rice.jpg'),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//               child: Text(
//                 'Symptoms of Allergies',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Text(
//                 'Symptoms of allergies include sneezing, itching, hives, swelling, stomach cramps, and difficulty breathing.',
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//               child: Text(
//                 'Tips on How to Avoid Allergies',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Text(
//                 'Avoiding allergens is the best way to prevent allergic reactions. Read food labels carefully, and ask restaurant staff about ingredients before ordering. Keep an epinephrine auto-injector with you at all times if you have severe allergies.',
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//               child: Text(
//                 'Allergy-Friendly Recipes',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             Container(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   _buildRecipeCard(context, 'Carrot Soup', 'assets/images/carrot_soup.jpg'),
//                   _buildRecipeCard(context, 'Broccoli Salad', 'assets/images/broccolo_salad.jpg'),
//                   _buildRecipeCard(context, 'Apple Crisp', 'assets/images/apple_crisp.jpg'),
//                   _buildRecipeCard(context, 'Blueberry Smoothie', 'assets/images/blueberry_smoothie.jpg'),
//                   _buildRecipeCard(context, 'Rice Bowl', 'assets/images/rice_bowl.jpg'),
//                 ], 
//                ), 
//             ), 
//            ], 
//           ),
//          ),
//        );
//       }
//      Widget _buildFoodCard(BuildContext context, String title, String imagePath) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 150,
//           width: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(title),
//       ],
//     ),
//   );
// }
// Widget _buildRecipeCard(BuildContext context, String title, String imagePath) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 150,
//           width: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(title),
//       ],
//     ),
//   );
// }
// }