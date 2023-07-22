import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pff_flutter_app/utlis.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _image;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void updateInfo() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;

    // You can store the first name and last name wherever you need, for example:
    // Call an API to update the user info, save to a database, etc.

    // Here, we'll just print the values for demonstration purposes:
    print('First Name: $firstName');
    print('Last Name: $lastName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('images/profile.jpg'),
                      ),
                Positioned(
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateInfo,
              child: const Text('Update Info'),
            ),
          ],
        ),
      ),
    );
  }
}
