import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/model_rental_mobil.dart';
import 'paymentscreen.dart';

class Homescreen extends StatefulWidget {
  final bool type;
  final String title;

  const Homescreen({Key? key, this.type = false, this.title = "ERC"})
      : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<ModelRentalMobil> datas = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllRentalMobil(widget.type);
    super.initState();
  }

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
            const Text("Choose your preferred car",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: datas.map(
                (data) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Image(
                          width: 220,
                          image: NetworkImage(
                            data.image!,
                          ),
                        ),
                        Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PaymentScreen(
                                            data: data, title: widget.title);
                                      },
                                    ),
                                  );
                                },
                                child: Text(data.name!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                            Text(
                              data.firstPrice!,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.secondPrice!,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getAllRentalMobil(type) async {
    print(db.insertDummyData());
    var list = await db.getAllRentalMobil(!type);
    setState(() {
      datas.clear();
      list!.forEach((mobil) {
        datas.add(ModelRentalMobil.fromMap(mobil));
      });
    });
  }
}
