import 'package:flutter/material.dart';
import 'package:hide_byte/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader {
  final BuildContext context;
  Loader(this.context);

  Future<dynamic> build() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 100.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: colorEnabled,
                  size: 100.0,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "55",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: colorTextLight,
                    ),
                    children: [
                      TextSpan(
                        text: "%",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: colorTextLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
