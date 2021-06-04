import 'package:flutter/material.dart';
// import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import '../widgets/decoration_function.dart';
import './sign_in_up_bar.dart';

import '../../../config/pallet.dart';
import 'title.dart';

class SignIn extends StatelessWidget {
  SignIn({
    Key key,
    @required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

  //入力key
  final GlobalKey<FormState> _signinKey = GlobalKey<FormState>();

  final emailInputController = TextEditingController(text: "@kwansei.ac.jp");
  final pwdInputController = TextEditingController();
  bool _showPassword;

  @override
  Widget build(BuildContext context) {
    // final isSubmitting = context.isSubmitting();
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
                      controller: emailInputController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      decoration: signInInputDecoration(hintText: 'Password'),
                      controller: pwdInputController,
                    ),
                  ),
                  SignInBar(
                    label: 'Sign in',
                    isLoading: false,
                    onPressed: () {
                      // context.signInWithEmailAndPassword();
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
}
