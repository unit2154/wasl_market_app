import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslOrderWidget.dart';
import 'package:wasl/widgets/waslTextField.dart';

class PreviousOrders_Screen extends StatefulWidget {
  const PreviousOrders_Screen({super.key});

  @override
  State<PreviousOrders_Screen> createState() => _PreviousOrders_ScreenState();
}

class _PreviousOrders_ScreenState extends State<PreviousOrders_Screen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("الطلبات السابقة"),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "بحث",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Wrap(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("الكل"),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: [
                              Icon(Icons.brightness_1, color: Colors.green),
                              SizedBox(width: 5),
                              Text("تامة"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: [
                              Icon(Icons.brightness_1, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text("قيد التجهيز"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: [
                              Icon(Icons.brightness_1, color: Colors.red),
                              SizedBox(width: 5),
                              Text("ملغاة"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              WaslOrderWidget(
                orderStatus: "تامة",
                orderDate: "18 مارس 12:15م",
                orderPrice: "350000",
              ),
              WaslOrderWidget(
                orderStatus: "قيد التجهيز",
                orderDate: "18 مارس 12:15م",
                orderPrice: "350000",
              ),
              WaslOrderWidget(
                orderStatus: "ملغاة",
                orderDate: "18 مارس 12:15م",
                orderPrice: "350000",
              ),
              WaslOrderWidget(
                orderStatus: "ملغاة",
                orderDate: "18 مارس 12:15م",
                orderPrice: "350000",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

