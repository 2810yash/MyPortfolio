import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../animation/home_img_animation.dart';
import '../../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi,",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    Text(
                      "Yash Wairagade",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Get in touch"),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: MyLottieWidget(),
          ),
        ],
      ),
    );
  }
}
