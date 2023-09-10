import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list/auth_functions/auth_functions.dart';
import 'package:to_do_list/auth_screens/sign_up_screen.dart';
import 'package:to_do_list/other_screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

var email = '';
var password = '';
bool showPassword = false;
final _formKey = GlobalKey<FormState>();
AuthFunctions authFunctions = AuthFunctions();

class _SignInScreenState extends State<SignInScreen> {
  void onSaved() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      authFunctions.signIn(context, email, password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

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
                margin: EdgeInsets.only(top: 150.sp),
                child: Image.asset('assets/images/logo.png',
                    fit: BoxFit.cover, height: 130.sp),
              ),
              SizedBox(
                height: 150.sp,
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
                        obscureText: showPassword,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.length <= 5) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined)),
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(39, 39, 39, 0.5)),
                            hintText: 'Password',
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5))),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(39, 39, 39, 0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: 35.sp,
              ),
              CustomButton(
                  onSaved, const Color.fromRGBO(247, 158, 137, 1), 'SIGN IN'),
              SizedBox(
                //width: double.infinity,
                width: 222.sp,
                child: Row(
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                        },
                        child: const Text('Sign up'))
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

class CustomButton extends StatelessWidget {
  const CustomButton(this.function, this.backGroundColor, this.text,
      {super.key});

  final Function function;
  final Color backGroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        height: 48.sp,
        width: 327.sp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
