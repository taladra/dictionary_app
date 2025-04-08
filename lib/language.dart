import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/eng_search.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/tur_search.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
            'Langauge Selection / Dil Seçimi',
              style: TextStyle(color: Colors.white),
        ),
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
                      MaterialPageRoute(builder: (context) => Login())
                  );
                },
              ),
              ListTile(
                title: const Text('Language Selection'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectLanguage())
                  );
                },
              ),
              ListTile(
                title: const Text('English Dictionary'),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EngSearch())
                  );
                },
              ),
              ListTile(
                title: const Text('Türkçe Sözlük'),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TurSearch())
                  );
                },
              )
            ],
          ),
        ),
      body: Padding(
          padding: EdgeInsets.all(130),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                //child: Image(image: AssetImage('images\eng_dict.png')),
                child:
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EngSearch())
                      );
                    },
                    child: Text("English Dictionary", textAlign: TextAlign.center,),
                  ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 150,
                height: 150,
                //child: Image(image: AssetImage('images\tur_dict.png')),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TurSearch())
                    );
                  },
                  child: Text("Türkçe Sözlük"),
                ),
              ),
            ],
          )
      )
    );
  }
}
