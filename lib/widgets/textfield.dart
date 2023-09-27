// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_news_brief/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    Key? key,
    this.label,
    this.hintText,
    this.icon,
    this.suffIcon,
    this.controller,
    this.limit = 20,
    this.fontsize,
    this.obscure = false,
    this.readOnly = false,
    this.type,
    this.focus = false,
    this.onChanged,
    this.preffixIconFunc,
    this.focusNode,
    this.fillColor = Colorss.foreBackgroundColor,
    this.borderColor = Colors.transparent,
    this.labelColor = Colorss.textColor,
    this.radius = 1,
    this.maxLines = 1,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final Widget? icon;
  final Widget? suffIcon;

  final TextEditingController? controller;
  final int limit;
  final double? fontsize;
  final bool obscure;
  final bool readOnly;

  final TextInputType? type;
  final bool focus;
  final Function(String)? onChanged;
  final void Function()? preffixIconFunc;
  final FocusNode? focusNode;
  final Color fillColor;
  final Color borderColor;
  final Color labelColor;
  final double radius;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextField(
        maxLines: maxLines,
        minLines: maxLines,
        readOnly: readOnly,
        focusNode: focusNode,
        autofocus: focus,
        keyboardType: type,
        obscureText: obscure,
        style: Styles.smallTextStyle.copyWith(color: labelColor, fontWeight: FontWeight.w500),
        inputFormatters: [
          LengthLimitingTextInputFormatter(limit),
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.h),
          suffixIcon: suffIcon,
          hintText: hintText,
          hintStyle: Styles.mediumTextStyle.copyWith(color: labelColor, fontWeight: FontWeight.w500),
          prefixIcon: icon == null
              ? null
              : IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  icon: icon ?? const SizedBox(),
                  onPressed: preffixIconFunc,
                  color: Colorss.textColor),
          labelText: label,
          labelStyle: Styles.smallTextStyle
              .copyWith(color: labelColor, fontWeight: FontWeight.w500, fontSize: fontsize ?? 15.sp),
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: borderColor.withOpacity(0.3)),
          ),
        ),
        cursorColor: Colorss.textColor,
        onChanged: onChanged,
        controller: controller,
      ),
    );
  }
}
