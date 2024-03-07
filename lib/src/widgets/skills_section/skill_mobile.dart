import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/skill_utils.dart';

class SkillMobile extends StatelessWidget {
  const SkillMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Platforms
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth,
            ),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: [
                for (int i = 0; i < platformItems.length; i++)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Icon(platformItems[i]["img"]),
                      title: Text(platformItems[i]["title"]),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 50.0),
          //   Skills
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  backgroundColor: CustomColor.bgLight2,
                  avatar: Image.asset(skillItems[i]["img"]),
                  label: Text(skillItems[i]["title"]),
                )
            ],
          ),
        ],
      ),
    );
  }
}
