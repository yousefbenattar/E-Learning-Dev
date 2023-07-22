import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pff_flutter_app/Profile.dart';
import 'package:pff_flutter_app/login_page.dart';

class navbar extends StatelessWidget {
  const navbar({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        GestureDetector(
          onTap: () {
            // This is where you can handle the navigation to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          },
          child: UserAccountsDrawerHeader(
            accountName: const Text(''),
            accountEmail: const Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/profile.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('images/fsk.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
     /*   ListTile(
          leading: const Icon(Icons.file_upload),
          title: const Text('Upload Shot'),
          onTap: () => print('Upload Tapped'),
        ),*/
       /* ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: () {/*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
         */ },
        ),*/
      /*  ListTile(
          leading: const Icon(Icons.line_axis),
          title: const Text('State'),
          onTap: () => print('State Tapped'),
        ),*/
        ListTile(
          leading: const Icon(Icons.share_outlined),
          title: const Text('Share'),
          onTap: () { /*
            Share.share(
              'https://play.google.com/store/apps/details?id=com.adobe.reader',
              subject:
                  'Check out this awesome app! Download it from the Play Store/App Store',
            );
         */ },
        ),
        const Divider(),
    /*    ListTile(
          leading: const Icon(Icons.contact_page),
          title: const Text('Contact Us'),
          onTap: () => print('Message Tapped'),
        ),*/
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
          },
        ),
      ]),
    );
  }
}
