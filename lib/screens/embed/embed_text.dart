import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hide_byte/components/dotted_divider.dart';
import 'package:hide_byte/components/file_opener.dart';
import 'package:hide_byte/components/input_field.dart';
import 'package:hide_byte/components/loader.dart';
import 'package:hide_byte/constant.dart';
import 'package:hide_byte/screens/password_generator.dart';
import 'package:share_plus/share_plus.dart';

class EmbedTextScreen extends StatefulWidget {
  const EmbedTextScreen({Key? key}) : super(key: key);

  @override
  State<EmbedTextScreen> createState() => _EmbedTextScreenState();
}

class _EmbedTextScreenState extends State<EmbedTextScreen> {
  final TextEditingController secretKey = TextEditingController();
  final TextEditingController secretMsg = TextEditingController();

  PlatformFile coverFile = PlatformFile(name: "No file selected", size: 0);
  PlatformFile stegoFile = PlatformFile(name: "No file selected", size: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text("Embed Text"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              secretMsg.text = secretMsg.text.trim();
              secretKey.text = secretKey.text.trim();
            });
          },
          child: ListView(
            padding: EdgeInsets.all(defaultSpace + 5),
            physics: const BouncingScrollPhysics(),
            children: [
              InputField(
                title: "Secret key",
                trailingIconTap: () async {
                  String? generatedPassword = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PasswordGeneratorScreen(),
                    ),
                  );
                  if (generatedPassword != null) secretKey.text = generatedPassword;
                },
                controller: secretKey,
              ),
              SizedBox(height: defaultSpace + 5),
              InputField(
                title: "Secret message",
                controller: secretMsg,
              ),
              SizedBox(height: defaultSpace + 5),
              FileOpener(
                title: coverFile.size == 0 ? "Choose cover file" : coverFile.name,
                description: coverFile.size == 0 ? 'No file selected' : "Tap to preview cover file",
                trailingIcon: coverFile.size == 0 ? Icons.add_rounded : Icons.close_rounded,
                filePath: coverFile.path ?? "",
                callback: () async {
                  if (coverFile.size == 0) {
                    final pickedFiles = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ["jpg", "png", "mp3"],
                    );
                    if (pickedFiles == null) return;
                    setState(() {
                      coverFile = pickedFiles.files.first;
                    });
                  } else {
                    setState(() {
                      coverFile = PlatformFile(name: "No file selected", size: 0);
                    });
                  }
                },
                active: false,
              ),
              stegoFile.size == 0 ? SizedBox() : DottedDivider(),
              stegoFile.size == 0
                  ? SizedBox()
                  : FileOpener(
                      title: stegoFile.name,
                      description: "Tap to preview stego file",
                      trailingIcon: Icons.share_rounded,
                      filePath: stegoFile.path ?? "",
                      callback: () async {
                        if (stegoFile.path != null) {
                          Share.shareFiles(
                            [stegoFile.path!],
                            text: stegoFile.name,
                          );
                        }
                      },
                      active: true,
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Loader(context).build();
          },
          backgroundColor: colorEnabled,
          foregroundColor: colorTextDark,
          tooltip: "Embed",
          child: Icon(Icons.arrow_right_alt_rounded),
        ),
      ),
    );
  }
}
