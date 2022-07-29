import 'package:final_bone/Screens/components/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "WELCOME TO BRIHASPATI 4",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Image.asset(
          "assets/images/logo_png.png",
          width: size.width * 0.4,
          height: size.height * 0.6,
        ),
        SizedBox(
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: kPrimaryColor,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("GET STARTED",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
