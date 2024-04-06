import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/auth_screen.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/success_screen.dart';
import 'package:grupchat/features/auth/screens/widgets/auth_action_button.dart';
import 'package:grupchat/utils/constants/sys_util.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.offAll(() => const LoginAndRegisterView()),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenHeight * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.002,
            ),
            Image(
              image: const AssetImage("assets/images/envelope.png"),
              height: SizeConfig.screenHeight * 0.28,
            ),
            Text("Verify Email",
                style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 46,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: SizeConfig.screenHeight * 0.024,
            ),
            Text(
              "Please check your mail to verify your account",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.024,
            ),
            Text(
              "Congratulations! A world of endless possibilities awaits you and your friends. Pool funds and power through those group plans! 🚀",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            AuthActionButton(
                text: "Continue",
                onTap: () => Get.to(() => const SuccessScreen())),
            SizedBox(
              height: SizeConfig.screenHeight * 0.024,
            ),
            GestureDetector(
              onTap: () {
                // FirebaseAuth.instance.currentUser!.sendEmailVerification();
              },
              child: Text(
                "Resend Email",
                style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
