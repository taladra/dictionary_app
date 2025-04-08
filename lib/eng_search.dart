import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/language.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/tur_search.dart';

class EngSearch extends StatefulWidget {
  const EngSearch({super.key});

  @override
  State<EngSearch> createState() => _EngSearchState();
}

class _EngSearchState extends State<EngSearch> {
  String _word = '';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('English Dictionary - Search',
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
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Search for a word: ",
            border: OutlineInputBorder()
          ),
        )
      ),
    );
  }
}
