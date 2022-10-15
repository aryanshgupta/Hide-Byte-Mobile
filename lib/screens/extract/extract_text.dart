import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hide_byte/components/dotted_divider.dart';
import 'package:hide_byte/components/file_opener.dart';
import 'package:hide_byte/components/input_field.dart';
import 'package:hide_byte/components/loader.dart';
import 'package:hide_byte/constant.dart';
import 'package:share_plus/share_plus.dart';

class ExtractTextScreen extends StatefulWidget {
  const ExtractTextScreen({Key? key}) : super(key: key);

  @override
  State<ExtractTextScreen> createState() => _EmbedTextScreenState();
}

class _EmbedTextScreenState extends State<ExtractTextScreen> {
  final TextEditingController secretMsg = TextEditingController();
  final TextEditingController secretKey = TextEditingController();

  PlatformFile stegoFile = PlatformFile(name: "No file selected", size: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text("Extract Text"),
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
              secretKey.text.isEmpty ? SizedBox() : DottedDivider(),
              secretKey.text.isEmpty
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(roundedCorner),
                        color: colorDisabled,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: defaultSpace + 5,
                              right: defaultSpace + 5,
                              top: defaultSpace + 5,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Secret message",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: colorPrimary,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(text: secretKey.text));
                                    Fluttertoast.cancel();
                                    Fluttertoast.showToast(
                                      msg: "Secret message copied to clipboard",
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: colorDark,
                                      textColor: colorTextLight,
                                      fontSize: 16.0,
                                    );
                                  },
                                  icon: Icon(Icons.copy_rounded),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Share.share(secretKey.text);
                                  },
                                  icon: Icon(Icons.share_rounded),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: defaultSpace + 5,
                            color: colorTextLight,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: defaultSpace + 5,
                              right: defaultSpace + 5,
                              bottom: defaultSpace + 5,
                            ),
                            child: TextField(
                              controller: secretKey,
                              maxLines: null,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: colorTextLight,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                              ),
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
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
