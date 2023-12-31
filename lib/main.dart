import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:cutfit/bindings/initial_binding.dart';
import 'package:cutfit/config/Themes/mainThemeFile.dart';
import 'package:cutfit/config/initial_main_methods/initial_main_methods.dart';
import 'config/routes.dart';

void main() async {
  await MainMethods.init();
  runApp(
    const WorkoutApp(),
  );
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      defaultTransition: Transition.fade,
      theme: MainTheme(context).themeData,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: "/",
    );
  }
}
