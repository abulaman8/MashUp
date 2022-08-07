import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FindFriendsScreen extends StatelessWidget {
  const FindFriendsScreen({Key? key}) : super(key: key);

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
          title: Text(
            "Find Friends",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: height * .07,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.search),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: width * .75, maxHeight: height * .06),
                      child: const TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Search"),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: height / width * 12,
                  child: const Icon(Icons.person_add_alt_1_outlined),
                ),
                title: AutoSizeText("Invite Friends",
                    style: Theme.of(context).textTheme.bodyText1),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Divider(color: Colors.transparent),
              ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: height / width * 12,
                    child: const Icon(Icons.phone),
                  ),
                  title: AutoSizeText("Find Contacts",
                      style: Theme.of(context).textTheme.bodyText1),
                  trailing: Icon(Icons.arrow_forward_ios_rounded)),
              const Divider(color: Colors.transparent),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: height / width * 12,
                  child: const Icon(Icons.facebook_rounded),
                ),
                title: AutoSizeText("Find Facebook Friends",
                    style: Theme.of(context).textTheme.bodyText1),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              )
            ],
          ),
        ),
      ),
    );
  }
}
