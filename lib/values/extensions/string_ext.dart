import 'package:flutter/material.dart';

extension StringX on String {
  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() =>
      length > 1 ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}" : this;

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull => this.isEmpty;

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this;

  // if the string is empty perform an action
  String ifEmpty(Function action) => this.isEmpty ? action() : this;

  bool validateEmail() =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  String? toPascalCase() {
    if (this != null) {
      if (this.length > 0) {
        return this.substring(0, 1).toUpperCase() + this.substring(1);
      } else {
        return this;
      }
    } else {
      return null;
    }
  }

  Text withStyle({TextStyle? style, int maxline = 1, TextOverflow overflow = TextOverflow.clip}) {
    return Text(
      this,
      style: style,
      maxLines: maxline,
      overflow: overflow,
    );
  }

  withNormalFont(BuildContext context, {Color color = Colors.black, int? maxline}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.headline6!.copyWith(color: color),
    );
  }

  text(
    BuildContext context, {
    Color color = Colors.black,
    int? maxline,
    TextStyle? textStyle,
  }) {
    return Text(
      this,
      style: textStyle ?? Theme.of(context).textTheme.headline6!.copyWith(color: color),
    );
  }

  subText(BuildContext context, {Color color = Colors.black54, int? maxline}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: color),
    );
  }

  withSmallFont(BuildContext context, {Color color = Colors.black54, int? maxline}) {
    return Text(
      this,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: color),
    );
  }

  String toUTFValue(int hex) {
    List<int> chars = List.generate(this.length, (index) => 0);
    for (int i = 0; i < this.length; i++) {
      if (this.codeUnitAt(i) >= 0x0030 && this.codeUnitAt(i) <= 0x0039) {
        chars[i] = hex + (this.codeUnitAt(i) - '0'.codeUnitAt(0));
      } else {
        chars[i] = this.codeUnitAt(i);
      }
    }
    return String.fromCharCodes(chars);
  }
}
