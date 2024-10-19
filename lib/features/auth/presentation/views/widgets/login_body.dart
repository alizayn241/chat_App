import 'package:chat_app/features/auth/home/homeView.dart';
import 'package:chat_app/features/auth/presentation/views/login_title.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/email_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_button.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_row.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class loginBody extends StatefulWidget {
  loginBody({super.key});

  @override
  State<loginBody> createState() => _loginBodyState();
}

class _loginBodyState extends State<loginBody> {
  TextEditingController Emailcontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  bool isPasswordVisible = false;

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const logoWidget(),
              SizedBox(
                height: 20,
              ),
              const LoginTitle(),
              SizedBox(
                height: 20,
              ),
              EmailField(
                Emailcontroller: Emailcontroller,
              ),
              SizedBox(
                height: 20,
              ),
              PasswordField(
                Passwordcontroller: Passwordcontroller,
                toogleVisibility: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                isPasswordVisible: isPasswordVisible,
              ),
              SizedBox(
                height: 50,
              ),
              LoginButton(
                  emailController: Emailcontroller,
                  passwordController: Passwordcontroller,
                  onSuccess: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homeview(),
                        ));
                  }),
              SizedBox(
                height: 10,
              ),
              RegisterRow(),
            ],
          ),
        ),
      ),
    );
  }
}