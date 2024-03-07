import 'package:flutter/material.dart';
import 'package:yash_wairagade/src/widgets/header/drawer/personal_info.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import 'contact_icons.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.bgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomColor.bgLight1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PersonalInfo(),
                    const MySKills(),
                    const Knowledges(),
                    const Divider(),
                    const SizedBox(height: defaultPadding / 2),
                    ContactIcon(
                      onNavMenuTap: onNavMenuTap,
                      onGoToProjects: () {
                        onNavMenuTap(2); // Assuming 2 corresponds to the "Projects" section index
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
