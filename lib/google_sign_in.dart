import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobil_uygulama_proje/main.dart';

class GoogleSignUpPage extends StatefulWidget {
  @override
  _GoogleSignUpPageState createState() => _GoogleSignUpPageState();
}

class _GoogleSignUpPageState extends State<GoogleSignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        print('Successfully signed in: ${user.displayName}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in as ${user.displayName}')),
        );
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = "Google Sign-Up";
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: DrawerMenu(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: signInWithGoogle,
          icon: Icon(Icons.login),
          label: Text("Sign Up with Google"),
        ),
      ),
    );
  }
}
