import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslProductCard.dart';

import 'cart.dart';
import 'dashboard.dart';
import 'offers.dart';
import 'orders.dart';

class ShopProducts extends StatefulWidget {


  ShopProducts({super.key});

  @override
  State<ShopProducts> createState() => _ShopProductsState();
}

class _ShopProductsState extends State<ShopProducts> {
  int currentIndex = 3;

  List<Widget> page = [
    Center(child: Text("طلبات"),),
    Center(child: Text("عروض"),),
    Center(child: Text("الرئيسية"),),
    Center(child: Text("البضاعة"),),
    Center(child: Text("السلة"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Text("البضاعة"),
          ),

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: "الطلبات",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: "العروض",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "الرئيسية",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: "البضاعة",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "السلة",
              ),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                switch (index) {
                  case 0:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
                    break;
                  case 1:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()));
                    break;
                  case 2:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    break;
                  case 3:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShopProducts()));
                    break;
                  case 4:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                    break;
                }
              });
            },
            selectedItemColor: Color(0xFF000B5B),
            unselectedItemColor: Colors.grey,
          ),

          body: ListView(
            children: [
              Center(
                child: Wrap(
                  children: [
                    WaslProductCard(price: 1500, hasOffer: false),
                    WaslProductCard(price: 1500, hasOffer: false),
                    WaslProductCard(price: 1500, hasOffer: false),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
