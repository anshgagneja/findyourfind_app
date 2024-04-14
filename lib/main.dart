import 'package:flutter/material.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'helper/pref.dart';
import 'routes.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Findyourfind.shop',
      theme: AppTheme.lightTheme(context),
      initialRoute: (Pref.getInt(Pref.user_id) != -1) ? InitScreen.routeName : SplashScreen.routeName,
      routes: routes,
    );
  }
}
