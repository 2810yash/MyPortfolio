import 'package:flutter/material.dart';
import 'package:yash_wairagade/src/widgets/header/site_logo/site_logo.dart';
import '../../style/style.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(20, 5, 7, 5),
      decoration: headerDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}
