import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Text("الضبط العام"),
          ),
          body: Column(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.notifications_none),
                      SizedBox(width: 10,),
                      Text("الاشعارات", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.language_outlined),
                      SizedBox(width: 10,),
                      Text("اللغة", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.dark_mode_outlined),
                      SizedBox(width: 10,),
                      Text("الوضع الليلي", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Spacer(),
                      // switch dark mode
                      Switch(value: isDarkMode, onChanged: (value){
                        print(value);
                        setState(() {
                          isDarkMode = value;
                        });
                      }),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: (){
                  print("delete");
                  showDialog(context: context, builder: (BuildContext context) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        title: Text("حذف الحساب"),
                        content: Text("هل انت متأكد من حذف الحساب ؟"),
                        actions: [
                          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("الغاء")),
                          ElevatedButton(onPressed: (){}, child: Text("حذف", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
                        ],
                      ),
                    );
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 68,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(Icons.delete_outline, color: Colors.red,),
                            SizedBox(width: 10,),
                            Text("حذف الحساب", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("قم بحذف حسابك بشكل نهائي من التطبيق.", style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
