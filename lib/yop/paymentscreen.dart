import 'package:flutter/material.dart';

import '../firebase/analytics_helper.dart';
import '../model/model_rental_mobil.dart';
import 'succes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.data, required this.title})
      : super(key: key);

  final ModelRentalMobil data;
  final String title;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  MyAnalyticsHelper analyticsHelper = MyAnalyticsHelper();
  TextEditingController paymentControler = TextEditingController();
  TextEditingController bankcodeControler = TextEditingController();
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
            Text(widget.title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(30)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
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
                Padding(padding: EdgeInsets.all(10)),
                widget.title.contains("Rent")
                    ? const Text("Payment :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                    : Container(),
                Padding(padding: EdgeInsets.all(10)),
                widget.title.contains("Rent")
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Add Payment",
                          labelText: "Payment",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      )
                    : Container(),
                Padding(padding: EdgeInsets.all(10)),
                const Text("Bank Code:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Add Bank Code",
                      labelText: "Bank Code",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(padding: EdgeInsets.all(30)),
                ElevatedButton(
                    onPressed: () {
                      analyticsHelper.logEvent("user menekan tombol pay");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SuccesScreen(data: widget.data);
                      }));
                    },
                    child: Text("Pay"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
