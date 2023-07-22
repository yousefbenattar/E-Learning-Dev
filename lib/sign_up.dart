import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pff_flutter_app/screens/verify.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E Learning Dev'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyImageCard(),
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(
                      20.0), // Set the desired border radius here
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 25),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(
                      20.0), // Set the desired border radius here
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black12, fontSize: 25),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            SizedBox(
              height: 75,
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()).then((_){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const Verifyscreen()));
                });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Set the desired border radius here
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class MyImageCard extends StatelessWidget {
  const MyImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Controls the shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // You can customize the image's properties here
          Image.asset(
            'images/icon.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover, // You can adjust the image fit as needed
          ),
        ],
      ),
    );
  }
}
