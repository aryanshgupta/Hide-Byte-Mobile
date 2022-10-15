import 'package:flutter/material.dart';
import 'package:hide_byte/components/action_button.dart';
import 'package:hide_byte/constant.dart';
import 'package:hide_byte/screens/extract/extract_file.dart';
import 'package:hide_byte/screens/extract/extract_text.dart';

class ExtractOption extends StatefulWidget {
  const ExtractOption({Key? key}) : super(key: key);

  @override
  State<ExtractOption> createState() => _EmbedOptionState();
}

class _EmbedOptionState extends State<ExtractOption> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(defaultSpace + 5),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            "What do you want to extract in?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorTextLight,
              fontSize: 40.0,
            ),
          ),
          SizedBox(height: defaultSpace * 2),
          ActionButton(
            text: "Text",
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ExtractTextScreen(),
                ),
              );
            },
            icon: Icons.article_rounded,
            isMain: true,
          ),
          SizedBox(height: defaultSpace),
          Text(
            "or",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorTextLight,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: defaultSpace),
          ActionButton(
            text: "File",
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ExtractFileScreen(),
                ),
              );
            },
            icon: Icons.attach_file_rounded,
            isMain: true,
          ),
        ],
      ),
    );
  }
}
