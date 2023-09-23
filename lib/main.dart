import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbeeh/data/constants.dart';
import 'package:tasbeeh/data/data_class.dart';
import 'package:tasbeeh/screens/counter_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getInt("count") == null) {
    prefs.setInt("count", 0);
  }
  if (prefs.getInt("leap") == null) {
    prefs.setInt("leap", 0);
  }
  if (prefs.getInt("selectedLeap") == null) {
    prefs.setInt("selectedLeap", 33);
  }
  if (prefs.getDouble("volume") == null) {
    prefs.setDouble("volume", 0.7);
  }
  if (prefs.getBool("onLeft") == null) {
    prefs.setBool("onLeft", true);
  }
  if (prefs.getBool("vibration") == null) {
    prefs.setBool("vibration", true);
  }
  if (prefs.getBool("cycleVibration") == null) {
    prefs.setBool("cycleVibration", true);
  }
  if (prefs.getString("language") == null) {
    prefs.setString("language", "en");
  }
  if (prefs.getDouble("circleProgress") == null) {
    prefs.setDouble("circleProgress", 0);
  }
  if (prefs.getBool('darkMode') == null) {
    prefs.setBool('darkMode', false);
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => DataClass(
          countParameter: prefs.getInt("count"),
          leapParameter: prefs.getInt("leap"),
          selectedLeapParameter: prefs.getInt("selectedLeap"),
          volumeParameter: prefs.getDouble("volume"),
          onLeftParameter: prefs.getBool("onLeft"),
          vibrateParameter: prefs.getBool("vibration"),
          cycleVibrateParameter: prefs.getBool('cycleVibration'),
          languageParameter: prefs.getString("language"),
          circleProgressParameter: prefs.getDouble("circleProgress"),
          darkModeParameter: prefs.getBool('darkMode')),
    ),
  ], child: const Tasbeh()));
}

class Tasbeh extends StatelessWidget {
  const Tasbeh({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbeh',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      home: const CounterScreen(),
    );
  }
}
