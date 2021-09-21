import 'package:flutter/material.dart';
import 'package:fraymobile/screens/drawer.dart';
import 'package:fraymobile/screens/favoritesPage.dart';
import 'package:fraymobile/screens/loginPage.dart';
import 'package:fraymobile/screens/newsPage.dart';
import 'package:fraymobile/screens/searchPage.dart';
import 'package:fraymobile/screens/settingsPage.dart';
import 'package:fraymobile/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'screens/landingPage.dart';

void main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'F-Ray Mobile App',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: Login(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = new PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: Icon(Icons.search))
        ],
        centerTitle: true,
        toolbarHeight: kToolbarHeight + 10,
        title: Container(
          height: kToolbarHeight - 10,
          child: Image.asset(
            "images/icon.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        children: [LandingPage(), FavoritesPage(), NewsPage(), Settings()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoriler"),
          BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined), label: "Haberler"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            controller.animateToPage(value,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
