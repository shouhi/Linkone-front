import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:linkone/config/utils.dart';
import 'package:linkone/models/auth_model.dart';
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
                      onPressed: () async{
                        if (_signupKey.currentState.validate()) {
                          await _signup(context);
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
  Future<bool> _signup(BuildContext context) async {
    bool loggedIn = false;
    if (await context.read<AuthModel>().signup(emailInputController.text, pwdInputController.text)) {
      loggedIn = true;
    }
    return loggedIn;
  }
}
