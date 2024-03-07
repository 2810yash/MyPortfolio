import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../../constants/colors.dart';
import '../../constants/my_handlers.dart';


class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              "\u00a9Yash Wairagade",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: CustomColor.whiteSecondary,
              ),
            ),
            TextButton(
              onPressed: () => js.context.callMethod('post', [MyUsername.myGmail]),
              child: const Text(
                MyUsername.myGmail,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: CustomColor.whiteSecondary,
                ),
              ),
            ),
          ],
        ));
  }
}
