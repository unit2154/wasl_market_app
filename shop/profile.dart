import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslButton.dart';
import 'package:wasl/widgets/waslTextField.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("الملف الشخصي"),
        ),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      Image.asset("assets/images/profile_img.png"),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000B5B),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit_outlined, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الاسم", style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 10),
                    WaslTextField(labelText: "محمد علي"),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("رقم الهاتف", style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 10),
                    WaslTextField(labelText: "01012345678"),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("كلمة المرور", style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 10),
                    OutlinedButton.icon(
                      onPressed: (){}, 
                      icon: Icon(Icons.verified_user_outlined),
                      label: Row(
                        children: [
                          Text("تغيير كلمة المرور"),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: Size(double.infinity, 55),
                        iconSize: 25.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                WaslButton(text: "تحديث المعلومات", onPressed: (){
                  Navigator.pop(context);
                }),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}