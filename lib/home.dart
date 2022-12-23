import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'setting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? uid;
  String? phoneNumber;
  late List<String> upcomingSnacks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: UserCard(phoneNumber!),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber;
  }
}

class UserCard extends StatelessWidget {
  UserCard(this.phoneNumber);

  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [const Icon(Icons.phone), Text(phoneNumber)],
    );
  }
}
