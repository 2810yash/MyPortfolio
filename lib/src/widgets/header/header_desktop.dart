import 'package:flutter/material.dart';
import 'package:yash_wairagade/src/widgets/header/site_logo/site_logo.dart';
import '../../constants/nav_items.dart';
import '../../style/style.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key, required this.onNavMenuTap}) : super(key: key);

  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      height: 50.0,
      width: double.maxFinite,
      decoration: headerDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: () {}),
          const Spacer(),
          for (int i = 0; i < navTitels.length; i++)
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                i == 4 ? MaterialStateProperty.all(Colors.blue) : null,
              ),
              onPressed: () => onNavMenuTap(i),
              child: Text(
                navTitels[i],
                style: TextStyle(
                    color: i == 4
                        ? Colors.black87
                        : null),
              ),
            ),
        ],
      ),
    );
  }
}
