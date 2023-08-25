import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/style.dart';

class AppTextField extends StatefulWidget {
  final String label, hint;
  final String? prefixText, errorText, error;
  final bool obscureText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextInputAction keyboardAction;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function()? onTap;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final Widget? suffixIcon;
  final String? initValue;
  final FormFieldSetter<String>? onSaved;
  final bool paddingLeft;
  final EdgeInsets? contentPadding;
  final int maxLines;
  final int minLines;
  final double height;
  final bool filled;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String?)? onChanged;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;

  AppTextField({
    required this.label,
    required this.hint,
    this.error,
    this.obscureText = false,
    this.textStyle,
    this.decoration,
    this.keyboardAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validators,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onTap,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.initValue,
    this.paddingLeft = false,
    this.contentPadding,
    this.prefixIcon,
    this.onSaved,
    this.prefixText,
    this.maxLines = 1,
    this.minLines = 1,
    this.height = 1,
    this.filled = false,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.errorText,
    this.buildCounter,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.isDense,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initValue,
      onSaved: widget.onSaved,
      cursorColor: AppColor.primaryColor,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      controller: widget.controller,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      expands: false,
      autofocus: false,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      style: widget.textStyle,
      obscureText: widget.obscureText,
      validator: widget.validators != null ? widget.validators : (String? value) {},
      keyboardType: widget.keyboardType,
      textInputAction: widget.keyboardAction,
      textCapitalization: widget.textCapitalization,
      onChanged: widget.onChanged,
      onFieldSubmitted: (_) => submit(context),
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      decoration: widget.decoration ??
          InputDecoration(
            counterStyle: textMedium.copyWith(
                color: AppColor.accentColor.withOpacity(0.50)),
            counterText: "",
            filled: widget.filled,
            prefixText: widget.prefixText,
            isDense: widget.isDense,
            prefix: widget.prefix,
            prefixStyle: textMedium.copyWith(color: Colors.black),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            fillColor: widget.filled ? /*AppColor.santasGray*/Colors.blue : /*AppColor.santasGray*/Colors.blue,
            hintText: widget.hint,
            hintMaxLines: 1,
            suffixIcon: widget.suffixIcon,
            suffix: widget.suffix,
            suffixIconConstraints: widget.suffixIconConstraints,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: textMedium.copyWith(
              color: AppColor.grey,
              fontSize: 15,
            ),
            errorStyle: textMedium.copyWith(color: AppColor.redColor),
            errorMaxLines: 2,
            alignLabelWithHint: true,
            contentPadding:
                widget.contentPadding ?? const EdgeInsets.fromLTRB(12, 18, 12, 18),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: widget.filled
                  ? BorderSide.none
                  : BorderSide(
                      color: /*AppColor.santasGray.withOpacity(0.5)*/Colors.blue,
                      width: 1.0,
                    ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: widget.filled
                  ? BorderSide.none
                  : BorderSide(
                      color: /*AppColor.santasGray.withOpacity(0.5)*/Colors.blue,
                      width: 1.0,
                    ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: widget.filled
                  ? BorderSide.none
                  : const BorderSide(
                      color: AppColor.redColor,
                      width: 1.0,
                    ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: widget.filled
                  ? BorderSide.none
                  : BorderSide(
                      color: AppColor.santasGray.withOpacity(0.5),
                      width: 1.0,
                    ),
            ),
          ),
    );
  }

  void submit(BuildContext context) {
    switch (widget.keyboardAction) {
      case TextInputAction.done:
        FocusScope.of(context).unfocus();
        break;
      case TextInputAction.next:
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
        break;
      default:
        FocusScope.of(context).nextFocus();
        break;
    }
  }
}
