import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultSpace + 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorTextLight,
            ),
          ),
          SizedBox(width: defaultSpace / 2),
          Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorTextLight,
            ),
          ),
          SizedBox(width: defaultSpace / 2),
          Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
