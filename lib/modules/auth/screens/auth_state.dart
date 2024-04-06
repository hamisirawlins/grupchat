import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/auth_screen.dart';
import 'package:grupchat/features/home/home_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../utils/constants/sys_util.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.black38, size: SizeConfig.screenHeight * 0.01),
            );
          }
          if (snapshot.hasData) {
            return const HomeView();
          }
          return const LoginAndRegisterView();
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}
