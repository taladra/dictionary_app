import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/main.dart';
import 'package:mobil_uygulama_proje/result.dart';

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
    String title = 'Türkçe Sözlük - Arama';
    return Scaffold(
        appBar: CustomAppBar(title: title),
        drawer: DrawerMenu(),
      body: Padding(
          padding: EdgeInsets.all(70),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/eng_dict.png",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height/3.5,
                ),
                SizedBox(height: 50),
                TextField(
                  controller: _controller1,
                  decoration: InputDecoration(
                    hintText: "Kelime arayın: ",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 50),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: Colors.indigo,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context) => ResultScreen(word: _controller1.text),));
                    },
                    child: Text('Search',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
