import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hide_byte/components/dotted_divider.dart';
import 'package:hide_byte/components/file_opener.dart';
import 'package:hide_byte/components/input_field.dart';
import 'package:hide_byte/components/loader.dart';
import 'package:hide_byte/constant.dart';
import 'package:share_plus/share_plus.dart';

class ExtractFileScreen extends StatefulWidget {
  const ExtractFileScreen({Key? key}) : super(key: key);

  @override
  State<ExtractFileScreen> createState() => _EmbedFileScreenState();
}

class _EmbedFileScreenState extends State<ExtractFileScreen> {
  final TextEditingController secretKey = TextEditingController();

  PlatformFile secretFile = PlatformFile(name: "No file selected", size: 0);
  PlatformFile stegoFile = PlatformFile(name: "No file selected", size: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text("Extract File"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              secretKey.text = secretKey.text.trim();
            });
          },
          child: ListView(
            padding: EdgeInsets.all(defaultSpace + 5),
            physics: const BouncingScrollPhysics(),
            children: [
              InputField(
                title: "Secret key",
                controller: secretKey,
              ),
              SizedBox(height: defaultSpace + 5),
              FileOpener(
                title: stegoFile.size == 0 ? "Choose stego file" : stegoFile.name,
                description: stegoFile.size == 0 ? 'No file selected' : "Tap to preview stego file",
                trailingIcon: stegoFile.size == 0 ? Icons.add_rounded : Icons.close_rounded,
                filePath: stegoFile.path ?? "",
                callback: () async {
                  if (stegoFile.size == 0) {
                    final pickedFiles = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ["jpg", "png", "mp3"],
                    );
                    if (pickedFiles == null) return;
                    setState(() {
                      stegoFile = pickedFiles.files.first;
                    });
                  } else {
                    setState(() {
                      stegoFile = PlatformFile(name: "No file selected", size: 0);
                    });
                  }
                },
                active: false,
              ),
              secretFile.size == 0 ? SizedBox() : DottedDivider(),
              secretFile.size == 0
                  ? SizedBox()
                  : FileOpener(
                      title: secretFile.name,
                      description: "Tap to preview secret file",
                      trailingIcon: Icons.share_rounded,
                      filePath: secretFile.path ?? "",
                      callback: () async {
                        if (secretFile.path != null) {
                          Share.shareFiles(
                            [secretFile.path!],
                            text: secretFile.name,
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
          tooltip: "Extract",
          child: Icon(Icons.arrow_right_alt_rounded),
        ),
      ),
    );
  }
}
