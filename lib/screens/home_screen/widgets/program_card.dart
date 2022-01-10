import 'package:education_system/config/constants.dart';
import 'package:education_system/extensions/relative_length.dart';
import 'package:education_system/screens/home_screen/widgets/tutor_info.dart';
import 'package:education_system/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgramCard extends StatelessWidget {
  final String? sessionName;
  final int? oldPrice;
  final int? newPrice;
  final String? tutorImg;
  final String? tutorName;
  final double? tutorRate;
  final String? seat;
  final int? numSessions;
  final String? date;
  const ProgramCard({
    Key? key,
    @required this.newPrice,
    @required this.oldPrice,
    @required this.sessionName,
    @required this.tutorImg,
    @required this.tutorName,
    @required this.tutorRate,
    @required this.date,
    @required this.numSessions,
    @required this.seat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 0),
            blurRadius: 14,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 1.97.vh, bottom: 1.97.vh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 4.5.vw, right: 3.4.vw, bottom: 1.5.vh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$sessionName Sessions',
                    style: AppStyles.primaryStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '$oldPrice L.E',
                        style: TextStyle(
                          fontFamily: 'NeoSans',
                          fontSize: 3.2.vw,
                          color: const Color(0xffB2B5C0),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '$newPrice L.E',
                        style: AppStyles.primaryStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, right: 7, bottom: 8),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.2.vw, bottom: 2.3.vh),
              child: Text(
                '( 4 Sessions one Session per week )',
                style: AppStyles.infoStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.2.vw, bottom: 3.6.vh),
              child: TutorInfo(
                name: tutorName!,
                img: tutorImg,
                rate: tutorRate,
              ),
            ),
            Row(
              children: [
                sessionDetails('assets/icons/seat.svg', 'Seats', seat ?? ""),
                sessionDetails('assets/icons/session.svg', 'Sessions',
                    numSessions.toString()),
              ],
            ),
            SizedBox(
              height: 2.5.vh,
            ),
            Row(
              children: [
                sessionDetails('assets/icons/time.svg', 'Start Time :', ''),
                SizedBox(
                  width: 2.9.vw,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(3, 17, 67, 0.08),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Text(
                      date!,
                      style: TextStyle(
                        fontFamily: 'NeoSans',
                        fontSize: 3.7.vw,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff031143).withOpacity(0.78),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 2.2.vh, left: 9, right: 7, bottom: 8),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  btnColor: const Color.fromRGBO(0, 0, 0, 0.2).withOpacity(0.1),
                  btnText: 'Details',
                  onPressed: () {},
                  textColor: ConstantsColors.secondaryColor,
                ),
                SizedBox(
                  width: 3.5.vw,
                ),
                PrimaryButton(
                  btnColor: ConstantsColors.primaryColor,
                  btnText: 'Book Now',
                  onPressed: () {},
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

sessionDetails(String icon, String title, String value) {
  return Padding(
    padding: EdgeInsets.only(left: 5.6.vw),
    child: Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          width: 7,
        ),
        Text(
          '$value $title',
          style: TextStyle(
            fontFamily: 'NeoSans',
            fontSize: 3.2.vw,
            color: const Color(0xff031143),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
