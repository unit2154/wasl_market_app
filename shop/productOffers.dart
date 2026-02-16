import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslProductCard.dart';

class ProductOffers extends StatefulWidget {
  const ProductOffers({super.key});

  @override
  State<ProductOffers> createState() => _ProductOffersState();
}

class _ProductOffersState extends State<ProductOffers> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("العروض"),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: ListView(
          children: [
            Center(
              child: Wrap(
                children: [
                  WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                  WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                  WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                  WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                  WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
