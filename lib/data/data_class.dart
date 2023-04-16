import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataClass extends ChangeNotifier {
  DataClass({
    required int? countParameter,
    required int? leapParameter,
    required int? selectedLeapParameter,
    required double? volumeParameter,
    required bool? onLeftParameter,
    required bool? vibrateParameter,
    required String? languageParameter,
    required double? circleProgressParameter,
  }) {
    _count = countParameter!;
    leap = leapParameter!;
    selectedLeap = selectedLeapParameter!;
    volume = volumeParameter!;
    onLeft = onLeftParameter!;
    vibrate = vibrateParameter!;
    language = languageParameter!;
    circleProgress = circleProgressParameter!;
  }

  late int _count;
  late int leap;
  late int selectedLeap;
  late double volume;
  late bool onLeft;
  late bool vibrate;
  late String? language;
  late double circleProgress;

  count() {
    return _count;
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("count", _count);
    prefs.setInt("leap", leap);
    prefs.setDouble("circleProgress", circleProgress);
  }

  Future<void> updateCount() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    _count++;
    leap = _count ~/ selectedLeap;
    if (circleProgress <= 1) {
      if (_count % selectedLeap == 0) {
        circleProgress = 1;
      } else {
        circleProgress = (_count % selectedLeap) / selectedLeap;
      }
    } else {
      circleProgress = 0.0;
    }

    // prefs.setInt("count", _count);
    // prefs.setInt("leap", leap);
    // prefs.setDouble("circleProgress", circleProgress);

    notifyListeners();
  }

  updateSettingChanges() {
    leap = _count ~/ selectedLeap;
    if (circleProgress <= 1) {
      if (_count % selectedLeap == 0) {
        circleProgress = 1;
      } else {
        circleProgress = (_count % selectedLeap) / selectedLeap;
      }
    } else {
      circleProgress = 0.0;
    }

    notifyListeners();
  }

  resetCount() {
    _count = 0;
    leap = 0;
    circleProgress = 0;
    notifyListeners();
  }

  Future<void> updateSelectedLeap(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLeap = value;
    prefs.setInt("selectedLeap", selectedLeap);
    notifyListeners();
  }

  Future<void> updateResetSide(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onLeft = value;
    prefs.setBool("onLeft", onLeft);
    notifyListeners();
  }

  Future<void> updateVolume(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    volume = value / 10;
    prefs.setDouble("volume", volume);
    notifyListeners();
  }

  Future<void> updateVibrate(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    vibrate = value;
    prefs.setBool("vibration", vibrate);
    notifyListeners();
  }

  Future<void> updateLanguage(String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = value;
    prefs.setString("language", language!);
    notifyListeners();
  }
}
