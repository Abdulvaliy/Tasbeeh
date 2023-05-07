import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbeeh/data/constants.dart';

import '../data/data_class.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int? _leapValue;
  int? customValue = 150;
  late double _volumeValue;
  late bool _vibrationValue;
  late bool _onLeftValue;
  String? _languageValue = "en";
  TextEditingController customController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final dataModelList = Provider.of<DataClass>(context, listen: false);
    _leapValue = dataModelList.selectedLeap;
    _volumeValue = dataModelList.volume * 10;
    _vibrationValue = dataModelList.vibrate;
    _onLeftValue = dataModelList.onLeft;
    _languageValue = dataModelList.language;
    if (_leapValue != 11 && _leapValue != 33 && _leapValue != 99 && _leapValue != 100) {
      customValue = _leapValue;
      customController.text = _leapValue.toString();
    }
    // print(customValue);
    // print(_leapValue);
  }

  @override
  Widget build(BuildContext context) {
    final dataModelList = Provider.of<DataClass>(context);
    String? selectedLanguage = dataModelList.language;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: kMainColor,
              size: 28,
            )),
        title: Text(
          languages['settings']![selectedLanguage],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              if (_leapValue == 150) {
              } else {
                dataModelList.updateSelectedLeap(_leapValue!);
              }
              dataModelList.updateResetSide(_onLeftValue);
              dataModelList.updateVolume(_volumeValue);
              dataModelList.updateVibrate(_vibrationValue);
              dataModelList.updateLanguage(_languageValue);
              Navigator.of(context).pop(true);
            },
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: Text(
              languages['save']![selectedLanguage],
              style: TextStyle(
                color: kMainColor,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          languages['count']![selectedLanguage],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            activeColor: kMainColor,
                            value: 11,
                            groupValue: _leapValue,
                            onChanged: (value) {
                              setState(() {
                                _leapValue = value;
                              });
                            },
                          ),
                          const Text("11"),
                          const SizedBox(width: 15),
                          Radio(
                            activeColor: kMainColor,
                            value: 33,
                            groupValue: _leapValue,
                            onChanged: (value) {
                              setState(() {
                                _leapValue = value;
                              });
                            },
                          ),
                          const Text("33"),
                          const SizedBox(width: 15),
                          Radio(
                            activeColor: kMainColor,
                            value: 99,
                            groupValue: _leapValue,
                            onChanged: (value) {
                              setState(() {
                                _leapValue = value;
                              });
                            },
                          ),
                          const Text("99"),
                          const SizedBox(width: 15),
                          Radio(
                            activeColor: kMainColor,
                            value: 100,
                            groupValue: _leapValue,
                            onChanged: (value) {
                              setState(() {
                                _leapValue = value;
                              });
                            },
                          ),
                          const Text("100"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Radio(
                              activeColor: kMainColor,
                              value: customValue,
                              groupValue: _leapValue,
                              onChanged: (value) {
                                setState(() {
                                  _leapValue = value;
                                });
                              },
                            ),
                            Text(languages['custom']![selectedLanguage]),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 50,
                              child: _leapValue == customValue
                                  ? CupertinoTextField(
                                      onChanged: (value) {
                                        _leapValue = int.tryParse(value);
                                      },
                                      controller: customController,
                                      keyboardType: TextInputType.number,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        border: Border.all(color: kMainColor),
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Stack(
                children: [
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              languages['sound']![selectedLanguage],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.volume_mute, color: kMainColor),
                              Expanded(
                                child: SizedBox(
                                  // width: size.width - 10,
                                  child: CupertinoSlider(
                                    activeColor: kMainColor,
                                    min: 0,
                                    max: 10,
                                    divisions: 10,
                                    value: _volumeValue,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   _volumeValue = value;
                                      // });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                CupertinoIcons.volume_up,
                                color: kMainColor,
                                size: 28,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kMainColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          languages['soon']![selectedLanguage],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.vibration, color: kMainColor),
                        title: Text(
                          languages['vibration']![selectedLanguage],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: kMainColor,
                          value: _vibrationValue,
                          onChanged: (bool value) {
                            setState(() {
                              _vibrationValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        leading: Icon(CupertinoIcons.globe, color: kMainColor),
                        title: Text(
                          languages['language']![selectedLanguage],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Radio(
                        activeColor: kMainColor,
                        value: "en",
                        groupValue: _languageValue,
                        onChanged: (value) {
                          setState(() {
                            _languageValue = value;
                          });
                        },
                      ),
                      title: Text(languages['english']![selectedLanguage]),
                    ),
                    ListTile(
                      leading: Radio(
                        activeColor: kMainColor,
                        value: "uz",
                        groupValue: _languageValue,
                        onChanged: (value) {
                          setState(() {
                            _languageValue = value;
                          });
                        },
                      ),
                      title: Text(languages['uzbek']![selectedLanguage]),
                    ),
                    ListTile(
                      leading: Radio(
                        activeColor: kMainColor,
                        value: "tr",
                        groupValue: _languageValue,
                        onChanged: (value) {
                          setState(() {
                            _languageValue = value;
                          });
                        },
                      ),
                      title: Text(languages['turkish']![selectedLanguage]),
                    ),
                    ListTile(
                      leading: Radio(
                        activeColor: kMainColor,
                        value: "ru",
                        groupValue: _languageValue,
                        onChanged: (value) {
                          setState(() {
                            _languageValue = value;
                          });
                        },
                      ),
                      title: Text(languages['russian']![selectedLanguage]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        languages['locate']![selectedLanguage],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // Expanded(child: Container()),
                    Expanded(
                      flex: 1,
                      child: CupertinoButton(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        color: kMainColor, // CupertinoColors.activeBlue,
                        onPressed: () {
                          setState(() {
                            _onLeftValue = !_onLeftValue;
                          });
                        },
                        child: Text(
                          _onLeftValue ? languages['left']![selectedLanguage] : languages['right']![selectedLanguage],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // CupertinoSlidingSegmentedControl(
              //   children: const {
              //     true: Text("LEFT"),
              //     false: Text("RIGHT"),
              //   },
              //   groupValue: _onLeftValue,
              //   onValueChanged: (value) {
              //     setState(() {
              //       _onLeftValue = value!;
              //     });
              //   },
              // ),
              const SizedBox(height: 50),
              Text(
                "${languages['version']![selectedLanguage]} 1.0.0",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
