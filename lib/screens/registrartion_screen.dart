import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticktok_ui/routes/routes.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  TextEditingController _phController = TextEditingController();
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
              SizedBox(
                height: height * 0.08,
              ),
              AutoSizeText(
                "Register with\nmobile number",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Divider(height: height * 0.15, color: Colors.transparent),
              TextField(
                controller: _phController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("+ 91"),
                ),
              ),
              Divider(height: height * 0.1, color: Colors.transparent),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("OTP has been sent to your mobile number."),
                    ),
                  );

                  Navigator.of(context).pushNamed(routeName.OtpScreen);
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    fixedSize: MaterialStateProperty.all(Size(width, 50))),
                child: Text("Next",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black, fontSize: 22)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
