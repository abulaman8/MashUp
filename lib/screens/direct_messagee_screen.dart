import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DirectMessage extends StatelessWidget {
  const DirectMessage({Key? key}) : super(key: key);

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
          "Direct Message",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.chat_bubble_outline_rounded,
            size: 100,
          ),
          Center(
            child: AutoSizeText(
              "Message Your Friends",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    ));
  }
}
