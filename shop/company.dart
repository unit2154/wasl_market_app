import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslCompanyCard.dart';
import 'package:wasl/widgets/waslProductCard.dart';

class Company extends StatefulWidget {
  const Company({super.key});

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.355,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: double.infinity,
                  height: 100,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.24,
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/images/pepsi_cover.png",
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/images/pepsi_logo.png",
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width * 0.184,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            color: Colors.black.withAlpha(0),
                          ),
                        ],
                      ),
                      Positioned(
                        top: (MediaQuery.of(context).size.height * 0.2),
                        right: MediaQuery.of(context).size.width * 0.1,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8 + 2,
                          height: MediaQuery.of(context).size.height * 0.155 + 2,
                          decoration: ShapeDecoration(
                            color: Color(0xffF5F7FA),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFFE2E2E2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.0775,
                                child: Center(
                                  child: Text(
                                    "شركة بغداد للمشروبات الغازية",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.0775,
                                    decoration: ShapeDecoration(
                                      shape: Border(
                                        top: BorderSide(color: Colors.grey),
                                        left: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("وقت التوصيل"),
                                          SizedBox(height: 5,),
                                          Text("24 - 48 ساعة", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                        ],
                                      )
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height * 0.0775,
                                    decoration: ShapeDecoration(
                                      shape: Border(
                                        top: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("التصنيف"),
                                          SizedBox(height: 5,),
                                          Text("محلية", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.red)
                      ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.red,),
                        SizedBox(width: 10,),
                        Text("خصومات تصل الى ٢٠٪ لغاية نهاية الشهر", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              )
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                child: Text("منتجات الشركة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Wrap(
                  children: [
                    WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                    WaslProductCard(hasOffer: true, price: 1500, offer: 20,),
                    WaslProductCard(hasOffer: false, price: 1500, offer: 20,),
                    WaslProductCard(hasOffer: false, price: 1500, offer: 20,),
                    WaslProductCard(hasOffer: false, price: 1500, offer: 20,),

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30,),
            )
          ],
        ),
      ),
    );
  }
}
