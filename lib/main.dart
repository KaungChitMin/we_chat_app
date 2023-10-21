import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:we_chats/pages/splash_page.dart';

import 'constant/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: 'AIzaSyCYzWLdSsbEQZGl6g1xkd9C_DVaJEStsi0',
            appId: '1:13282614411:android:8b38db48ccfd954342888e',
            messagingSenderId: '13282614411',
            projectId: 'wechatapp-6e418',
            storageBucket: 'wechatapp-6e418.appspot.com',
          )
        : null,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: kWeChatAppName,
        debugShowCheckedModeBanner: false,
        home: SplashPage());
  }
}
