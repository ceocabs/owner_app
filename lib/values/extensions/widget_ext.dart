import 'package:flutter/material.dart';

import 'double_ext.dart';

extension WidgetX on Widget {
  Widget wrapContainer({
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color color = Colors.transparent,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      color: color,
      child: this,
    );
  }

  Widget wrapCenter() {
    return Center(
      child: this,
    );
  }

  Widget wrapPadding({EdgeInsets padding = const EdgeInsets.all(0)}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addGestureTap(Function() onTap) {
    return GestureDetector(
      child: this,
      onTap: onTap,
    );
  }

  Widget wrapPaddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget wrapPaddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget wrapPaddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget wrapPaddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget clipRectAll(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: this,
    );
  }

  Widget clipRect(BorderRadius radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  addMarginBottom(double margin) {
    return Column(children: [
      this,
      SizedBox(
        height: margin,
      )
    ]);
  }

  addMarginTop(double margin) {
    return Column(children: [
      SizedBox(
        height: margin,
      ),
    ]);
  }

  addMargin(double margin) {
    return Row(
      children: [
        SizedBox(
          height: margin,
        ),
        Column(children: [
          SizedBox(
            height: margin,
          ),
          this,
          SizedBox(
            height: margin,
          )
        ]),
        SizedBox(
          height: margin,
        ),
      ],
    );
  }

  addMarginRight(double margin) {
    return Padding(
      padding: margin.paddingRight(),
      child: this,
    );
  }

  addMarginLeft(double margin) {
    return Padding(
      padding: margin.paddingLeft(),
      child: this,
    );
  }

  addMarginVertical(double margin) {
    return Padding(
      padding: margin.paddingVertical(),
      child: this,
    );
  }

  addMarginHorizontal(double margin) {
    return Container(
      padding: margin.paddingHorizontal(),
      child: this,
    );
  }

  Widget expand(int flex) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget flexible(int flex, FlexFit flexFit) {
    return Flexible(
      flex: flex,
      fit: flexFit,
      child: this,
    );
  }

  Widget visiblity(bool visible) {
    return Visibility(
      visible: visible,
      child: this,
    );
  }

  Widget offstage(bool visible) {
    return Offstage(
      offstage: visible,
      child: this,
    );
  }

  ///Hides a widget
  Widget setVisibility({Key? key, bool isVisible = false, bool maintainSize = false}) => Visibility(
        key: key,
        child: this,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
      );

  Widget hide({Key? key, bool maintainSize = false}) => Visibility(
        key: key,
        child: this,
        visible: false,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
      );

  Widget show({Key? key, bool maintainSize = false}) => Visibility(
        key: key,
        child: this,
        visible: true,
      );

  /// Widget to show exception
  Widget errorWidget(Object ex) => ErrorWidget(ex);
}
