import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbeeh/data/constants.dart';
import 'package:tasbeeh/data/data_class.dart';
import 'package:tasbeeh/screens/background.dart';
import 'package:tasbeeh/screens/settings.dart';
import 'package:tasbeeh/screens/support.dart';
import 'package:tasbeeh/screens/terms_conditions.dart';
import 'package:vibration/vibration.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;
  bool? hasVibrate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInCirc);
    _controller.addListener(() {
      setState(() {});
    });
    checkVibrate();
  }

  void checkVibrate() async {
    hasVibrate = await Vibration.hasVibrator();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void resetPressed() {
    setState(() {
      _controller.value = 0.1;
    });
    setState(() {
      _controller.forward(from: animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataModelList = Provider.of<DataClass>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Background(
          reset: GestureDetector(
            onTap: () {
              dataModelList.resetCount();
              resetPressed();
            },
            child: Container(
              width: _controller.value * 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.redAccent.withOpacity(0.75),
              ),
              child: Image.asset(
                "images/reset-button.jpg",
                color: kMainColor,
              ),
            ),
          ),
          result: GestureDetector(
            onTapDown: (value) {
              dataModelList.updateCount();
              final player = AudioPlayer();
              if (dataModelList.count() % dataModelList.selectedLeap == 0 &&
                  dataModelList.count() != 0) {
                player.play(
                  AssetSource("stone.mp3"),
                  volume: dataModelList.volume,
                );
                if (dataModelList.vibrate && hasVibrate!) {
                  Vibration.vibrate(
                    duration: 350,
                    amplitude: 1,
                  );
                }
              } else {
                player.play(
                  AssetSource("glass.mp3"),
                  volume: dataModelList.volume,
                );
                if (dataModelList.vibrate && hasVibrate!) {
                  Vibration.vibrate(
                    duration: 80,
                    amplitude: 1,
                  );
                }
              }
              // print(dataModelList.leap);
              // if (dataModelList.vibrate && hasVibrate!) {
              //   Vibration.vibrate(
              //     duration: 80,
              //     amplitude: 1,
              //   );
              // }
            },
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${dataModelList.count()}',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w400,
                    color: kMainColor,
                  ),
                ),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const TermsScreen()));
                      // launchUrl(
                      //   Uri.parse("https://policies.google.com/terms?hl=en-US"),
                      // mode: LaunchMode.externalApplication,
                      // );
                    },
                    child: Icon(Icons.info, color: kMainColor),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                            builder: (context) => const SupportScreen()),
                      );
                    },
                    child: Icon(Icons.support_agent, color: kMainColor),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        CupertinoPageRoute(
                            builder: (context) => const SettingScreen()),
                      )
                          .then((value) {
                        if (value == true) {
                          dataModelList.updateSettingChanges();
                        }
                      });
                    },
                    child: Icon(Icons.settings, color: kMainColor),
                  ),
                  const SizedBox(width: 18),
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
