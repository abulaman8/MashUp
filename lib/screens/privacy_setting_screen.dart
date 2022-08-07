import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrivacyAndSettingScreen extends StatelessWidget {
  const PrivacyAndSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).canvasColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Privacy and Settings",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Account",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w100),
              ),
              const Divider(color: Colors.transparent, height: 10),
              const WidgetTile(
                  title: "Manage my account",
                  icon: Icons.person_outline_rounded),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(
                  title: "Privacy and safety",
                  icon: Icons.lock_outline_rounded),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(
                  title: "Content preferences",
                  icon: Icons.video_camera_back_rounded),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(title: "Share profile", icon: Icons.share),
              const Divider(color: Colors.transparent, height: 10),
              AutoSizeText(
                "Genral",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w100),
              ),
              const Divider(color: Colors.transparent, height: 10),
              const WidgetTile(
                  title: "Push Notification", icon: Icons.notifications_none),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(title: "Language", icon: Icons.language_rounded),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(
                  title: "Accessbility", icon: Icons.accessibility_new_rounded),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(
                  title: "Data saver", icon: Icons.data_saver_on_rounded),
              const Divider(color: Colors.transparent, height: 10),
              AutoSizeText(
                "Support",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w100),
              ),
              const Divider(color: Colors.transparent, height: 10),
              const WidgetTile(
                  title: "Report a problem",
                  icon: Icons.report_problem_rounded),
              const Divider(color: Colors.transparent, height: 5),
              const WidgetTile(
                  title: "Help center", icon: Icons.help_outline_rounded),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const WidgetTile({super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const VerticalDivider(width: 5),
            AutoSizeText(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w100),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
