import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobil_uygulama_proje/eng_search.dart';
import 'package:mobil_uygulama_proje/language.dart';
import 'package:mobil_uygulama_proje/login.dart';
import 'package:mobil_uygulama_proje/tur_search.dart';
import 'package:mobil_uygulama_proje/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyBrzlFmz7wPcMPJwPeI3Vazn0FnhziAxms",
        authDomain: "dictionary-dc213.firebaseapp.com",
        projectId: "dictionary-dc213",
        storageBucket: "dictionary-dc213.firebasestorage.app",
        messagingSenderId: "960079195908",
        appId: "1:960079195908:web:531fa228b4e335bbd72a51"
    ));
  }
  else{
    await Firebase.initializeApp();
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hixjacbdfzrunsjffzth.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhpeGphY2JkZnpydW5zamZmenRoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5MjU4NzEsImV4cCI6MjA2NDUwMTg3MX0.R3SjKc9_YueWShTy91GC1Wz2A6cM9NK0GGfHFfs_AoE',
  );

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
        '/':(context)=> HomePage(),
        '/home':(context)=> HomePage(),
        '/selectLang':(context)=> const SelectLanguage(),
        '/engSearch':(context)=> const EngSearch(),
        '/turSearch':(context)=> const TurSearch(),
        '/settings':(context)=> const SettingsPage(),
        '/profile':(context)=> const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

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
      backgroundColor: Colors.deepOrangeAccent,
      actions:[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap:()=> Navigator.pushNamed(context, '/settings'),
            child: Image.asset(
              'assets/images/logo.png',
              height: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
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
              color: Colors.deepOrangeAccent,
            ),
            accountName: const Text('Tasneem Aladra'),
            accountEmail: const Text('tasneem.aladra@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.looks_one),
            title: const Text('Home Page'),
            onTap:() => void_navigate(context,'/home')
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

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final supabase = Supabase.instance.client;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = supabase.auth.currentUser;
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', user!.id)
        .single();

    final data = response;

    if (data != null) {
      _nameController.text = data['name'] ?? '';
      _emailController.text = data['email'] ?? '';
      _phoneController.text = data['phone'] ?? '';
      _addressController.text = data['address'] ?? '';
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _updateProfile() async {
    final user = supabase.auth.currentUser;

    final updates = {
      'id': user!.id,
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'address': _addressController.text,
    };

    await supabase.from('profiles').upsert(updates);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
              radius: 40,
            ),
            const SizedBox(height: 16),
            _buildField("Name", _nameController),
            _buildField("Email", _emailController),
            _buildField("Phone", _phoneController),
            _buildField("Address", _addressController),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _loadProfile(),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _updateProfile,
                  child: const Text("Save Update"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFF00BF6D).withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class UserInfoEditField extends StatelessWidget {
  const UserInfoEditField({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0 / 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(text),
          ),
          Expanded(
            flex: 3,
            child: child,
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget{
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;
  String title = 'Settings';
  @override
  Widget build(BuildContext context){
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        drawer: DrawerMenu(),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SingleSection(
                  title: "General",
                  children: [
                    _CustomListTile(
                      title: "Dark Mode",
                      icon: Icons.dark_mode_outlined,
                      trailing: Switch(
                        value: _isDark,
                        onChanged: (value) {
                          setState(() {
                            _isDark = value;
                          });
                        },
                      ),
                    ),
                    const _CustomListTile(
                      title: "Notifications",
                      icon: Icons.notifications_none_rounded,
                    ),
                    const _CustomListTile(
                      title: "Security Status",
                      icon: CupertinoIcons.lock_shield,
                    ),
                  ],
                ),
                const Divider(),
                _SingleSection(
                  title: "Organization",
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outline_rounded),
                      title: const Text('Profile'),
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage())
                        );
                      }
                    ),
                  ],
                ),
                const Divider(),
                const _SingleSection(
                  children: [
                    _CustomListTile(
                      title: "Help & Feedback",
                      icon: Icons.help_outline_rounded,
                    ),
                    _CustomListTile(
                      title: "About",
                      icon: Icons.info_outline_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile({
    required this.title,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(children: children),
      ],
    );
  }
}
