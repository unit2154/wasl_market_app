import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> notifications = ["1,2,3","4,5,6"];  
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, 
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("الإشعارات"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: notifications.isEmpty ? 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/empty_noti.png"),
                Text("لا يوجد إشعارات"),
              ],
            ):
            ListView(
              children: [
                Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(width: 25, child: Image.asset("assets/images/success.png")),
                        SizedBox(width: 10),
                        Text("تم تأكيد الطلب"),
                        Spacer(),
                        Text("10:00"),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("نشكرك على تواصلك معنا , تم ارسال طلبك بنجاح وسيتم مراجعته وارساله في اقرب وقت ممكن."),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(width: 25, child: Image.asset("assets/images/delivery.png")),
                        SizedBox(width: 10),
                        Text("طلبك في طريقه اليك"),
                        Spacer(),
                        Text("10:00"),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("سيتم الأتصال بك قريبا من قبل مندوب التطبيق لتسليم الطلب , تابع حالة الطلب من خلال التطبيق."),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(width: 25, child: Image.asset("assets/images/offer.png")),
                        SizedBox(width: 10),
                        Text("تمتع معنا بأفضل العروض"),
                        Spacer(),
                        Text("10:00"),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("اكتشف منتجات مختارة يوميا وبأسعار تنافسية, لا تفوت الفرصة العروض لفترة محدودة."),
                    ),
                  ),
                ), 
                SizedBox(height: 10),
              ],
            )
          ),
        ),
      ),
    );
  }
}