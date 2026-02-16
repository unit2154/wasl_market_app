import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslSupportCard.dart';

class SupportChat extends StatefulWidget {
  const SupportChat({super.key});

  @override
  State<SupportChat> createState() => _SupportChatState();
}

class _SupportChatState extends State<SupportChat> {
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
          title: Text("الدعم")
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: height*.03,
              left: width*.03,
              right: width*.03,
              child: Container(
                width: width*.9,
                height: height*.06,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFE3E7EC),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width*.75,
                      height: height*.042,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: width*.153,
                      height: height*.042,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF000A5A),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 4,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text("ارسال", style: TextStyle(color: Colors.white)),
                      )
                    )
                  ],
                ),
              )
            ),
            Positioned(
              top: 0,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: width*.256,
                      height: width*.256,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/support.png"),
                          fit: BoxFit.cover
                        )
                        ),
                    ),
                    WaslSupportCard(state: 1),
                    Container(
                        width: width,
                        height: height*.46,
                        child: ListView(
                          children: [
                            WaslSupportCard(state: 2),
                            WaslSupportCard(state: 3),
                            WaslSupportCard(state: 4),
                            WaslSupportCard(state: 5),
                            WaslSupportCard(state: 6),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
