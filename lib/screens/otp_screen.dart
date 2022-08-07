import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticktok_ui/routes/routes.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.reply)),
              SizedBox(
                height: height * 0.05,
              ),
              AutoSizeText(
                "Enter the OTP",
                style: GoogleFonts.aBeeZee(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(height: height * 0.15, color: Colors.transparent),
              TextField(
                controller: _otpController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
              ),
              Divider(height: height * 0.05, color: Colors.transparent),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(routeName.UserDetailScreen);
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      fixedSize: MaterialStateProperty.all(Size(width, 50)),
                    ),
                child: Text("Submit",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black)),
              ),
              Divider(
                height: height * 0.02,
              ),
              RichText(
                text: const TextSpan(
                  text: "By submitting you agree to Mashup's ",
                  children: <TextSpan>[
                    TextSpan(
                        text: "Terms of service",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(
                      text: " and ",
                    ),
                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
