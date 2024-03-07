import 'package:flutter/material.dart'; //cheack
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/my_handlers.dart';
import '../constants/size.dart';
import '../widgets/contact_section/contact_section.dart';
import '../widgets/footer/footer_widget.dart';
import '../widgets/header/drawer/drawer.dart';
import '../widgets/header/header_desktop.dart';
import '../widgets/header/header_mobile.dart';
import '../widgets/main_page/main_desktop.dart';
import '../widgets/main_page/main_mobile.dart';
import '../widgets/project_section/project_card.dart';
import '../widgets/skills_section/skill_desktop.dart';
import '../widgets/skills_section/skill_mobile.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final scrollController = ScrollController();
  bool shouldScroll = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: constraints.maxWidth >= minDesktopSize
            ? null
            : CustomDrawer(onNavMenuTap: (int navIndex) {
                scrollToSection(navIndex);
              }),
        backgroundColor: CustomColor.scaffoldBg,
        body: SingleChildScrollView(
          physics: constraints.maxWidth >= minDesktopSize
              ? const AlwaysScrollableScrollPhysics()
              : shouldScroll? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          // physics: shouldScroll
          //     ? AlwaysScrollableScrollPhysics()
          //     : NeverScrollableScrollPhysics(),
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),
              //   Navbar
              constraints.maxWidth >= minDesktopSize
                  ? HeaderDesktop(onNavMenuTap: (int navIndex) {
                      //  call Function
                      scrollToSection(navIndex);
                    })
                  : HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                        // CustomDrawer();
                      },
                    ),

              //  Home
              constraints.maxWidth >= minDesktopSize
                  ? const MainDesktop()
                  : const MainMobile(),

              //   Skills
              Container(
                key: navbarKeys[1],
                width: screenWidth,
                color: CustomColor.bgLight1,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Skill Title
                    const Text(
                      "What I can do",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    //   Skill Items
                    constraints.maxWidth >= minDesktopSize
                        ? const SkillDesktop()
                        : const SkillMobile(),
                  ],
                ),
              ),

              //   Projects
              Container(
                key: navbarKeys[2],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Skill Title
                    const Text(
                      "Projects",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    //   Skill Items
                    constraints.maxWidth <= screenWidth / 3
                        ? ProjectCard(setWidth: screenWidth / 3)
                        : ProjectCard(setWidth: screenWidth),
                  ],
                ),
              ),

              // Get in touch
              ContactSection(
                key: navbarKeys[3],
              ),

              //   Footer
              const FooterWidget(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open Blog Page
      launchUrl(Uri.parse(MyUrls.myResume));
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );

    // Determine if you are in the "Projects" section and set shouldScroll accordingly
    setState(() {
      shouldScroll = navIndex == 2
          ? true
          : false; // Assuming 2 corresponds to the "Projects" section index
    });
  }
}
