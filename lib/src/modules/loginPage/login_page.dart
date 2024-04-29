import 'package:flutter/material.dart';
import 'package:student_manage/src/app.dart';

import 'package:student_manage/src/dialog/loading_dialog.dart';
import 'package:student_manage/src/dialog/msg_dialog.dart';
import 'package:student_manage/src/modules/homePage/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _oncSignInClick() {
      String email = _emailController.text;
      String password = _passwordController.text;
      var authBloc = MyApp.of(context).authBloc;
      LoadingDialog.showLoadingDialog(context, 'Loading...');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        authBloc.signIn(email, password, () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }, (msg) {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, 'Sign-In', msg);
        });
      });
    }

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              Image.asset('assets/image/logo_uth.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Color(0xffCED8D2), fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffCED8D2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                style: const TextStyle(fontSize: 18),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  labelStyle:
                      TextStyle(color: Color(0xffCED8D2), fontSize: 15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffCED8D2),
                      width: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: _oncSignInClick,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
