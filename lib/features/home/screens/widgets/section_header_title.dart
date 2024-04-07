import 'package:flutter/material.dart';
import 'package:grupchat/utils/constants/sys_util.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  const SectionHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.064),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
