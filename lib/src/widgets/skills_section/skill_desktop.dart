import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/skill_utils.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Platforms
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth/3,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200.0,
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
        const SizedBox(width: 50.0),
        //   Skills
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth/2,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
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
          ),
        ),
      ],
    );
  }
}
