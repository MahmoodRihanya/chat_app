import 'package:chat/constants.dart';
import 'package:chat/helper/show_snack_par.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/choice_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static final String ID = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Spacer(flex: 2),
                Image.asset('assets/images/scholar.png'),
                Text(
                  'Chat App',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Spacer(flex: 2),
                Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                  validator: (data) {
                    if (data.toString().isEmpty) {
                      return 'this field required';
                    } else if (data.toString().endsWith('@gmail.com')) {
                      return null;
                    } else {
                      return 'wrong email';
                    }
                  },
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                  validator: (data) {
                    if (data.toString().isEmpty) {
                      return 'this field required';
                    } else if (data.toString().length < 8) {
                      return 'weak passwor EX"12345678"';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: 'LOGIN',

                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        UserCredential userCredential = await signIn();
                        showSnackBar(context, 'Hello');
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          ChoicePage.ID,
                          arguments: email,
                          (Route<dynamic> route) => false,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                            context,
                            'No user found for that email.',
                          );
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(
                            context,
                            'Wrong password provided for that user.',
                          );
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.ID);
                      },
                      child: Text(
                        '  Register',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    ),
                  ],
                ),

                Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signIn() {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
