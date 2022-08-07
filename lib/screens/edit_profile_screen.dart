import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
            "Edit Profile",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CircleAvatar(
                radius: height / width * 35,
                backgroundColor: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
              ),
              const Divider(color: Colors.transparent),
              AutoSizeText(
                "Change Photo",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16),
              ),
              Divider(color: Colors.transparent, height: height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Name",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "Mr Robot",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: Colors.grey),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              Divider(color: Colors.transparent, height: height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Username",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "mr-robot",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: Colors.grey),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              Divider(color: Colors.transparent, height: height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Bio",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "Add abio to your profile",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: Colors.grey),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
