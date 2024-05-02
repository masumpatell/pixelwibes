import 'package:flutter/material.dart';
import 'package:pixelwibes/constants/AppFonts.dart';
import 'package:pixelwibes/customs/CustomText.dart';
import '../constants/AppDimens.dart';
import '../constants/appColor.dart';

class CustomTextField extends StatefulWidget {
  final String data;
  final Icon prefixIcon;
  final Color? prefixIconColor;
  final TextEditingController controller;
  final String hintText;
  final bool hideText;
  final TextInputType keyType;

  const CustomTextField({
    super.key,
    required this.data,
    required this.prefixIcon,
    required this.controller,
    required this.hintText,
    this.prefixIconColor,
    required this.hideText,
    required this.keyType
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppDimens.size_20, right: AppDimens.size_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.getText(widget.data,fontSize: AppDimens.size_18,fontWidth: AppFont.bold,color: AppColor.darkBlue),
          Row(
            children: [
              Icon(
                widget.prefixIcon.icon,
                color: widget.prefixIconColor ?? AppColor.darkBlue,
              ),
              const SizedBox(width: AppDimens.size_5),
              Container(
                height: AppDimens.size_25,
                width: AppDimens.size_1,
                color: AppColor.darkBlue,
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  keyboardType: widget.keyType,
                  obscureText: widget.hideText,
                  controller: widget.controller,
                  style: TextStyle(
                    color: AppColor.darkBlue,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: AppColor.darkBlue)),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.darkBlue,
            height: AppDimens.size_1,
          )
        ],
      ),
    );
  }
}