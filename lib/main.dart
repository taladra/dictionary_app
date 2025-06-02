import 'package:flutter/material.dart';
import 'package:mobil_uygulama_proje/eng_search.dart';
import 'package:mobil_uygulama_proje/language.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/tur_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> const HomePage(),
        '/login':(context)=> const Login(),
        '/selectLang':(context)=> const SelectLanguage(),
        '/engSearch':(context)=> const EngSearch(),
        '/turSearch':(context)=> const TurSearch(),
        '/settings':(context)=> const SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return const BasePage(title: 'Ana Sayfa', content: 'Ana Sayfa');
  }
}

class BasePage extends StatelessWidget{
  final String title;
  final String content;

  const BasePage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: const DrawerMenu(),
      body: Center(child: Text(content))
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(title),
      actions:[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap:()=> Navigator.pushNamed(context, '/settings'),
            child: Image.asset(
              'assets/logo.png',
              height: 30,
            ),
          ),
        ),
      ],
    );
  }

  //@override
  //Size get prefferedSize => Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement preferredSize
  Size get preferredSize{
    return Size.fromHeight(kToolbarHeight);
  }

}

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({super.key});

  void_navigate(BuildContext context, String route){
    Navigator.pop(context);
    if(ModalRoute.of(context)?.settings.name != route){
      Navigator.pushReplacementNamed(context, route);
    }
  }
  void_logout(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Exit'),
          content: const Text('Are you sure you want to exit?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (route)=>false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Application exited')),
                );
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget> [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            accountName: const Text('Tasneem Aladra'),
            accountEmail: const Text('tasneem.aladra@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.looks_one),
            title: const Text('Login Page'),
            onTap:() => void_navigate(context,'/login')
          ),
          ListTile(
              leading: const Icon(Icons.looks_two),
              title: const Text('Language Selection'),
              onTap:() => void_navigate(context,'/selectLang')
          ),
          ListTile(
              leading: const Icon(Icons.looks_3),
              title: const Text('English Search'),
              onTap:() => void_navigate(context,'/engSearch')
          ),
          ListTile(
              leading: const Icon(Icons.looks_4),
              title: const Text('Türkçe Arama'),
              onTap:() => void_navigate(context,'/turSearch')
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap:() => void_navigate(context,'/settings')
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap:() => void_logout(context),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget{
  const Page1({super.key});
  @override
  Widget build(BuildContext context){
    return const BasePage(title:'Sayfa1', content: 'Sayfa1 içeriği');
  }
}

class Page2 extends StatelessWidget{
  const Page2({super.key});
  @override
  Widget build(BuildContext context){
    return const BasePage(title:'Sayfa2', content: 'Sayfa2 içeriği');
  }
}

class Page3 extends StatelessWidget{
  const Page3({super.key});
  @override
  Widget build(BuildContext context){
    return const BasePage(title:'Sayfa3', content: 'Sayfa3 içeriği');
  }
}

class Page4 extends StatelessWidget{
  const Page4({super.key});
  @override
  Widget build(BuildContext context){
    return const BasePage(title:'Sayfa4', content: 'Sayfa4 içeriği');
  }
}

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context){
    return const BasePage(title:'Settings', content: 'Ayarlar içeriği');
  }
}
