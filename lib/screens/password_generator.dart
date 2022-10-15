import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hide_byte/components/option_button.dart';
import 'package:hide_byte/constant.dart';
import 'package:hide_byte/utils/generate_password.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  final bool returnGeneratedPassword;
  const PasswordGeneratorScreen({Key? key, this.returnGeneratedPassword = true}) : super(key: key);

  @override
  State<PasswordGeneratorScreen> createState() => _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  TextEditingController generatedPassword = TextEditingController();

  double passwordLength = 8.0;

  bool isWithUpperCase = false;
  bool isWithLowerCase = false;
  bool isWithNumbers = false;
  bool isWithSpecial = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text("Password Generator"),
        ),
        body: ListView(
          padding: EdgeInsets.all(defaultSpace + 5),
          physics: const BouncingScrollPhysics(),
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(roundedCorner)),
                  color: colorPrimary,
                ),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(defaultSpace + 5),
                  child: Text(
                    generatedPassword.text,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: colorTextDark,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: defaultSpace + 5),
            FlutterSlider(
              min: 8.0,
              max: 32.0,
              values: [passwordLength],
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(() {
                  passwordLength = lowerValue;
                  generatedPassword.text = generatePassword(
                    isWithLowercase: isWithLowerCase,
                    isWithUppercase: isWithUpperCase,
                    isWithNumbers: isWithNumbers,
                    isWithSpecial: isWithSpecial,
                    numberCharPassword: int.parse(passwordLength.toStringAsFixed(0)),
                  );
                });
              },
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(roundedCorner),
                  color: colorPrimary,
                ),
                child: Text(
                  passwordLength.toStringAsFixed(0),
                  style: TextStyle(
                    color: colorTextDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              handlerAnimation: FlutterSliderHandlerAnimation(
                scale: 1.0,
              ),
              trackBar: FlutterSliderTrackBar(
                activeTrackBarHeight: 25.0,
                activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(roundedCorner),
                  color: colorEnabled,
                ),
                inactiveTrackBarHeight: 25.0,
                inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(roundedCorner),
                  color: colorDisabled,
                ),
              ),
              tooltip: FlutterSliderTooltip(
                alwaysShowTooltip: false,
                disableAnimation: true,
                disabled: true,
              ),
            ),
            SizedBox(height: defaultSpace + 5),
            Row(
              children: [
                Expanded(
                  child: OptionButton(
                    title: "Uppercase",
                    description: "ABC",
                    callback: () {
                      setState(() {
                        isWithUpperCase = !isWithUpperCase;
                        generatedPassword.text = generatePassword(
                          isWithLowercase: isWithLowerCase,
                          isWithUppercase: isWithUpperCase,
                          isWithNumbers: isWithNumbers,
                          isWithSpecial: isWithSpecial,
                          numberCharPassword: int.parse(passwordLength.toStringAsFixed(0)),
                        );
                      });
                    },
                    icon: Icons.title_rounded,
                    active: isWithUpperCase,
                  ),
                ),
                SizedBox(width: defaultSpace + 5),
                Expanded(
                  child: OptionButton(
                    title: "Lowercase",
                    description: "abc",
                    callback: () {
                      setState(() {
                        isWithLowerCase = !isWithLowerCase;
                        generatedPassword.text = generatePassword(
                          isWithLowercase: isWithLowerCase,
                          isWithUppercase: isWithUpperCase,
                          isWithNumbers: isWithNumbers,
                          isWithSpecial: isWithSpecial,
                          numberCharPassword: int.parse(passwordLength.toStringAsFixed(0)),
                        );
                      });
                    },
                    icon: Icons.format_size_rounded,
                    active: isWithLowerCase,
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultSpace + 5),
            Row(
              children: [
                Expanded(
                  child: OptionButton(
                    title: "Numbers",
                    description: "123",
                    callback: () {
                      setState(() {
                        isWithNumbers = !isWithNumbers;
                        generatedPassword.text = generatePassword(
                          isWithLowercase: isWithLowerCase,
                          isWithUppercase: isWithUpperCase,
                          isWithNumbers: isWithNumbers,
                          isWithSpecial: isWithSpecial,
                          numberCharPassword: int.parse(passwordLength.toStringAsFixed(0)),
                        );
                      });
                    },
                    icon: Icons.looks_one_rounded,
                    active: isWithNumbers,
                  ),
                ),
                SizedBox(width: defaultSpace + 5),
                Expanded(
                  child: OptionButton(
                    title: "Special",
                    description: "@\$*",
                    callback: () {
                      setState(() {
                        isWithSpecial = !isWithSpecial;
                        generatedPassword.text = generatePassword(
                          isWithLowercase: isWithLowerCase,
                          isWithUppercase: isWithUpperCase,
                          isWithNumbers: isWithNumbers,
                          isWithSpecial: isWithSpecial,
                          numberCharPassword: int.parse(passwordLength.toStringAsFixed(0)),
                        );
                      });
                    },
                    icon: Icons.star_rate_rounded,
                    active: isWithSpecial,
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                if (widget.returnGeneratedPassword) {
                  Navigator.of(context).pop(generatedPassword.text);
                } else {
                  Clipboard.setData(ClipboardData(text: generatedPassword.text));
                  Fluttertoast.cancel();
                  Fluttertoast.showToast(
                    msg: "Password copied to clipboard",
                    gravity: ToastGravity.CENTER,
                    backgroundColor: colorDark,
                    textColor: colorTextLight,
                    fontSize: 16.0,
                  );
                }
              },
              backgroundColor: colorDisabled,
              foregroundColor: colorTextLight,
              tooltip: widget.returnGeneratedPassword ? "Select" : "Copy",
              child: Icon(Icons.copy_rounded),
            ),
            SizedBox(width: defaultSpace + 5),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                setState(() {
                  generatedPassword.text = generatePassword(
                    isWithLowercase: isWithLowerCase,
                    isWithUppercase: isWithUpperCase,
                    isWithNumbers: isWithNumbers,
                    isWithSpecial: isWithSpecial,
                    numberCharPassword: int.parse(passwordLength.toStringAsFixed(0)),
                  );
                });
              },
              backgroundColor: colorEnabled,
              foregroundColor: colorTextDark,
              tooltip: "Generate",
              child: Icon(Icons.cached_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
