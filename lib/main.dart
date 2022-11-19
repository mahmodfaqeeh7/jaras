import 'package:flutter/material.dart';
import 'package:footballquiz/sharedpref.dart';
import 'screens/Gamescreen.dart';
import 'screens/modeselection.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: modeselect(),
    );
  }
}