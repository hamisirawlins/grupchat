import 'package:flutter/material.dart';
import 'package:grupchat/utils/constants/sys_util.dart';

class TermsAndConditionsCheck extends StatelessWidget {
  const TermsAndConditionsCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.04),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {}),
          ),
          const Text.rich(
            TextSpan(text: "I agree to the ", children: [
              TextSpan(
                text: "Terms of Service",
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue),
              ),
              TextSpan(text: " and "),
              TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue))
            ]),
          ),
        ],
      ),
    );
  }
}
