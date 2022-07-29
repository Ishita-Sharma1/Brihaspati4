import 'package:flutter/material.dart';
import 'package:final_bone/Screens/Welcome/components/background.dart';
import 'package:final_bone/Screens/components/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "WELCOME TO BRIHASPATI 4",
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: kPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image.asset(
          "assets/images/logo_png.png",
          width: size.width * 0.8,
          height: size.height * 0.4,
        ),
        SizedBox(
          width: size.width * 0.8,
          child: MaterialButton(
            onPressed: () {},
            color: kPrimaryColor,
            child: Text(
              "GET STARTED",
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
