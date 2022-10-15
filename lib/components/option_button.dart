import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.active,
    required this.callback,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData icon;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: active ? colorEnabled : colorDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(roundedCorner),
      ),
      minLeadingWidth: 0,
      leading: SizedBox(
        height: double.infinity,
        child: Icon(
          icon,
          size: 24,
          color: active ? colorTextDark : colorTextLight,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: active ? colorTextDark : colorTextLight,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: active ? colorTextDark : colorTextLight,
        ),
      ),
      onTap: callback,
    );
  }
}
