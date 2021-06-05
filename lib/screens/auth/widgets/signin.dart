import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:linkone/config/pallet.dart';
import 'package:linkone/config/utils.dart';
import 'package:linkone/models/auth_model.dart';
import 'decoration_function.dart';
import 'sign_in_up_bar.dart';
import 'title.dart';

class SignIn extends StatelessWidget {
  SignIn({
    Key key,
    this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

  //入力key
  final GlobalKey<FormState> _signinKey = GlobalKey<FormState>();

  final emailInputController = TextEditingController(text: "@kwansei.ac.jp");
  final pwdInputController = TextEditingController();
  // bool _showPassword;

  @override
  Widget build(BuildContext context) {
    bool isSubmitting = false;
    Firebase.initializeApp();
    return Form(
      key: _signinKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Welcome\nBack',
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
                      decoration: signInInputDecoration(hintText: '学生メールアドレス'),
                      validator: Utils.emailValidator,
                      controller: emailInputController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      decoration: signInInputDecoration(hintText: 'Password'),
                      validator: Utils.pwdValidator,
                      controller: pwdInputController,
                    ),
                  ),
                  SignInBar(
                    label: 'Sign in',
                    isLoading: isSubmitting,
                    onPressed: () async {
                      //indicator一旦保留（statefulじゃないと無理かも）
                      isSubmitting = true;
                      print(isSubmitting);
                      if (_signinKey.currentState.validate()) {
                        await _login(context);
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        print(emailInputController.text);
                        onRegisterClicked.call();
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Palette.darkBlue,
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
  Future<bool> _login(BuildContext context) async {
    bool loggedIn = false;
    if (await context.read<AuthModel>().login(emailInputController.text, pwdInputController.text)) {
      loggedIn = true;
    }
    return loggedIn;
  }
}
