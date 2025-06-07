import 'package:chat/constants.dart';
import 'package:chat/helper/show_snack_par.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static final String ID = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      'REGISTER',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  validator: (data) {
                    if (data.toString().isEmpty) {
                      return 'this field required';
                    } else if (data.toString().endsWith('@gmail.com')) {
                      return null;
                    } else {
                      return 'wrong email';
                    }
                  },
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  obscureText: true,
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
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
                  text: 'REGISTER',
                  ontap: () async {
                    isLoading = true;
                    setState(() {});
                    if (formKey.currentState!.validate())
                      try {
                        UserCredential user = await createUser();
                        showSnackBar(context, 'Success');
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'Email Already Exists');
                        }
                      }
                    isLoading = false;
                    setState(() {});
                  },
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Login',
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

  Future<UserCredential> createUser() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
