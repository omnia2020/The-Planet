import 'package:education_system/config/constants.dart';
import 'package:education_system/extensions/relative_length.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TutorInfo extends StatelessWidget {
  final String? img;
  final String? name;
  final double? rate;
  const TutorInfo({
    Key? key,
    required this.img,
    required this.name,
    required this.rate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(img!),
        ),
        SizedBox(
          width: 2.4.vw,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name ?? "",
              style: AppStyles.secondaryStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                RatingBarIndicator(
                  rating: rate ?? 2.5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: ConstantsColors.starColor,
                  ),
                  itemCount: 5,
                  itemSize: 15,
                  direction: Axis.horizontal,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$rate',
                  style: TextStyle(
                    fontSize: 3.2.vw,
                    color: const Color(0xff808080),
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
