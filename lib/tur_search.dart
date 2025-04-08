import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/language.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/eng_search.dart';

class TurSearch extends StatefulWidget {
  const TurSearch({super.key});

  @override
  State<TurSearch> createState() => _TurSearchState();
}

class _TurSearchState extends State<TurSearch> {
  String _kelime = '';

  TextEditingController _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Türkçe Sözlük - Arama',
            style: TextStyle(
                color: Colors.white
            ),),
        ),
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
      body: Padding(
          padding: EdgeInsets.all(70),
          child: TextField(
            controller: _controller1,
            decoration: InputDecoration(
                hintText: "Bir kelime arayın: ",
                border: OutlineInputBorder()
            ),
          )
      ),
    );
  }
}
