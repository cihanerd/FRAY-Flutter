import 'package:flutter/material.dart';
import 'package:fraymobile/theme/change_theme_button_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Karanlık Mod",
                    style: TextStyle(fontSize: 18),
                  ),
                  ChangeThemeButtonWidget()
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
