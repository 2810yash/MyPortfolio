import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/my_handlers.dart';
import '../../../utils/contact_utils.dart';

class ContactIcon extends StatelessWidget {
  final Function(int) onNavMenuTap;
  final VoidCallback onGoToProjects;

  const ContactIcon(
      {super.key, required this.onNavMenuTap, required this.onGoToProjects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < contacts.length; i++)
              InkWell(
                child: Image.asset(
                  contacts[i].icon,
                  color: Colors.white,
                  height: 20.0,
                ),
                onTap: () {
                  launchUrl(Uri.parse(contacts[i].link));
                },
              ),
          ],
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onGoToProjects();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent)),
                child: const Text("Projects",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse(MyUrls.myResume));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              child: const Text("Resume",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
