import 'package:flutter/material.dart';

extension NumX on double {
  // margin EdgeInsets
  EdgeInsets marginLeft() => EdgeInsets.only(left: this);
  EdgeInsets marginRight() => EdgeInsets.only(right: this);
  EdgeInsets marginTop() => EdgeInsets.only(top: this);
  EdgeInsets marginBottom() => EdgeInsets.only(bottom: this);
  EdgeInsets marginAll() => EdgeInsets.all(this);
  EdgeInsets marginVertical() => EdgeInsets.symmetric(vertical: this);
  EdgeInsets marginHorizontal() => EdgeInsets.symmetric(horizontal: this);

  // margin EdgeInsets
  EdgeInsets paddingLeft() => EdgeInsets.only(left: this);
  EdgeInsets paddingRight() => EdgeInsets.only(right: this);
  EdgeInsets paddingTop() => EdgeInsets.only(top: this);
  EdgeInsets paddingBottom() => EdgeInsets.only(bottom: this);
  EdgeInsets paddingAll() => EdgeInsets.all(this);
  EdgeInsets paddingVertical() => EdgeInsets.symmetric(vertical: this);
  EdgeInsets paddingHorizontal() => EdgeInsets.symmetric(horizontal: this);

  // Border
  BorderRadius circulrBorder() => BorderRadius.circular(this);

  Widget dividerH({color: const Color(0xFFc9c9c9)}) {
    return Container(
      height: this.toDouble(),
      color: color,
      width: double.infinity,
    );
  }

  Widget dividerV({color: Colors.grey}) {
    return Container(
      height: this.toDouble(),
      color: color,
      width: double.infinity,
    );
  }

  Widget divider({
    color: Colors.grey,
    width: double.infinity,
    height: double.infinity,
  }) {
    return Container(
      color: color,
      width: width,
      height: height,
    );
  }

  Widget get VBox {
    return SizedBox(
      height: this.toDouble(),
    );
  }

  Widget get HBox {
    return SizedBox(
      width: this,
    );
  }
}
