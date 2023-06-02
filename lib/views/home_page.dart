import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:user_login_design/views/login_page.dart';
import 'package:user_login_design/widgets/text_field_user_submit.dart';

class UserEmailPassword {
  final String email;
  final String password;

  UserEmailPassword({
    required this.email,
    required this.password,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.argument,
  });

  final UserEmailPassword argument;
  static const routename = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 24,
          onPressed: () {
            GoRouter.of(context).pop(LoginPage.routename);
          },
          icon: Icon(
            PhosphorIcons.bold.caretLeft,
            size: 24,
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserTextFieldSubmit(
              label: 'Email:',
              text: argument.email,
            ),
            const SizedBox(height: 10),
            UserTextFieldSubmit(
              label: 'Password:',
              text: argument.password,
            ),
          ],
        ),
      ),
    );
  }
}
