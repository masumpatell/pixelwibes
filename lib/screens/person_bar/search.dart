import 'package:flutter/material.dart';
import 'package:pixelwibes/constants/AppDimens.dart';
import 'package:pixelwibes/constants/appColor.dart';

Widget SearchWidget(context,TextEditingController controller){
  return Container(
    margin: const EdgeInsets.only(top: AppDimens.size_20),
    padding: const EdgeInsets.only(left: AppDimens.size_20, right: AppDimens.size_20), // Adjust padding for icon
    height: MediaQuery.of(context).size.height * 0.062,
    width: MediaQuery.of(context).size.width * 0.85,
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.black),
      borderRadius: BorderRadius.circular(AppDimens.size_20),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),

        const Icon(Icons.search), // Add search icon here
      ],
    ),
  );
}
