import 'package:flutter/material.dart';
import 'package:fraymobile/provider/auth_service.dart';
import 'package:fraymobile/screens/loginPage.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: Container(
          color: Color.fromARGB(255, 30, 30, 45),
          padding: EdgeInsets.all(8),
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(
                    "images/icon.png",
                    fit: BoxFit.fitHeight,
                  )),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Anasayfa",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Profilim",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Favoriler",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Firmalar",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_alt,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Filtreleme",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ballot,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Puanlama",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.compare_arrows,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Kıyaslama",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.av_timer_outlined,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Açıklanma Zamanları",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 24,
                      ),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      TextButton(
                          onPressed: () async {
                            AuthService.removeToken();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          child: Text(
                            "Çıkış",
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
