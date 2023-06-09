import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:user_login_design/views/login_page.dart';
import 'package:user_login_design/views/pagination.dart';
import 'package:user_login_design/widgets/text_field_user_submit.dart';

class UserEmailPassword {
  final String email;
  final String password;

  UserEmailPassword({
    required this.email,
    required this.password,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.argument,
  });

  final UserEmailPassword argument;
  static const routename = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  final formKey = GlobalKey<FormState>();
  String name = "";

  //
  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scffoldkey = GlobalKey<ScaffoldState>();

    //
    return Scaffold(
      key: scffoldkey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          GoRouter.of(context).pushNamed(Pagination.routename);
        },
        child: Icon(
          PhosphorIcons.bold.caretRight,
          size: 24,
        ),
      ),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserTextFieldSubmit(
                label: 'Email:',
                text: widget.argument.email,
              ),
              SizedBox(height: height * 0.05),
              UserTextFieldSubmit(
                label: 'Password:',
                text: widget.argument.password,
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
