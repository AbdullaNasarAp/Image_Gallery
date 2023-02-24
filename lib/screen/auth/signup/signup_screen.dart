import 'package:assignment_thebrewapps/screen/auth/login/login_screen.dart';
import 'package:assignment_thebrewapps/widgets/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/signup_controller.dart';
import '../../../widgets/widgets.dart';
import '../../home/home.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldMessenger(
        key: scaffoldKey,
        child: Scaffold(
          backgroundColor: Colors.black87,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Consumer<SignupProvider>(
                    builder: (context, cSp, child) {
                      return Column(
                        children: [
                          const TopHead(),
                          const SizedBox(
                            height: 20,
                          ),
                          const TopDecorContainer(title: "Sign up"),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter you Fullname";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              cSp.name = value;
                            },
                            decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                contentPadding: const EdgeInsets.all(13),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabled: true,
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
                              cSp.email = value;
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
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter you Password";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              cSp.password = value;
                            },
                            obscureText: cSp.passwordVisible,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cSp.passwordVisibily();
                                    },
                                    icon: Icon(
                                      cSp.passwordVisible
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
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter you Password";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              cSp.password = value;
                            },
                            obscureText: cSp.passwordVisible,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cSp.passwordVisibily();
                                    },
                                    icon: Icon(
                                      cSp.passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    )),
                                labelText: 'Confirm Password',
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
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                            },
                            child: cSp.processing == true
                                ? const CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      cSp.signUp(context, formKey, scaffoldKey);
                                    },
                                    child: const ButtonContainer(
                                      kWidth: 400,
                                      kHeight: 50,
                                      kColors: Colors.blue,
                                      title: "Sign Up",
                                      ls: 0,
                                      fontwght: FontWeight.normal,
                                      fontsz: 14,
                                      bRadius: 25,
                                      icons: Icons.arrow_forward,
                                    ),
                                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}

class TopHead extends StatelessWidget {
  const TopHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
