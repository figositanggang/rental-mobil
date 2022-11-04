import 'package:bangyop/firebase/analytics_helper.dart';
import 'package:bangyop/yop/setting_screen.dart';
import 'package:flutter/material.dart';

import 'userscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  MyAnalyticsHelper analyticsHelper = MyAnalyticsHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 98, 116, 130),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ERC Rent",
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Icon(
              Icons.car_rental,
              color: Colors.orange,
              size: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    analyticsHelper.logEvent(
                      name: "click",
                      val: "User mengklik tombol user",
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const UserScreen(
                              type: true, title: "ERC Rent");
                        },
                      ),
                    );
                  },
                  child: Text(
                    "User",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const UserScreen(type: false, title: "ERC");
                    }));
                  },
                  child: Text(
                    "Owner",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingScreen(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.settings),
        backgroundColor: Colors.red,
      ), // This trailin,
    );
  }
}
