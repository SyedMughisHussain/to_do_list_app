import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list/auth_screens/sign_in_screen.dart';
import '../auth_functions/auth_functions.dart';
import '../other_screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void onSaved() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      authFunctions.signUp(context, email, password, userName);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  var email = '';
  var password = '';
  var userName = '';
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  AuthFunctions authFunctions = AuthFunctions();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 120.sp),
                child: Image.asset('assets/images/logo.png',
                    fit: BoxFit.cover, height: 130.sp),
              ),
              SizedBox(
                height: 50.sp,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || !value.contains('@')) {
                            return 'Enter the valid email address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(39, 39, 39, 0.5)),
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onSaved: (newValue) {
                          email = newValue!;
                        },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.length <= 4) {
                            return 'Enter the valid user name to continue';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(39, 39, 39, 0.5)),
                            hintText: 'Full Name',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onSaved: (newValue) {
                          userName = newValue!;
                        },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      TextFormField(
                        obscureText: showPassword,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.length <= 4) {
                            return 'Enter the valid password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(39, 39, 39, 0.5)),
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                    ],
                  )),
              SizedBox(
                height: 35.sp,
              ),
              CustomButton(
                  onSaved, const Color.fromRGBO(247, 158, 137, 1), 'SIGN UP'),
              SizedBox(
                //width: double.infinity,
                width: 232.sp,
                child: Row(
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                        },
                        child: const Text('Sign in'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
