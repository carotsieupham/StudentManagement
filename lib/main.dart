import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_manage/firebase_options.dart';
import 'package:student_manage/src/app.dart';
import 'package:student_manage/src/bloc/auth_bloc.dart';
import 'package:student_manage/src/modules/loginPage/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
      AuthBloc(),
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      )));
}
