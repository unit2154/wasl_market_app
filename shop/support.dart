import 'package:flutter/material.dart';
import 'package:wasl/shop/supportMessage.dart';
import 'package:wasl/widgets/waslSupportCard.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("الدعم الفني"),
        ),
        body: Center(
          child: Column(
            spacing: 20,
            children: [
              Container(
                width: width * .184,
                height: width * .184,
                child: Image.asset("assets/images/support.png"),
              ),
              Text("تواصل معنا لاي استفسار او مساعدة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              GestureDetector(
                child: Container(
                  width: width* .876,
                  height: height * .042,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF000A5A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(child: Text("اتصل بنا الان", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportMessage()));
                },
                child: Container(
                  width: width* .876,
                  height: height * .042,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF000A5A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(child: Text("ارسل رسالة", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    WaslSupportCard(state: 1,)
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
