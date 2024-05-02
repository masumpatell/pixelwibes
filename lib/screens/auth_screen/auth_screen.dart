import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelwibes/constants/AppDimens.dart';
import 'package:pixelwibes/constants/AppFonts.dart';
import 'package:pixelwibes/constants/appColor.dart';
import 'package:pixelwibes/customs/CustomButton.dart';
import 'package:pixelwibes/customs/CustomText.dart';
import 'package:pixelwibes/customs/CustomeTextField.dart';
import '../bottom_bar/bottom_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();

  late String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.getText("Login",
                fontSize: AppDimens.size_50,
                color: AppColor.darkBlue,
                fontWidth: AppFont.bold),
            const SizedBox(
              height: AppDimens.size_30,
            ),
            CustomTextField(
                data: "Name",
                prefixIcon: const Icon(Icons.person),
                controller: name,
                hintText: "Enter Name",
                hideText: false,
                keyType: TextInputType.name),
            const SizedBox(
              height: AppDimens.size_30,
            ),
            CustomTextField(
                data: "Phone Number",
                prefixIcon: const Icon(Icons.phone_android),
                controller: phoneNumber,
                hintText: "Phone Number",
                hideText: false,
                keyType: TextInputType.number),
            const SizedBox(
              height: AppDimens.size_30,
            ),
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumber.text.toString(),
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      setState(() {
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) {},
                  );
                },
                child: CustomBtn(
                    context,
                    0.060,
                    0.25,
                    AppColor.darkBlue,
                    AppDimens.size_20,
                    "Verify",
                    AppColor.white,
                    AppFont.bold,
                    AppDimens.size_18)),
            const SizedBox(
              height: AppDimens.size_10,
            ),
            CustomTextField(
                data: "OTP",
                prefixIcon: const Icon(Icons.security),
                controller: otpController,
                hintText: "Enter OTP",
                hideText: true,
                keyType: TextInputType.number),
            const SizedBox(
              height: AppDimens.size_50,
            ),
            InkWell(
                onTap: () async {
                  try {
                    // PhoneAuthCredential credential =
                    //     await PhoneAuthProvider.credential(
                    //         verificationId: verificationId,
                    //         smsCode: otpController.text.toString());
                    // FirebaseAuth.instance.signInWithCredential(credential).then((value){
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const CustomBottomBar()));
                    // });

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomBottomBar()));
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: CustomBtn(
                    context,
                    0.065,
                    0.8,
                    AppColor.darkBlue,
                    AppDimens.size_20,
                    "Login",
                    AppColor.white,
                    AppFont.bold,
                    AppDimens.size_20))
          ],
        ));
  }
}
