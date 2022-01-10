import 'package:education_system/config/constants.dart';
import 'package:education_system/extensions/relative_length.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 5.9.vh,
            child: TextFormField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                prefixIconColor: const Color(0xff7A7A7A),
                fillColor: ConstantsColors.greyColor.withOpacity(0.6),
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: 'NeoSans',
                  fontSize: 3.7.vw,
                  color: const Color(0xffB2B5C0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        Expanded(
          flex: -1,
          child: Container(
            height: 5.9.vh,
            margin: EdgeInsets.only(left: 2.17.vw),
            decoration: BoxDecoration(
              color: const Color(0xffFEF4E4).withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: IconButton(
              splashRadius: 8,
              color: Colors.white,
              icon: SvgPicture.asset('assets/icons/filter.svg'),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
