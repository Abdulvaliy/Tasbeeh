import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasbeeh/data/circle_progress.dart';
import 'package:tasbeeh/data/constants.dart';

import '../data/data_class.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Widget result;
  final Widget reset;

  const Background({
    Key? key,
    required this.child,
    required this.result,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataModelList = Provider.of<DataClass>(context);
    Size size = MediaQuery.of(context).size;

    String leap = dataModelList.leap.toString();
    String selectedLeap = dataModelList.selectedLeap.toString();
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              "images/background-image.svg",
              height: size.height,
              clipBehavior: Clip.hardEdge,
              color: dataModelList.darkMode ? const Color(0xFF404040) : null,
            ),
          ),
          Positioned(
            top: size.height / 2 - 300,
            child: Text(
              '${leap}x$selectedLeap',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w400,
                color: kMainColor,
              ),
            ),
          ),
          Positioned(
            // child: Image.asset("images/circle.png"),
            child: SvgPicture.asset(
              "images/circle.svg",
            ),
          ),
          Positioned(
            // child: Image.asset("images/circle.png"),
            child: CustomPaint(
              foregroundPainter: CircleProgress(dataModelList.circleProgress),
              child: const SizedBox(
                width: 235,
                height: 235,
              ),
            ),
          ),
          // Positioned(
          //   top: size.height / 2 + 160,
          //   left: size.width / 2 + 100,
          //   child: Image.asset(
          //     "images/reset-button.jpg",
          //     color: kMainColor,
          //     width: 50,
          //   ),
          // ),
          Positioned(
            top: size.height / 2 + 160,
            left: dataModelList.onLeft ? size.width / 2 - 150 : size.width / 2 + 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 50),
                reset,
              ],
            ),
          ),
          Positioned(child: result),
          child
        ],
      ),
    );
  }
}
