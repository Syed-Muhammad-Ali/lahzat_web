// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';

import '../../constants/colors.dart';

class AppTextfield extends StatefulWidget {
  Widget? prefixIcon;
  Widget? suffixIcon;
  Widget? errorWidget;
  Function()? onTap;
  Function(String)? onchanged;
  String? Function(String?)? validator;
  String? hint;
  Widget? subWidget;
  String? labelText;
  Color? filledColor;
  Color? borderColor;
  final TextEditingController ctr;
  TextInputType? textInputType;
  double? height;
  int? maxLength;
  double? width;
  double bottomSpace;
  double? radius;
  bool? readOnly;
  bool isPasswordField;
  bool isUnderlined;
  FocusNode? focusNode;
  bool hideKeyboard;
  int? maximumLines;
  int? minimumLines;
  String? title;
  Color? titleColor;
  double? titleSize;
  TextCapitalization? textCapitalization;
  bool? useCountFormater;
  bool showStar; 

  AppTextfield({
    super.key,
    this.prefixIcon,
    this.readOnly,
    this.errorWidget,
    this.validator,
    this.hint = '',
    this.subWidget,
    this.bottomSpace = 12,
    this.suffixIcon,
    required this.ctr,
    this.height,
    this.onTap,
    this.borderColor,
    this.isPasswordField = false,
    this.onchanged,
    this.textInputType,
    this.maxLength,
    this.radius,
    this.filledColor,
    this.maximumLines,
    this.minimumLines,
    this.width,
    this.focusNode,
    this.labelText,
    this.isUnderlined = false,
    this.hideKeyboard = true,
    this.textCapitalization,
    this.useCountFormater,
    this.title,
    this.titleColor,
    this.titleSize,
    this.showStar = false, // 🔹 default false
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  bool isObscure = true;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null && widget.title!.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  widget.title ?? '',
                  fontSize: widget.titleSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: widget.titleColor ?? const Color(0xff999999),
                ),
                if (widget.showStar) ...[
                  const SizedBox(width: 2),
                  const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          SizedBox(height: widget.title != null ? 4 : 0),

          // 🔹 TextField
          SizedBox(
            height: widget.height,
            child: TextFormField(
              onTapOutside: (event) {
                if (widget.hideKeyboard) {
                  _focusNode.unfocus();
                }
              },
              inputFormatters: (widget.useCountFormater ?? false)
                  ? [FilteringTextInputFormatter.allow(RegExp(r'[\d.]'))]
                  : null,
              focusNode: widget.focusNode ?? _focusNode,
              onChanged: widget.onchanged ?? (value) {},
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.sentences,
              onTap: widget.onTap,
              maxLines: widget.maximumLines ?? 1,
              minLines: widget.minimumLines ?? 1,
              readOnly: widget.readOnly ?? false,
              controller: widget.ctr,
              maxLength: widget.maxLength,
              keyboardType: widget.textInputType,
              obscureText: widget.isPasswordField ? isObscure : false,
              obscuringCharacter: '*',
              validator: widget.validator,
              style: const TextStyle(
                color: Color(0xff999999),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                contentPadding: EdgeInsets.fromLTRB(
                  widget.isUnderlined ? 0 : 10,
                  14,
                  12,
                  4,
                ),
                counterText: '',
                filled: !widget.isUnderlined,
                fillColor: widget.isUnderlined
                    ? null
                    : (widget.filledColor ?? Colors.white.withOpacity(.3)),
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: const BoxConstraints(
                  maxWidth: 50,
                  minWidth: 40,
                  minHeight: 40,
                ),
                suffixIconConstraints: const BoxConstraints(
                  maxWidth: 50,
                  minWidth: 40,
                  minHeight: 40,
                ),
                suffixIcon: widget.isPasswordField
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20,
                          color: const Color(0xff999999),
                        ),
                      )
                    : widget.suffixIcon,
                errorStyle: const TextStyle(fontSize: 14, color: Colors.red),
                hintText: widget.hint,
                hintStyle: const TextStyle(
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                focusedBorder: border(
                  widget.borderColor ?? AppColor.primaryColor,
                ),
                errorBorder: border(
                  widget.borderColor ?? const Color(0xff999999),
                ),
                enabledBorder: border(
                  widget.borderColor ?? const Color(0xff999999),
                ),
                border: border(widget.borderColor ?? const Color(0xff999999)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder border(Color color) {
    return widget.isUnderlined
        ? const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff999999), width: 1.0),
          )
        : OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          );
  }
}
