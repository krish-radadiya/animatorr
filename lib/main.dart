import 'package:animatorr/modules/screens/introscreen/views/intro_screen.dart';
import 'package:animatorr/modules/screens/spleshscreen/views/spleshscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'modules/screens/views/homepage/home.dart';
import 'modules/screens/views/splash_screen/splash_screen.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'splesh': (context) => const Splesh_screen(),
//         'introo': (context) => const intro(),
//         '/': (context) => const home(),
//       },
//     ),
//   );
// }
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: '/splesh', page: () => SplashScreen()),
      GetPage(name: '/intro', page: () => intro()),
      GetPage(name: '/', page: () => home()),
    ],
  ));
}
