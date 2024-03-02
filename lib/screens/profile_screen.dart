import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet_wise/screens/profile_settings.dart';

import 'chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ValueNotifier<String> photoURL = ValueNotifier('');
  final databaseRef = FirebaseFirestore.instance.collection('users');

  void fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userData =
            await _firestore.collection('users').doc(user.uid).get();
        setState(() {
          displayName = userData['username'];
        });
      } catch (e) {
        print("Error fetching user data: $e");
      }
    }
  }

  String? displayName;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF392800),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    color: Colors.white,
                    iconSize: 28, // Size of the icon
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_rounded,
                    ),
                    color: Colors.white,
                    iconSize: 28, // Size of the icon
                    onPressed: () {
                      print('Icon Button Pressed!');
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: _updateImage,
                      child: ValueListenableBuilder(
                        valueListenable: photoURL,
                        builder: (context, value, widget) {
                          return Container(
                            height: 122,
                            width: 122,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: value == ''
                                  ? const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 50,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: value,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      displayName ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF392800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFFE9AB17),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFE9AB17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.group_add_rounded,
                              color: Color(0xFF392800),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            "Invite Friends",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: const Color(0xFF6A5931).withOpacity(.35),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileSettings(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFE9AB17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Color(0xFF392800),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: const Color(0xFF6A5931).withOpacity(.35),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        User? user = _auth.currentUser;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              userId: user!.uid,
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFE9AB17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.help,
                              color: Color(0xFF392800),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            "Customer Support",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: const Color(0xFF6A5931).withOpacity(.35),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateImage() {
    ImagePicker picker = ImagePicker();
    late XFile? image;

    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                child: const Text(
                  'Camera',
                  textScaler: TextScaler.noScaling,
                ),
                onPressed: () async {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  image = await picker.pickImage(
                    source: ImageSource.camera,
                  );

                  if (image != null) {
                    File imageFile = File(image!.path);
                    final path = 'profilePics/${image!.name}';

                    final ref = FirebaseStorage.instance.ref().child(path);
                    final uploadTask = ref.putFile(imageFile);

                    final snapshot = await uploadTask.whenComplete(() {});

                    final urlDownload = await snapshot.ref.getDownloadURL();

                    final user = FirebaseAuth.instance.currentUser!;

                    user.updatePhotoURL(urlDownload);
                    photoURL.value = urlDownload;

                    databaseRef.doc(user.uid).update(
                      {
                        'photoUrl': urlDownload,
                      },
                    );
                  }

                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: const Text(
                  'Gallery',
                  textScaler: TextScaler.noScaling,
                ),
                onPressed: () async {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (image != null) {
                    File imageFile = File(image!.path);
                    final path = 'profilePics/${image!.name}';

                    final ref = FirebaseStorage.instance.ref().child(path);
                    final uploadTask = ref.putFile(imageFile);

                    final snapshot = await uploadTask.whenComplete(() {});

                    final urlDownload = await snapshot.ref.getDownloadURL();

                    final user = FirebaseAuth.instance.currentUser!;

                    user.updatePhotoURL(urlDownload);
                    photoURL.value = urlDownload;

                    databaseRef.doc(user.uid).update(
                      {
                        'photoUrl': urlDownload,
                      },
                    );
                  }

                  Navigator.pop(context);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text(
                'Cancel',
                textScaler: TextScaler.noScaling,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                title: const Text(
                  'Camera',
                  textScaler: TextScaler.noScaling,
                ),
                onTap: () async {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  image = await picker.pickImage(
                    source: ImageSource.camera,
                  );

                  if (image != null) {
                    File imageFile = File(image!.path);
                    final path = 'profilePics/${image!.name}';

                    final ref = FirebaseStorage.instance.ref().child(path);
                    final uploadTask = ref.putFile(imageFile);

                    final snapshot = await uploadTask.whenComplete(() {});

                    final urlDownload = await snapshot.ref.getDownloadURL();

                    final user = FirebaseAuth.instance.currentUser!;

                    user.updatePhotoURL(urlDownload);
                    photoURL.value = urlDownload;

                    databaseRef.doc(user.uid).update(
                      {
                        'photoUrl': urlDownload,
                      },
                    );
                  }

                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Gallery',
                  textScaler: TextScaler.noScaling,
                ),
                onTap: () async {
                  Navigator.pop(context);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (image != null) {
                    File imageFile = File(image!.path);
                    final path = 'profilePics/${image!.name}';

                    final ref = FirebaseStorage.instance.ref().child(path);
                    final uploadTask = ref.putFile(imageFile);

                    final snapshot = await uploadTask.whenComplete(() {});

                    final urlDownload = await snapshot.ref.getDownloadURL();

                    final user = FirebaseAuth.instance.currentUser!;

                    user.updatePhotoURL(urlDownload);
                    photoURL.value = urlDownload;

                    databaseRef.doc(user.uid).update(
                      {
                        'photoUrl': urlDownload,
                      },
                    );
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
