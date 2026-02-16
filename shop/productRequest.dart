import 'package:flutter/material.dart';

class ProductRequest extends StatefulWidget {
  @override
  State<ProductRequest> createState() => _ProductRequestState();
}

class _ProductRequestState extends State<ProductRequest> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 390;
    final double height = MediaQuery.of(context).size.height / 844;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("طلب منتج غير متوفر"),
        ),
        body: Center(
          child: Column(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: 120 * width,
                  height: 120 * width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1 * width,
                        color: const Color(0xFFA6A6A6),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(child: Icon(Icons.add_a_photo_outlined,color: const Color(0xFFA6A6A6),size: 40*width,)),
                ),
              ),
              Text(
                'تحميل صورة المنتج',
                style: TextStyle(
                  color: const Color(0xFF282828),
                  fontSize: 16*width,
                  fontWeight: FontWeight.w400,
                  height: 1.50*height,
                ),
              ),
              Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اسم المنتج',
                    style: TextStyle(
                      color: const Color(0xFF282828),
                      fontSize: 16*width,
                      fontWeight: FontWeight.w400,
                      height: 1.38*height,
                      letterSpacing: 0.32*width,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 342*width,
                    height: 54*height,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.21*width,
                          color: const Color(0xEEE3E7EC),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Text(
                    'الوصف',
                    style: TextStyle(
                      color: const Color(0xFF282828),
                      fontSize: 16*width,
                      fontWeight: FontWeight.w400,
                      height: 1.38*height,
                      letterSpacing: 0.32*width,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 342*width,
                    height: 54*height,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.21*width,
                          color: const Color(0xEEE3E7EC),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    width: 342*width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الوزن',
                              style: TextStyle(
                                color: const Color(0xFF282828),
                                fontSize: 16*width,
                                fontWeight: FontWeight.w400,
                                height: 1.38*height,
                                letterSpacing: 0.32*width,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              width: 149*width,
                              height: 54*height,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.21*width,
                                    color: const Color(0xEEE3E7EC),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'السعر IQD',
                              style: TextStyle(
                                color: const Color(0xFF282828),
                                fontSize: 16*width,
                                fontWeight: FontWeight.w400,
                                height: 1.38*height,
                                letterSpacing: 0.32*width,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              width: 149*width,
                              height: 54*height,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.21*width,
                                    color: const Color(0xEEE3E7EC),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    'اسم الشركة',
                    style: TextStyle(
                      color: const Color(0xFF282828),
                      fontSize: 16*width,
                      fontWeight: FontWeight.w400,
                      height: 1.38*height,
                      letterSpacing: 0.32*width,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 342*width,
                    height: 54*height,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.21*width,
                          color: const Color(0xEEE3E7EC),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 342*width,
                height: 54*height,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF000A5A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                child: Center(
                  child: Text(
                    'تأكيد طلب المنتج',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14*width,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
