import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(39, 39, 39, 0.5)),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(39, 39, 39, 0.5)),
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                ),
                SizedBox(
                  height: 10.sp,
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
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined)),
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(39, 39, 39, 0.5)),
                      hintText: 'Password',
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(39, 39, 39, 0.5)),
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
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
                () {}, const Color.fromRGBO(247, 158, 137, 1), 'SIGN IN'),
            SizedBox(
              width: 210.sp,
              child: Row(
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(onPressed: () {}, child: const Text('Sign up'))
                ],
              ),
            ),
          ],
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
