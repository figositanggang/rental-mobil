import 'package:flutter/material.dart';

import '../model/model_rental_mobil.dart';
import 'homescreen.dart';

class SuccesScreen extends StatefulWidget {
  const SuccesScreen({Key? key, required this.data}) : super(key: key);

  final ModelRentalMobil data;

  @override
  State<SuccesScreen> createState() => _SuccesScreenState();
}

class _SuccesScreenState extends State<SuccesScreen> {
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
      // backgroundColor: Color.fromARGB(255, 115, 115, 115),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Payment Succesfully",
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                children: [
                  Image(
                    width: 220,
                    image: NetworkImage(
                      widget.data.image!,
                    ),
                  ),
                  Column(
                    children: [
                      Text(widget.data.name!,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text(
                        widget.data.firstPrice!,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.data.secondPrice!,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(50)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Homescreen();
                  }));
                },
                child: Text("Menu",
                    style: TextStyle(
                      fontSize: 20,
                    ))),
          ],
        ),
      ),
    );
  }
}
