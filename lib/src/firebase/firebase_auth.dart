import 'package:firebase_auth/firebase_auth.dart';


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
