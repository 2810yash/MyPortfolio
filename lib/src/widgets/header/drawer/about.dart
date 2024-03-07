import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: CustomColor.bgColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 17,
                  top: 18,
                  bottom: 20,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  const DrawerImage(),
                  const Spacer(),
                  Text(
                    'Yash Wairagade',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  const Text(
                    'Student at AISSMS IOIT',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
