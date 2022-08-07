import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).canvasColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: const [
            Icon(Icons.share),
            VerticalDivider(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * .17,
                    width: width * .3,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 35,
                    ),
                  ),
                  const VerticalDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "The Round",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      AutoSizeText(
                        "Roddy Roundicch",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16, color: Colors.grey),
                      ),
                      AutoSizeText(
                        "1.7M Views",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16, color: Colors.grey),
                      ),
                      const Divider(color: Colors.transparent, height: 30),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bookmark_border_rounded,
                              color: Colors.black,
                            ),
                            const VerticalDivider(width: 5),
                            AutoSizeText(
                              "Add to Favorites",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(color: Colors.transparent),
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1, crossAxisSpacing: 1, crossAxisCount: 3),
                itemBuilder: (context, i) => Container(
                  color: Colors.grey,
                ),
                itemCount: 15,
              ))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed: () {},
            label: Row(
              children: [
                const Icon(
                  Icons.music_note_rounded,
                  color: Colors.white,
                ),
                Text(
                  "Use this Sound",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14),
                ),
              ],
            )),
      ),
    );
  }
}
