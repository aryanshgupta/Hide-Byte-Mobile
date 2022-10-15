import 'package:flutter/material.dart';
import 'package:hide_byte/components/action_button.dart';
import 'package:hide_byte/constant.dart';
import 'package:hide_byte/screens/embed/embed_file.dart';
import 'package:hide_byte/screens/embed/embed_text.dart';

class EmbedOption extends StatefulWidget {
  const EmbedOption({Key? key}) : super(key: key);

  @override
  State<EmbedOption> createState() => _EmbedOptionState();
}

class _EmbedOptionState extends State<EmbedOption> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(defaultSpace + 5),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            "What do you want to embed in?",
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
                  builder: (BuildContext context) => EmbedTextScreen(),
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
                  builder: (BuildContext context) => EmbedFileScreen(),
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
