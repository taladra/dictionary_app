import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/main.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/sign_up.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    String title = 'Home Page';
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: DrawerMenu(),
      body: Padding(
          padding: EdgeInsets.all(130),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                child:
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp())
                    );
                  },
                  child: Text("Sign Up", textAlign: TextAlign.center,),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 150,
                height: 150,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login())
                    );
                  },
                  child: Text("Log In"),
                ),
              ),
            ],
          )
      ),
    );
  }
}