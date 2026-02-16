import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslButton.dart';

class SupportMessage extends StatelessWidget {
  const SupportMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("رسالة الدعم"),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*.41,
                height: MediaQuery.of(context).size.width*.41,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/support_message.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "الموضوع",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "رسالتك",
                  border: OutlineInputBorder(),
                ),
              ),
              Expanded(child: SizedBox.shrink()),
              WaslButton(text: "ارسال", onPressed: (){}),
              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}
