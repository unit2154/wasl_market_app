import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslButton.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var _count = 1;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Row(
            children: [
              Text("اسم المنتج"),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.18,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: ShapeDecoration(
                  color: const Color(0xBF000A5A),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF5F7FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                child: Center(child: Image.asset("assets/images/item.png")),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "معكرونة التونسا(كيس صغير)٫ 30gm",
                        style: TextStyle(
                          color: const Color(0xFF282828),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                      Text(
                        "تاريخ الانتاج 2025.5.2",
                        style: TextStyle(
                          color: const Color(0xFF646464),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.12,
                          letterSpacing: 0.50,
                        ),
                      ),
                      Text(
                        "1500 IQD",
                        style: TextStyle(
                          color: const Color(0xFF000A5A),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.12,
                          letterSpacing: 0.50,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "الوصف",
                        style: TextStyle(
                          color: const Color(0xFF282828),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.12,
                        ),
                      ),
                      Text(
                        "المعكرونة عالية الجودة مصنوعة من اجود انواع القمح الصلب تمنحك طمعا غنيا وقواما مثاليا عند الطهي . سهلة التحضير ومتعدة الأستخدامات . مثالية للأطباق الأيطالية التقليدية او وصفاتك المبتكرة. خيار رائع لكل من يبحث عن وجبة لذيذة وسريعة التحضير رضي جميع الأذواق.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: const Color(0xFF646464),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.38,
                          letterSpacing: 0.16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_count > 1) {
                                _count--;
                              }
                            });
                          },
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color(0xFF000B5B),
                            ),
                          ),
                        ),
                        Text(
                          _count.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF000B5B),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _count++;
                            });
                          },
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color(0xFF000B5B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    WaslButton(text: "اضف الى السلة", onPressed: () {}),
                    Text("في السلة 2"),
                  ],
                ),
                            ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
