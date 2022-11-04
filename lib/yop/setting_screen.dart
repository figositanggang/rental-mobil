import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settingProv = Provider.of<SettingScreenProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Dark Mode"),
              trailing: FutureBuilder(
                future: settingProv.readPref(),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Switch(
                      value: snapshot.data,
                      onChanged: (val) {
                        settingProv.savePref(val);
                      },
                    );
                  }
                  return Text("Kosong");
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingScreenProvider extends ChangeNotifier {
  final String key = "isDark";

  bool _value = false;
  bool get getValue => this._value;

  // Write Data
  Future<bool> savePref(val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    this._value = val;
    notifyListeners();

    return await sharedPreferences.setBool(key, val);
  }

  // Read Data
  Future readPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool(key) ?? false;
  }
}
