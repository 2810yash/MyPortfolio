import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../../utils/contact_utils.dart';

class ContactTiels extends StatelessWidget {
  const ContactTiels({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Platforms
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth,
          ),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              for (int i = 0; i < contacts.length; i++)
                InkWell(
                  child: Image.asset(
                    contacts[i].icon,
                    color: Colors.white,
                  ),
                  onTap: () {
                    js.context.callMethod('open', [contacts[i].link]);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
