import 'dart:math';
import 'package:flutter/services.dart';

class CustomInputFormatter extends TextInputFormatter {
  final int? inputLength;

  CustomInputFormatter({this.inputLength});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String left = oldValue.text
        .substring(0, min(oldValue.selection.start, newValue.selection.end));
    String right = oldValue.text.substring(oldValue.selection.end);
    String inserted =
        newValue.text.substring(left.length, newValue.selection.end);
    String modLeft = left.replaceAll(" ", "");
    String modRight = right.replaceAll(" ", "");
    String modInserted = inserted.replaceAll(" ", "");
    if (inputLength != null) {
      modInserted = modInserted.substring(
          0,
          min(inputLength! - modLeft.length - modRight.length,
              modInserted.length));
    }
    final regEx = RegExp(r'\d{1,4}');
    String updated = regEx
        .allMatches((modLeft + modInserted + modRight).toUpperCase())
        .map((e) => e.group(0))
        .join(" ");
    int cursorPosition = regEx
        .allMatches(modLeft + modInserted)
        .map((e) => e.group(0))
        .join(" ")
        .length;
    return TextEditingValue(
      text: updated,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
