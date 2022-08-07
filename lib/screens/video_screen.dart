import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticktok_ui/routes/routes.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      children: [

        Positioned(
          bottom: height * .01,
          left: width * .02,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: width / height * 35,
                    backgroundColor: Colors.grey,
                  ),
                  const VerticalDivider(width: 5),
                  Text(
                    "@mr-robot",
                    style:
                        GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                  ),
                  const VerticalDivider(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      child: Text(
                        "Follow",
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.transparent,
                height: height * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "#Avicii",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const VerticalDivider(width: 5),
                  Text(
                    "#Wflove",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(routeName.AlbumScreen),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.music_note_rounded,
                      color: Colors.white,
                    ),
                    const VerticalDivider(width: 5),
                    Text(
                      "Avicii-waiting for love",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: height * .15,
          right: width * .02,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 35,
                  )),
              Text(
                "353K",
                style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),
              ),
              Divider(height: height * .03),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        isDismissible: false,
                        context: context,
                        builder: (ctx) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BottamSheet(height: height, width: width),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.chat_bubble_rounded,
                    color: Colors.white,
                    size: 35,
                  )),
              Text(
                "578",
                style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),
              ),
              Divider(height: height * .03),
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(routeName.DirectMessageScreen),
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 35,
                  )),
              Text(
                "12",
                style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottamSheet extends StatelessWidget {
  BottamSheet({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  TextEditingController _comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            const Text("579 Comments"),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.highlight_off_rounded),
            )
          ],
        ),
        const Divider(),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 2),
          itemCount: 12,
          itemBuilder: (ctx, i) => Comment(height: height, width: width),
        )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: width * .78, maxHeight: height * .05),
                child: TextField(
                  controller: _comment,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Add comment here"),
                ),
              ),
              const Icon(Icons.alternate_email_rounded),
              const VerticalDivider(),
              const Icon(Icons.emoji_emotions_rounded),
            ],
          ),
        )
      ],
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: height / width * 10,
        ),
        const VerticalDivider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "mr-robot",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
            ),
            const Divider(color: Colors.transparent, height: 5),
            AutoSizeText(
              "Some random comment",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
            ),
            const Divider(color: Colors.transparent, height: 5),
            AutoSizeText(
              "View replies(4)",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            const Icon(Icons.favorite_border),
            AutoSizeText(
              "5098",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
