import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkone/config/utils.dart';
import 'package:linkone/screens/home.dart';

import 'decoration_function.dart';
import 'sign_in_up_bar.dart';
import 'title.dart';

class Register extends StatelessWidget {
  Register({Key key, this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  //入力key
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  final emailInputController = TextEditingController(text: "@kwansei.ac.jp");
  final pwdInputController = TextEditingController();
  // bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // final isSubmitting = context.isSubmitting();
    return Form(
      key: _signupKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Create\nAccount',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      controller: emailInputController,
                      validator: Utils.emailValidator,
                      decoration: registerInputDecoration(
                        hintText: '学生メールアドレス',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      // obscureText: !_showPassword,　#要らないかな
                      controller: pwdInputController,
                      validator: Utils.pwdValidator,
                      decoration: registerInputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SignUpBar(
                      label: 'Sign up',
                      isLoading: false,
                      onPressed: () {
                        if (_signupKey.currentState.validate()) {
                          print(emailInputController.text);
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((result) => {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                        (_) => false),
                                    emailInputController.clear(),
                                    pwdInputController.clear(),
                                  })
                              .catchError((err) {
                            print(err);
                            Utils.showErrorDialog(err, context);
                          });
                        }
                      }),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onSignInPressed.call();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
