import 'package:flutter/material.dart';
import 'package:wasl/shop/productOffers.dart';
import 'package:wasl/shop/shopProducts.dart';

import '../widgets/waslOfferCard.dart';
import 'cart.dart';
import 'dashboard.dart';
import 'orders.dart';

class Offers extends StatefulWidget {
  Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int currentIndex = 1;

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
          title: Text("العروض"),
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
            WaslOfferCard(
              offerLogo: "assets/images/pringls_logo.png",
              offerText: "خصم على جميع النكهات لاتفوت الفرصة!",
              offerValue: "20%",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOffers()));
              },
            ),
            WaslOfferCard(
              offerLogo: "assets/images/pepsi_logo.png",
              offerText: "خصم على جميع النكهات لاتفوت الفرصة!",
              offerValue: "40%",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOffers()));
              },
            ),
          ],
        ),
      )
    );
  }
}
