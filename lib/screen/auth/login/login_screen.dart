import 'package:assignment_thebrewapps/widgets/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/login_controller.dart';
import '../../../widgets/widgets.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          backgroundColor: Colors.black87,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Brew Apps",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.adobe_rounded,
                          color: Colors.blue,
                          size: 38,
                        ),
                      ],
                    ),
                  ),
                  const TopDecorContainer(title: "Login"),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Consumer<LoginProvider>(
                        builder: (context, cLp, child) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter you Email";
                                  } else if (value.isEmailValidate() == false) {
                                    return "Invalid Email";
                                  } else if (value.isEmailValidate() == true) {
                                    return null;
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  cLp.email = value;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'Email',
                                    contentPadding: const EdgeInsets.all(13),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.greenAccent),
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter you Password";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  cLp.password = value;
                                },
                                style: const TextStyle(color: Colors.white),
                                obscureText: cLp.passwordVisible,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          cLp.passwordVisibily();
                                        },
                                        icon: Icon(
                                          cLp.passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white,
                                        )),
                                    labelText: 'Password',
                                    contentPadding: const EdgeInsets.all(13),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.greenAccent),
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  cLp.login(context, _formKey, _scaffoldKey);
                                },
                                child: cLp.processing == true
                                    ? const CircularProgressIndicator()
                                    : const ButtonContainer(
                                        kWidth: 400,
                                        kHeight: 50,
                                        kColors: Colors.blue,
                                        title: "Login",
                                        ls: 0,
                                        fontwght: FontWeight.normal,
                                        fontsz: 14,
                                        bRadius: 25,
                                        icons: Icons.arrow_forward,
                                      ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Textbutton(
                    colors: Colors.grey,
                    title: "Don't have an account ? ",
                    text: "Sign up",
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopDecorContainer extends StatelessWidget {
  const TopDecorContainer({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -20,
                left: -50,
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.1)))),
            Positioned(
                left: -80,
                top: -50,
                child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5)))),
            Positioned(
              child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Textbutton extends StatelessWidget {
  const Textbutton({
    Key? key,
    required this.title,
    this.text,
    required this.ontap,
    required this.colors,
  }) : super(key: key);
  final String title;
  final String? text;
  final VoidCallback ontap;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: colors)),
            Text(
              text ?? '',
              style: const TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ],
        ));
  }
}
