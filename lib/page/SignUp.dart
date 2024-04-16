import 'package:flutter/material.dart';
import 'package:monkeydosomething/const/firestone.dart';
import 'package:monkeydosomething/page/Login.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/CustomTextInput.dart';


class SignUp extends StatefulWidget {
  static const routeName = '/SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirestoreService _firestoreService = FirestoreService();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNoController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: Helper.getTheme(context).headline6,
                ),
                SizedBox(height: 20), // Added SizedBox for spacing
                Text(
                  "Add your details to sign up",
                ),
                SizedBox(height: 20), // Added SizedBox for spacing
                Form(
                  child: Column(
                    children: [
                      CustomTextInput(
                        hintText: "Name",
                        controller: _nameController,
                        textInputType: TextInputType.text,
                        onSaved: (value) {}, obscureText: true,
                      ),
                      SizedBox(height: 15), // Added SizedBox for spacing
                      CustomTextInput(
                        hintText: "Email",
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) {}, obscureText: true,
                      ),
                      SizedBox(height: 15), // Added SizedBox for spacing
                      CustomTextInput(
                        hintText: "Mobile No",
                        controller: _mobileNoController,
                        textInputType: TextInputType.phone,
                        onSaved: (value) {}, obscureText: true,
                      ),
                      SizedBox(height: 15), // Added SizedBox for spacing
                      CustomTextInput(
                        hintText: "Address",
                        controller: _addressController,
                        textInputType: TextInputType.streetAddress,
                        onSaved: (value) {}, obscureText: true,
                      ),
                      SizedBox(height: 15), // Added SizedBox for spacing
                      CustomTextInput(
                        hintText: "Password",
                        controller: _passwordController,
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        onSaved: (value) {},
                      ),
                      SizedBox(height: 15), // Added SizedBox for spacing
                      CustomTextInput(
                        hintText: "Confirm Password",
                        controller: _confirmPasswordController,
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        onSaved: (value) {},
                      ),
                      SizedBox(height: 20), // Added SizedBox for spacing
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Your validation and saving logic here
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Added SizedBox for spacing
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Login.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?"),
                      SizedBox(width: 5), // Added SizedBox for spacing
                      Text(
                        "Login",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
