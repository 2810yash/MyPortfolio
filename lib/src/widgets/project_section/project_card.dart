import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors.dart';
import '../../utils/project_utils.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.setWidth});

  final double setWidth;

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
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: setWidth,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < projects.length; i++)
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: CustomColor.bgLight2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          projects[i].image,
                          height: 140.0,
                          width: 250.0,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projects[i].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.0,
                                ),
                              ),
                              Text(
                                projects[i].subTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: CustomColor.whitePrimary,
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //   Footer
                        Container(
                          color: CustomColor.bgLight1,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            children: [
                              if ((projects[i].androidLink != null) ||
                                  (projects[i].iosLink != null) ||
                                  (projects[i].webLink != null))
                                const Text(
                                  "Available on: ",
                                  style: TextStyle(
                                      color: CustomColor.whiteSecondary),
                                ),
                              const Spacer(),
                              if (projects[i].androidLink != null)
                                Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: InkWell(
                                      child: const Icon(Icons.android),
                                      onTap: (){launchUrl(Uri.parse(projects[i].androidLink!));},
                                    )),
                              if (projects[i].iosLink != null)
                                Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: InkWell(
                                      child: const Icon(Icons.apple),
                                        onTap: (){launchUrl(Uri.parse(projects[i].iosLink!));},
                                    )),
                              if (projects[i].webLink != null)
                                Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: InkWell(
                                      child: const Icon(Icons.web),
                                        onTap: (){launchUrl(Uri.parse(projects[i].webLink!));},
                                    )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
