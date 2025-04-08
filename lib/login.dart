import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/language.dart';
import 'package:mobil_uygulama_proje/eng_search.dart';
import 'package:mobil_uygulama_proje/tur_search.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _username = '';
  final _userControl = TextEditingController();
  final _password = '';
  final _passControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Login',
          style: TextStyle(
            color: Colors.white),),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Login Page'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()));},),
            ListTile(
              title: const Text('Language Selection'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectLanguage()));},),
            ListTile(
              title: const Text('English Dictionary'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EngSearch()));},),
            ListTile(
              title: const Text('Türkçe Sözlük'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TurSearch()));},)
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _userControl,
                decoration: InputDecoration(
                  labelText: 'Username:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),),),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                obscureText: true,
                controller: _passControl,
                decoration: InputDecoration(
                  labelText: 'Password:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),),),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectLanguage())
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}