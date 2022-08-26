import 'dart:typed_data';

import 'package:chat_app/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'dart:developer';
// import 'dart:io';

import 'package:image_cropper/image_cropper.dart';

class CompleteProfile extends StatefulWidget {
  final UserModel? userModel;
  final User? firebaseUser;

  const CompleteProfile({Key? key, this.userModel, this.firebaseUser})
      : super(key: key);
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController fullNameController = TextEditingController();
  void selectImage(ImageSource source) async {
    // XFile? pickedFile = await ImagePicker().pickImage(source: source);
    final ImagePicker _imagePicker = ImagePicker();
    // _file = await _imagePicker.pickImage(source: source);
    XFile? pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  Uint8List? imageFile;
  void cropImage(XFile file) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 20);
    if (croppedImage != null) {
      var im = await croppedImage.readAsBytes();
      setState(() {
        imageFile = im;
      });
    }
  }

  uploadData() async {
    Get.snackbar("Uploading image..", "");

    UploadTask uploadTask = FirebaseStorage.instance
        .ref("profilepictures")
        .child(widget.userModel!.uid.toString())
        .putData(imageFile!);

    TaskSnapshot snapshot = await uploadTask;

    String? imageUrl = await snapshot.ref.getDownloadURL();
    String? fullname = fullNameController.text.trim();
    widget.userModel!.fullname = fullname;
    widget.userModel!.profilepic = imageUrl;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userModel!.uid)
        .set(widget.userModel!.toMap());
  }

  void checkValues() {
    String fullname = fullNameController.text.trim();

    if (fullname == "" || imageFile == null) {
      print("Please fill all the fields");
      Get.snackbar("Incomplete Data",
          "Please fill all the fields and upload a profile picture");
    } else {
      Get.snackbar("Uploading data..", "");
      uploadData();
    }
  }

  void showPhotoOptions() {
    Get.defaultDialog(
        title: "Upload Profile Picture",
        content: Column(
          children: [
            ListTile(
              onTap: () {
                Get.back();
                selectImage(ImageSource.gallery);
              },
              leading: Icon(Icons.photo_album),
              title: Text("Select from Gallery"),
            ),
            ListTile(
              onTap: () {
                Get.back();
                selectImage(ImageSource.camera);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Take a photo"),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Complete Profile"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  showPhotoOptions();
                },
                padding: EdgeInsets.all(0),
                child: CircleAvatar(
                  radius: 60,
                  // backgroundImage:
                  //     (imageFile != null) ? FileImage(imageFile!) : null,
                  child: (imageFile != null)
                      ? Image.memory(imageFile!)
                      : Icon(
                          Icons.person,
                          size: 60,
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  checkValues();
                },
                color: Theme.of(context).colorScheme.secondary,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
