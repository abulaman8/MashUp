import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticktok_ui/routes/routes.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  Color inactive = Colors.black12;
  Color active = Colors.white.withOpacity(0.3);
  TextEditingController _username = TextEditingController();
  TextEditingController _dob = TextEditingController();
  int selected = 0;
  List<String> intrest = [
    'Sport',
    'Dance',
    'Films',
    'Science',
    'Music',
    'Art',
    'News',
    'Cars',
    'Business'
  ];
  List<bool> selectedIntrest = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.reply)),
              SizedBox(
                height: height * 0.05,
              ),
              AutoSizeText(
                "One last step",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Divider(height: height * .02, color: Colors.transparent),
              AutoSizeText(
                "Username",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Divider(height: height * .01, color: Colors.transparent),
              TextField(
                cursorColor: Colors.white,
                controller: _username,
              ),
              Divider(height: height * .02, color: Colors.transparent),
              AutoSizeText(
                "Date of birth",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Divider(height: height * .01, color: Colors.transparent),
              TextField(
                cursorColor: Colors.white,
                controller: _dob,
                keyboardType: TextInputType.datetime,
              ),
              Divider(height: height * .02, color: Colors.transparent),
              AutoSizeText(
                "Gender",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Divider(height: height * .01, color: Colors.transparent),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      selected = 0;
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selected == 0 ? active : inactive,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Text(
                        "Male",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  GestureDetector(
                    onTap: () => setState(() {
                      selected = 1;
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selected == 1 ? active : inactive,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Text(
                        "Female",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  GestureDetector(
                    onTap: () => setState(() {
                      selected = 2;
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selected == 2 ? active : inactive,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Text(
                        "Other",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(height: height * .02, color: Colors.transparent),
              AutoSizeText(
                "Intrests",
                style: GoogleFonts.aBeeZee(
                  fontSize: 22,
                ),
              ),
              Divider(height: height * .01, color: Colors.transparent),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (width / height) * 5.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: intrest.length,
                itemBuilder: (ctx, indx) => GestureDetector(
                  onTap: () => setState(() {
                    selectedIntrest[indx] = !selectedIntrest[indx];
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedIntrest[indx] ? active : inactive,
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: Text(
                      intrest[indx],
                      style: GoogleFonts.aBeeZee(),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(routeName.HomeScreen);
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      minimumSize: MaterialStateProperty.all(Size(width, 50)),
                    ),
                child: Text("Login",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
