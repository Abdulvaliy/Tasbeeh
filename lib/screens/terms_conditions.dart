import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbeeh/data/constants.dart';
import 'package:tasbeeh/data/english_terms.dart';
import 'package:tasbeeh/data/russian_terms.dart';
import 'package:tasbeeh/data/turkish_terms.dart';
import 'package:tasbeeh/data/uzbek_terms.dart';

import '../data/data_class.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataModelList = Provider.of<DataClass>(context);
    String? selectedLanguage = dataModelList.language;

    List<Widget> termsToDisplay() {
      if (selectedLanguage == 'uz') {
        return const [
          UzbekTerms(),
          EnglishTerms(),
        ];
      } else if (selectedLanguage == 'ru') {
        return const [
          RussianTerms(),
          EnglishTerms(),
        ];
      } else if (selectedLanguage == 'tr') {
        return const [
          TurkishTerms(),
          EnglishTerms(),
        ];
      } else {
        return const [
          EnglishTerms(),
        ];
      }
    }

    List<Widget> tabsToDisplay() {
      if (selectedLanguage == 'en') {
        return [
          Tab(
            text: languages['terms_conditions']![selectedLanguage],
          ),
        ];
      } else {
        return [
          Tab(
            text: languages['terms_conditions']![selectedLanguage],
          ),
          Tab(
            text:
                "\t\t\t\t\t\t\t\t\t(${languages['english']![selectedLanguage]}) \n${languages['terms_conditions']!['en']}",
          ),
        ];
      }
    }

    return DefaultTabController(
      length: selectedLanguage == 'en' ? 1 : 2,
      child: Scaffold(
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
            languages['information']![selectedLanguage],
            style: TextStyle(
              color: kMainColor,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: kMainColor,
            // overlayColor: MaterialStatePropertyAll(Colors.green),
            labelColor: kMainColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: tabsToDisplay(),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: termsToDisplay(),
          ),
        ),
      ),
    );
  }
}
