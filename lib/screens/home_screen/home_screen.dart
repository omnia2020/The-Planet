import 'dart:async';
import 'package:education_system/config/constants.dart';
import 'package:education_system/extensions/relative_length.dart';
import 'package:education_system/screens/home_screen/widgets/program_card.dart';
import 'package:education_system/widgets/congrat_bar.dart';
import 'package:education_system/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _visible = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _hideBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.2.vh,
            ),
            Visibility(
              visible: _visible,
              child: const CongratBar(),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 1.97.vh, left: 4.3.vw, right: 4.3.vw),
              child: const SearchBar(),
            ),
            SizedBox(
              height: 3.7.vh,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.7.vw),
              child: Text(
                'Our Programs',
                style: AppStyles.titleStyle,
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 4.0.vw,
                    right: 4.5.vw,
                    bottom: 1.9.vh,
                  ),
                  child: const ProgramCard(
                    newPrice: 100,
                    oldPrice: 150,
                    sessionName: 'Tajweed',
                    tutorImg: 'assets/images/conan.jpg',
                    tutorName: 'Mr.Ahmed Ali',
                    tutorRate: 3.5,
                    date: '09 Aug at 10:00 AM',
                    numSessions: 4,
                    seat: '3/4',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _hideBar() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _visible = false;
      });
    });
  }
}
