import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixelwibes/screens/Splash%20screen/Splash%20screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

class ObserverUtils {
  static final RouteObserver<ModalRoute> routeObserver =
  RouteObserver<ModalRoute>();
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ObserverUtils.routeObserver],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
