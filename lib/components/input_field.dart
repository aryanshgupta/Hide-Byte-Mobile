import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.controller,
    this.trailingIconTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? trailingIconTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(roundedCorner),
          ),
          borderSide: BorderSide(color: colorDisabled, width: 2.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(roundedCorner),
          ),
          borderSide: BorderSide(color: colorEnabled, width: 2.5),
        ),
        label: Text(title),
        suffixIcon: trailingIconTap == null
            ? null
            : IconButton(
                icon: Icon(Icons.cached),
                onPressed: trailingIconTap,
              ),
      ),
      controller: controller,
      cursorColor: colorEnabled,
    );
  }
}
