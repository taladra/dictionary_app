import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mobil_uygulama_proje/main.dart';

class GitHubSignUpPage extends StatefulWidget {
  @override
  _GitHubSignUpPageState createState() => _GitHubSignUpPageState();
}

class _GitHubSignUpPageState extends State<GitHubSignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGitHub() async {
    try {
      final clientId = 'YOUR_GITHUB_CLIENT_ID';
      final redirectUri = 'myapp://auth';
      final authUrl =
          'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&scope=read:user';

      final result = await FlutterWebAuth.authenticate(
          url: authUrl, callbackUrlScheme: 'myapp');

      final code = Uri.parse(result).queryParameters['code'];

      // Call your backend to exchange code for Firebase token
      final response = await http.get(Uri.parse('https://your-backend.com/auth/github?code=$code'));

      final firebaseToken = json.decode(response.body)['token'];

      final userCredential = await _auth.signInWithCustomToken(firebaseToken);

      final user = userCredential.user;

      if (user != null) {
        print("Signed in as ${user.uid}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in as ${user.uid}')),
        );
      }
    } catch (e) {
      print("GitHub Sign-In failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = "GitHub Sign-Up";
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: DrawerMenu(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: signInWithGitHub,
          icon: Icon(Icons.login),
          label: Text("Sign Up with GitHub"),
        ),
      ),
    );
  }
}