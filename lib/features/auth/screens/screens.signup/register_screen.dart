import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grupchat/data/services/auth_service.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/verify_email.dart';
import 'package:grupchat/features/auth/screens/widgets/terms_and_conditions_check.dart';
import '../../../../utils/constants/sys_util.dart';
import '../widgets/auth_action_button.dart';
import '../widgets/auth_input_field.dart';
import '../../../../common/widgets/show_snackbar.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? toggleScreen;
  RegisterScreen({super.key, this.toggleScreen});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUp() async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.white,
    //         ),
    //       );
    //     });
    Get.to(() => const VerifyEmailScreen());
    // try {
    //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: emailController.text.trim(),
    //       password: passwordController.text.trim());
    // } on FirebaseAuthException catch (e) {
    //   if (mounted) {
    //     showSnackBar(context, e.message!);
    //   }
    // }
    // if (mounted) {
    //   Navigator.pop(context);
    // }
  }

  void googleSignIn() async {
    try {
      await AuthService().signInWithGoogle();
    } catch (e) {
      if (mounted) {
        showSnackBar(context, e.toString());
      }
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Image.asset(
                'assets/images/padlock.png',
                width: SizeConfig.screenWidth * 0.32,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Grup Chat",
                style: GoogleFonts.raleway(
                    color: Colors.black45,
                    fontSize: 46,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Text(
                "Powering plans beyond the group chart",
                style: GoogleFonts.raleway(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              AuthInput(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.024,
              ),
              AuthInput(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.024,
              ),
              const TermsAndConditionsCheck(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              AuthActionButton(text: "Sign Up", onTap: signUp),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.02),
                      child: const Text(
                        "Or Continue With",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Center(
                child: GestureDetector(
                  onTap: googleSignIn,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.screenWidth * 0.036),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(
                      'assets/icons/google.png',
                      width: SizeConfig.screenWidth * 0.12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: widget.toggleScreen,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
