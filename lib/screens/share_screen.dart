import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbeeh/data/constants.dart';

import '../data/data_class.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  void initState() {
    super.initState();
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
          ),
        ),
        title: Text(
          languages['share']![selectedLanguage],
          style: TextStyle(
            color: kMainColor,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              languages['scan_description']![selectedLanguage],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset("images/qr_link.png"),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset("images/refer.png"),
            ),
          ],
        ),
      ),
    );
  }
}
