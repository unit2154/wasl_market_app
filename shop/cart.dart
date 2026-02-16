import 'package:flutter/material.dart';
import 'package:wasl/shop/order.dart';
import 'package:wasl/shop/shopProducts.dart';
import 'package:wasl/widgets/waslButton.dart';
import 'package:wasl/widgets/waslCartItem.dart';

import 'dashboard.dart';
import 'offers.dart';
import 'orders.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _count = 1;

  int currentIndex = 4;

  List<Widget> page = [
    Center(child: Text("طلبات")),
    Center(child: Text("عروض")),
    Center(child: Text("الرئيسية")),
    Center(child: Text("البضاعة")),
    Center(child: Text("السلة")),
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
            title: Text("سلة التسوق")
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

        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(20),
              children: [
                WaslCartItem(),
                WaslCartItem(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
              ],
            ),
            Positioned(
              bottom: 5,
              left: 0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Column(
                  spacing: 10,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFEFEFE),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: const Color(0xFF199F59),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.width * 0.06,
                              child: Image.asset("assets/images/coins.png", fit: BoxFit.fill,)
                            ),
                            Text("السعر الكلي", style: TextStyle(
                              color: const Color(0xFF199F59),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                            Spacer(),
                            Text("500,000 IQD", style: TextStyle(
                              color: const Color(0xFF199F59),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))
                          ],
                        ),
                      ),
                    ),
                    WaslButton(text: "اتمام الطلب", onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Order()));
                    })
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
