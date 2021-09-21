import 'package:flutter/material.dart';
import 'package:fraymobile/main.dart';
import 'package:fraymobile/provider/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService auth = new AuthService();
  TextEditingController username = TextEditingController.fromValue(
      TextEditingValue(text: "erdogan.cihan@outlook.com"));
  TextEditingController password =
      TextEditingController.fromValue(TextEditingValue(text: ""));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Form(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "images/icon.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                TextField(
                  controller: username,
                  decoration: InputDecoration(hintText: "E-posta"),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(hintText: "Şifre"),
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                TextButton(
                    onPressed: () async {
                      await auth
                          .login(username.text, password.text)
                          .then((value) {
                        if (value == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                    Text("Geçersiz kullanıcı adı veya şifre"),
                              );
                            },
                          );
                        }
                      });
                    },
                    child: Text("Giriş Yap")),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
