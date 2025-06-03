import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/github_sign_in.dart';
import 'package:mobil_uygulama_proje/google_sign_in.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    String title = 'Sign Up';
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: DrawerMenu(),
      body: Padding(
        padding: EdgeInsets.all(70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 70,
                  color: Colors.indigo,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => GoogleSignUpPage()));
                  },
                  child: Text('Sign In with Google',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Material(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 70,
                  color: Colors.indigo,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => GitHubSignUpPage()));
                  },
                  child: Text('Sign In with GitHub',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Material(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 70,
                  color: Colors.indigo,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => Login()));
                  },
                  child: Text('Sign In with Email',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
