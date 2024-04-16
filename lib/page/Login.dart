import 'package:flutter/material.dart';
import 'package:monkeydosomething/const/colors.dart';
import 'package:monkeydosomething/const/firestone.dart';
import 'package:monkeydosomething/page/Menu.dart';
import '../utils/helper.dart';
import '../widgets/CustomTextInput.dart';
import '../page/SignUp.dart';
import '../page/Home.dart';


class Login extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirestoreService _firestoreService = FirestoreService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Text('Add your details to login'),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Your email"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    await _firestoreService.saveLoginToDatabase(
                      _emailController.text,
                      _passwordController.text,
                    );
                    // Navigate to Home after successful login
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  }
                },
                child: Text("Login"),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Handle forget password action
                },
                child: Text("Forget Your password?"),
              ),
              SizedBox(height: 20),
              Text("or Login with"),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF367FC0)),
                onPressed: () {
                  // Handle Facebook login
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Helper.getAssetName("fb.png", "virtual"),
                    ),
                    SizedBox(width: 30),
                    Text("Login with Facebook"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFDD4B39)),
                onPressed: () {
                  // Handle Google login
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Helper.getAssetName("google.png", "virtual"),
                    ),
                    SizedBox(width: 30),
                    Text("Login with Google"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SignUp.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account?"),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
