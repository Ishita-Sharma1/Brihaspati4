import 'package:final_bone/Screens/components/constants.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final serviceController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    // disposing all the controllers else they will lead to memory leak in device
    nameController.dispose();
    serviceController.dispose();
    mobileController.dispose();
    emailController.dispose();
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
                                    'Email Address',
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
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    textInputAction: TextInputAction.next,
                                    validator: (input) => input != null
                                        ? null
                                        : "Please enter valid email address.",
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
                                        Icons.mail,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      hintText: "Enter your email",
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
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
                                      controller: emailController,
                                      textInputAction: TextInputAction.next,
                                      validator: (input) => input != null
                                          ? null
                                          : "Please enter your name.",
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
                                        hintText: "Enter your name",
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
                                    'Mobile Number',
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
                                    controller: mobileController,
                                    onChanged: (input) {
                                      _password = input;
                                    },
                                    validator: (input) =>
                                        input != null && input.length < 11
                                            ? "Mobile number too short!"
                                            : null,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                      hintText: "Enter your mobile number",
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
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
                                        Icons.phone,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Service offered',
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
                                      controller: serviceController,
                                      textInputAction: TextInputAction.next,
                                      validator: (input) => input != null
                                          ? null
                                          : "Please enter service offered.",
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
                                          Icons.shopping_bag,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        hintText: "Enter your service offered",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 50,
                                ),
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
                                      'Sign Up',
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
