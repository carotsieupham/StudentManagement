import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  Future<void> signIn(String email, String pass, Function onSuccess,
      Function(String) onError) async {
    _fireAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((userCredential) {
      print('Login success');
      onSuccess();
    }).catchError((error) {
      onError('Email hoặc mật khẩu không đúng');
    });
  }
}
