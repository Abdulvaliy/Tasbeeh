import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbeeh/data/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/data_class.dart';
import '../data/input_style.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mailController.text = "alkhorazmiy.technologies@gmail.com";
    // final dataModelList = Provider.of<DataClass>(context, listen: false);
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
          languages['support']![selectedLanguage],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languages['get_in_touch']![selectedLanguage],
                        style: TextStyle(
                          fontSize: 18,
                          color: kMainColor,
                        ),
                      ),
                      Row(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                languages['phone']![selectedLanguage],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              GestureDetector(
                                onTap: () {
                                  launchUrl(Uri.parse("tel:+998973050307"));
                                },
                                child: Text(
                                  "+998 97 305 03 07",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kMainColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.phone_fill,
                            color: kMainColor,
                            size: 28,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                languages['email']![selectedLanguage],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              GestureDetector(
                                onTap: () {
                                  // launchUrl(Uri.parse("mailto:alkhorazmiy.technologies@gmail.com"));
                                },
                                child: Text(
                                  "alkhorazmiy.technologies@gmail.com",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kMainColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.globe,
                            color: kMainColor,
                            size: 28,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                languages['address']![selectedLanguage],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  languages['address_location']![
                                      selectedLanguage],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.location_fill,
                            color: kMainColor,
                            size: 28,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languages['or_write']![selectedLanguage],
                        style: TextStyle(
                          fontSize: 18,
                          color: kMainColor,
                        ),
                      ),
                      Row(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.person_alt,
                        color: Colors.grey),
                    labelText: languages['name']![selectedLanguage],
                    border: myInputBorder(),
                    // enabledBorder: myInputBorder(),
                    // focusedBorder: myFocusBorder(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextField(
                  controller: mailController,
                  keyboardType: TextInputType.none,
                  showCursor: false,
                  autofocus: false,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.mail_solid,
                        color: Colors.grey),
                    // labelText: "Name",
                    border: myInputBorder(),
                    // enabledBorder: myInputBorder(),
                    // focusedBorder: myFocusBorder(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextField(
                  controller: messageController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.text_bubble_fill,
                        color: Colors.grey),
                    labelText: languages['message']![selectedLanguage],
                    border: myInputBorder(),
                    // enabledBorder: myInputBorder(),
                    // focusedBorder: myFocusBorder(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                    onPressed: () async {
                      String email = mailController.text;
                      String subject = nameController.text;
                      String body = messageController.text;
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        if (kDebugMode) {
                          print("email app opened");
                        }
                      } else {
                        if (kDebugMode) {
                          print("email app is not opened");
                        }
                      }
                      nameController.clear();
                      messageController.clear();
                    },
                    child: Text(
                      languages['send']![selectedLanguage],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
