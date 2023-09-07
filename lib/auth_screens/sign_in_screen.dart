import 'package:flutter/material.dart';
import 'package:to_do_list/auth_functions/auth_functions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

String email = '';
String password = '';

AuthFunctions authFunctions = AuthFunctions();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        height: height,
        width: width,
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: height - 400,
            ),
            // Container(
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: AssetImage('assets/images/logo.png'))),
            // ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null && !value!.contains('@')) {
                      authFunctions.showBottomToast(
                          context, 'Enter the valid email address');
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null && value!.length <= 5) {
                      authFunctions.showBottomToast(
                          context, 'Enter the valid password');
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
