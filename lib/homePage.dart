import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  double valu = 0;
  List l1 = [
    {'id': '1', 'name': 'Watch', 'price': '3200', 'category': 'wearable'},
    {'id': '2', 'name': 'T-Shirt', 'price': '520', 'category': 'wearable'},
    {'id': '3', 'name': 'Jeans', 'price': '1000', 'category': 'wearable'},
    {'id': '4', 'name': 'Shirt', 'price': '500', 'category': 'wearable'},
    {'id': '5', 'name': 'Followers port', 'price': '265', 'category': 'decoration'},
    {'id': '6', 'name': 'USB hub', 'price': '740', 'category': 'accessories'},
    {'id': '7', 'name': 'Smart speaker', 'price': '1200', 'category': 'accessories '},
    {'id': '8', 'name': 'Fire TV Stick', 'price': '1500', 'category': 'accessories '},
    {'id': '9', 'name': 'Laptop Bag', 'price': '1090', 'category': 'accessories '},
    {'id': '10', 'name': 'Leather Wallet', 'price': '750', 'category': 'accessories '},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Products Filter",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Slider(
                  max: 3500,
                  divisions: 20,
                  onChanged: (double a) {
                    setState(() {
                      valu = a;
                    });
                  },
                  value: valu,
                  activeColor: Colors.blue.shade900,
                ),
                Text(
                  "All Products < Rs. ${valu.toInt()}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Column(
                  children: l1.map((e) {
                    if (double.parse(e['price']) < valu) {
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 2,offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text(e['id'])],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 0)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text(e['name']), Text(e['category'])],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(e['price']),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}