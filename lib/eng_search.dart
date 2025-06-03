import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/main.dart';
import 'package:mobil_uygulama_proje/result.dart';


class EngSearch extends StatefulWidget {
  const EngSearch({super.key});

  @override
  State<EngSearch> createState() => _EngSearchState();
}

class _EngSearchState extends State<EngSearch> {
  String _word = '';
  TextEditingController _controller = TextEditingController();
  String title = 'English Dictionary - Search';

  @override
  Widget build(BuildContext context) {
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
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Search for a word: ",
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
                        (context) => ResultScreen(word: _controller.text),));
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
