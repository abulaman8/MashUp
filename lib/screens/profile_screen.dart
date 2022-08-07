import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticktok_ui/routes/routes.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                  child: const Icon(Icons.person_add_alt),
                  onTap: () => Navigator.of(context)
                      .pushNamed(routeName.FindFriendScreen)),
              const Spacer(),
              AutoSizeText(
                "Mr. Robot",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              const Icon(Icons.arrow_drop_down),
              const Spacer(),
              GestureDetector(
                child: const Icon(Icons.more_horiz),
                onTap: () => Navigator.of(context)
                    .pushNamed(routeName.PrivacyAndSettingScreen),
              ),
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          const Divider(color: Colors.transparent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: height / width * 30,
                backgroundColor: Colors.grey.shade700,
              ),
              Column(
                children: [
                  AutoSizeText("91", style: GoogleFonts.reemKufi(fontSize: 22)),
                  AutoSizeText(
                    "Posts",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white.withOpacity(0.5), fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  AutoSizeText("21", style: GoogleFonts.reemKufi(fontSize: 22)),
                  AutoSizeText(
                    "Following",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white.withOpacity(0.5), fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  AutoSizeText("53", style: GoogleFonts.reemKufi(fontSize: 22)),
                  AutoSizeText(
                    "Followers",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white.withOpacity(0.5), fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          AutoSizeText(
            " @mr-robot",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
          ),
          Divider(color: Colors.transparent, height: height * .05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(routeName.EditProfileScreen),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "Edit Profile",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              const VerticalDivider(),
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          Divider(color: Colors.transparent, height: height * .05),
          const Divider(),
          TabBar(
            tabs: const [
              Tab(child: Icon(Icons.apps_rounded)),
              Tab(child: Icon(Icons.favorite_border_rounded)),
            ],
            controller: _controller,
            indicatorColor: Colors.white,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (ctx, indx) => Container(
                    color: Colors.grey,
                  ),
                  itemCount: 8,
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
