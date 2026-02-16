import 'package:flutter/material.dart';
import 'package:wasl/shop/productRequest.dart';
import 'package:wasl/widgets/waslCompanyCard.dart';
import 'package:wasl/widgets/waslSearchItem.dart';

import 'company.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  FocusNode search = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Text("البحث عن المنتجات"),
          ),
          body: Column(
            children: [
              Container(
                width: width,
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (width * .75) - 10,
                      height: 39 * (height / 844),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xEEEEEEEE),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: TextField(
                        autofocus: true,
                        focusNode: search,
                        controller: searchController,
                        decoration: InputDecoration(
                          hint: Text("البحث في منتجات الشركات"),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              searchController.clear();
                            },
                            child: Icon(Icons.cancel, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductRequest(),
                          ),
                        );
                      },
                      child: Container(
                        width: 82 * (width / 390),
                        height: 39 * (height / 844),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF000A5A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'طلب منتج ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14 * (width / 390),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18 * (height / 844)),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3 * (width / 390),
                tabs: [
                  Tab(
                    child: Text(
                      'اصناف',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF646464),
                        fontSize: 16 * (width / 390),
                        fontWeight: FontWeight.w700,
                        height: 1.50 * (width / 390),
                        letterSpacing: 0.50 * (width / 390),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'شركات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF000A5A),
                        fontSize: 16 * (width / 390),
                        fontWeight: FontWeight.w700,
                        height: 1.50 * (width / 390),
                        letterSpacing: 0.50 * (width / 390),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                height: height * .75,
                child: TabBarView(
                  children: [
                    ListView(
                      children: [
                        Column(
                          spacing: 10,
                          children: [
                            SizedBox(height: 10),
                            WaslSearchItem(),
                            WaslSearchItem(),
                            WaslSearchItem(),
                          ],
                        ),
                      ],
                    ),
                    ListView(
                      children: [
                        WaslCompanyCard(
                          image: "assets/images/pepsi_cover.png",
                          logo: "assets/images/pepsi_logo.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Company(),
                              ),
                            );
                          },
                        ),
                        WaslCompanyCard(
                          image: "assets/images/pringls_cover.png",
                          logo: "assets/images/pringls_logo.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Company(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
