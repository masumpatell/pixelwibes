import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelwibes/constants/AppDimens.dart';
import 'package:pixelwibes/constants/AppFonts.dart';
import 'package:pixelwibes/constants/appColor.dart';
import 'package:pixelwibes/customs/CustomText.dart';

import '../auth_screen/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.lightBlue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                  color: AppColor.darkBlue,
                  borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(AppDimens.size_450))),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height*0.20,
                right: MediaQuery.of(context).size.width*-0.5,
                child: SvgPicture.asset(
                  "assets/images/aa.svg",
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width*0.9,
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.06,
                left: MediaQuery.of(context).size.width * 0.16,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  margin: const EdgeInsets.only(left: AppDimens.size_20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.getText("PixelWibes",fontSize: AppDimens.size_40,fontWidth: AppFont.bold,color: AppColor.lightBlue),
                      Utils.getText("We make digital Solutions for you",color: AppColor.lightBlue,fontWidth: AppFont.bold,fontSize: AppDimens.size_15),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
