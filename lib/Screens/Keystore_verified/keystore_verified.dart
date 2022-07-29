import 'package:final_bone/Screens/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class KeyStoreVerified extends StatefulWidget {
  @override
  KeyStoreVerifiedState createState() => KeyStoreVerifiedState();
}

class KeyStoreVerifiedState extends State<KeyStoreVerified> {
  final _formKey = GlobalKey<FormState>();
  final aliasController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // disposing all the controllers else they will lead to memory leak in device
    aliasController.dispose();
    passwordController.dispose();
  }

  bool _secureText = true;
  String _email = '';
  String _password = '';
  bool isLoading = false;

  void toggle() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: null,
            margin: null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Container(
                    //     padding: EdgeInsets.only(top: 20, left: 10),
                    //     child: IconButton(
                    //       onPressed: () {
                    //         Navigator.of(context).pop();
                    //       },
                    //       icon: Icon(Icons.arrow_back,
                    //           color: Colors.white, size: 28),
                    //     )),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 85),
                      child: Center(
                        child: Text(
                          'Keystore Verified'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      width: double.infinity,
                      height: 700,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(34),
                            topRight: const Radius.circular(34)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 80),
                                  child: Text(
                                    'Alias Name',
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    child: TextFormField(
                                      enableSuggestions: true,
                                      keyboardType: TextInputType.text,
                                      controller: aliasController,
                                      textInputAction: TextInputAction.next,
                                      validator: (input) => input != null
                                          ? null
                                          : "Please enter valid alias name.",
                                      onSaved: (value) {
                                        _email = value!;
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: new BorderSide(
                                            width: 2,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20)),
                                          borderSide: new BorderSide(
                                              width: 2,
                                              color: Colors.grey.shade200),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        hintText: "Enter your alias name",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  child: TextFormField(
                                    controller: passwordController,
                                    onChanged: (input) {
                                      _password = input;
                                    },
                                    validator: (input) =>
                                        input != null && input.length < 6
                                            ? "Password too short!"
                                            : null,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: new BorderSide(
                                            width: 2,
                                            color: Colors.grey.shade200),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: new BorderSide(
                                            width: 2,
                                            color: Colors.grey.shade200),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.https,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      suffixIcon: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            toggle();
                                          });
                                        },
                                        child: _secureText
                                            ? Icon(Icons.visibility_off,
                                                color: Colors.grey
                                                    .withOpacity(0.5))
                                            : Icon(Icons.remove_red_eye,
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
                                      ),
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      hintText: "Enter Password",
                                    ),
                                    obscureText: _secureText,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const SizedBox(height: 60),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  width: double.infinity,
                                  height: 50,
                                  child: MaterialButton(
                                    color: kPrimaryColor,
                                    onPressed: () {},
                                    child: Text(
                                      'Go to Dashboard',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
