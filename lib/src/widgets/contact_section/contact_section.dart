import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/size.dart';
import '../text_field/text_feild.dart';
import 'contact_tiels.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.bgLight1,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 30),
      child: Column(
        children: [
          const Text("Get in touch",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          const SizedBox(height: 40.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700,maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return constraints.maxWidth >= minDesktopSize
                    ? buildNameEmailSectionDesktop()
                    : buildNameEmailSectionMobile();
              },
            ),
          ),
          const SizedBox(height: 15.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const textFeild(
              hintText: "Your Message: ",
              maxLines: 10,
            ),
          ),
          const SizedBox(height: 12.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(onPressed: () {}, child: Text("Send")),
            ),
          ),
          const SizedBox(height: 20.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(color: CustomColor.whitePrimary),
          ),
          const SizedBox(height: 15.0),
          const ContactTiels(),
        ],
      ),
    );
  }

  Row buildNameEmailSectionDesktop() {
    return const Row(
      children: [
        Flexible(
          child: textFeild(
            hintText: "Your Name: ",
          ),
        ),
        const SizedBox(width: 15.0),
        Flexible(
          child: textFeild(
            hintText: "Your E-Mail: ",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailSectionMobile() {
    return const Column(
      children: [
        Flexible(
          child: textFeild(
            hintText: "Your Name: ",
          ),
        ),
        SizedBox(height: 15.0),
        Flexible(
          child: textFeild(
            hintText: "Your E-Mail: ",
          ),
        ),
      ],
    );
  }
}
