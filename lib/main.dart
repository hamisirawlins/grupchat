import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupchat/features/auth/screens/screens.onboarding/auth_screen.dart';
import 'firebase_options.dart';
import 'utils/constants/sys_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of y our application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const GetMaterialApp(
      title: 'GrupChat',
      debugShowCheckedModeBanner: false,
      home: LoginAndRegisterView(),
      routes: {},
    );
  }
}
