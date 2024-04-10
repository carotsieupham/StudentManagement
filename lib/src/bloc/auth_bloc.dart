import 'dart:async';

import 'package:student_manage/src/firebase/firebase_auth.dart';


class AuthBloc {
  final _fireAuth = FireAuth();
  
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passStream => _passwordController.stream;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

  void signIn(
      String email, String pass, Function onSuccess, Function(String) onError) {
        _fireAuth.signIn(email, pass, onSuccess,onError);
      }
}
