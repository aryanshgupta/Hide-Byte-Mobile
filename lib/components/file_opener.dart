import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hide_byte/constant.dart';
import 'package:open_file/open_file.dart';

class FileOpener extends StatelessWidget {
  const FileOpener({
    Key? key,
    required this.title,
    required this.trailingIcon,
    required this.callback,
    required this.active,
    required this.filePath,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;
  final String filePath;
  final IconData trailingIcon;
  final VoidCallback callback;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCorner),
        color: active ? colorEnabled : colorDisabled,
      ),
      child: ListTile(
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedCorner),
        ),
        leading: SizedBox(
          height: double.infinity,
          child: Icon(
            Icons.file_present_rounded,
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
        trailing: IconButton(
          onPressed: callback,
          icon: Icon(
            trailingIcon,
            size: 24,
            color: active ? colorTextDark : colorTextLight,
          ),
        ),
        onTap: () async {
          if (filePath.isNotEmpty) {
            OpenResult openResult = await OpenFile.open(filePath);
            if (openResult.type != ResultType.done) {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                msg: "Could not launch file",
                gravity: ToastGravity.CENTER,
                backgroundColor: colorDark,
                textColor: colorTextLight,
                fontSize: 16.0,
              );
            }
          }
        },
      ),
    );
  }
}
