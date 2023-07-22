import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pff_flutter_app/constants.dart';
import 'package:pff_flutter_app/home.dart';

class Verifyscreen extends StatefulWidget {
  const Verifyscreen({Key? key}) : super(key: key);

  @override
  State<Verifyscreen> createState() => _VerifyscreenState();
}

class _VerifyscreenState extends State<Verifyscreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified(context);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: background,
      body: Center(child: Text('An Email Has Been Sent TO You !!!')),
    );
  }
}

Future<void> checkEmailVerified(BuildContext context) async {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  await user?.reload();
  if (user?.emailVerified == true) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
}
