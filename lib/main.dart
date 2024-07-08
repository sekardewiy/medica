import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Pastikan file ini diimport

import 'login_page.dart';
import 'home_page.dart';
import 'doctor_recommendation_page.dart';
import 'SpecialistDoctorPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MedicaApp());
}

class MedicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medica',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/doctor_recommendation': (context) => DoctorRecommendationPage(),
        '/specialist_doctors': (context) => SpecialistDoctorsPage(specialist: ''),
      },
    );
  }
}
