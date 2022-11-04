import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'loginscreen.dart';

class UserScreen extends StatefulWidget {
  final bool type;
  final String title;
  const UserScreen({Key? key, required this.type, required this.title})
      : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController locationControler = TextEditingController();
  TextEditingController cartypeControler = TextEditingController();
  TextEditingController unitControler = TextEditingController();

  bool? islocationEmpty;
  bool? iscartypeEmpty;
  bool? isunitEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.chat),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.notifications_none_rounded),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.cabin_outlined)
        ],
      ),
      backgroundColor: Color.fromARGB(255, 115, 115, 115),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Text(
              widget.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(30)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.all(10)),
                const Text("Location :",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Add Location",
                      labelText: "Location",
                      errorText: islocationEmpty == true
                          ? 'Location tidak boleh kosong'
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(widget.type ? "Car Type :" : "Full Name",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  decoration: InputDecoration(
                      hintText: widget.type ? "Add Car type" : "Full Name",
                      labelText: widget.type ? "Car type" : "Full Name",
                      errorText: iscartypeEmpty == true
                          ? widget.type
                              ? 'Car type tidak boleh kosong'
                              : 'Full Name tidak boleh kosong'
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                const Text("Unit :",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Add Unit",
                    labelText: "Unit",
                    errorText:
                        isunitEmpty == true ? 'Unit tidak boleh kosong' : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Loginscreen();
                              },
                            ),
                          );
                        },
                        child: Text("Back")),
                    Padding(padding: EdgeInsets.all(15)),
                    ElevatedButton(
                      onPressed: () {
                        if (locationControler.text.isEmpty)
                          setState(() {
                            islocationEmpty = true;
                          });
                        else {
                          setState(() {
                            islocationEmpty = false;
                          });
                        }
                        if (cartypeControler.text.isEmpty)
                          setState(() {
                            iscartypeEmpty = true;
                          });
                        else {
                          setState(() {
                            iscartypeEmpty = false;
                          });
                        }
                        if (unitControler.text.isEmpty)
                          setState(() {
                            isunitEmpty = true;
                          });
                        else {
                          setState(() {
                            isunitEmpty = false;
                          });
                        }
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Homescreen(
                              type: widget.type, title: widget.title);
                        }));
                      },
                      child: Text("Seacrh"),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
