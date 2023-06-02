import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:user_login_design/views/home_page.dart';
import 'package:user_login_design/widgets/button.dart';
import 'package:user_login_design/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  static const routename = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.deepPurple.withOpacity(0.4),
              child: Icon(
                PhosphorIcons.fill.userCircle,
                size: 120,
                color: Colors.indigo.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 50),
            InputTextField(
              controller: _inputEmail,
              label: 'Email',
              hinttext: 'example@gmail.com',
            ),
            const SizedBox(height: 16),
            InputTextField(
              controller: _inputPassword,
              label: 'Password',
              hinttext: 'at least 8 character',
              obscuretext: true,
            ),
            const SizedBox(height: 20),
            SubmitButton(
              titile: 'Register / Login',
              ontap: () {
                GoRouter.of(context).pushNamed(
                  HomePage.routename,
                  extra: UserEmailPassword(
                    email: _inputEmail.text,
                    password: _inputPassword.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
