import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grupchat/common/widgets/general/show_snackbar.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/auth_screen.dart';
import 'package:grupchat/features/auth/screens/widgets/auth_action_button.dart';
import 'package:grupchat/features/auth/screens/widgets/auth_input_field.dart';
import 'package:grupchat/utils/constants/sys_util.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final passwordController = TextEditingController();

  void sendResetLink() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: passwordController.text.trim());
      if (mounted) {
        showSnackBar(
            context, "Password reset link successfully sent to your email");
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        showSnackBar(context, e.message!);
      }
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }

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
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Image(
              image: const AssetImage("assets/images/idea.png"),
              height: SizeConfig.screenHeight * 0.22,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.032,
            ),
            Text("Password Reset",
                style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: SizeConfig.screenHeight * 0.032,
            ),
            AuthInput(
              controller: passwordController,
              hintText: 'Email Address',
              obscureText: false,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.032,
            ),
            AuthActionButton(text: "Send Reset Link", onTap: sendResetLink),
          ],
        ),
      ),
    );
  }
}
