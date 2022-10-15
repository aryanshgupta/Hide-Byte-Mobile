import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback,
    required this.isMain,
    this.roundedTop = true,
    this.roundedBottom = true,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback callback;
  final bool isMain;
  final bool roundedTop;
  final bool roundedBottom;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isMain ? colorEnabled : colorDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: roundedTop ? Radius.circular(roundedCorner) : Radius.circular(0.0),
          topRight: roundedTop ? Radius.circular(roundedCorner) : Radius.circular(0.0),
          bottomLeft: roundedBottom ? Radius.circular(roundedCorner) : Radius.circular(0.0),
          bottomRight: roundedBottom ? Radius.circular(roundedCorner) : Radius.circular(0.0),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isMain ? colorTextDark : colorTextLight,
            size: 28.0,
          ),
          SizedBox(width: defaultSpace),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: isMain ? colorTextDark : colorTextLight,
            ),
          ),
        ],
      ),
      onTap: callback,
    );
  }
}
