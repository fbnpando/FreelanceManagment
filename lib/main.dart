import 'package:flutter/material.dart';
import 'package:gestion_freelance/screens/control/add_date.dart';
import 'package:gestion_freelance/screens/splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Add_data>('data'); // Abre la caja antes de ejecutar la app
  await Firebase.initializeApp(); // Inicializa Firebase aquí
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
