import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wasl/widgets/waslButton.dart';
import 'package:wasl/widgets/waslListBox.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController();
    List<Marker> markers = [];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Text("عنوان التوصيل")
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "احداثيات الموقع",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(33.3152, 44.3661),
                  initialZoom: 13.0,
                  onTap: (tapPosition, point) {
                    print(point);
                    setState(() {
                      //mapController.move(point, 13.0);
                      // mark selected location
                      markers[0] = Marker(
                        point: point,
                        child: Icon(
                          Icons.location_pin,
                          color: Color(0xFF000B5B),
                          size: 50.0,
                        ),
                        alignment: Alignment(-0.8, -2.2),
                      );
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: "com.vorhex.wasl",
                  ),
                  MarkerLayer(markers: markers),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              "التفاصيل",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "المنطقة",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "الشارع",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "المتجر",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10,),
            WaslListBox(labelText: "النشاط التجاري", items: [
              DropdownMenuItem(value: 1, child: Text("مطعم")),
              DropdownMenuItem(value: 2, child: Text("اسواق")),
              DropdownMenuItem(value: 3, child: Text("طبي")),
            ],
            onChanged: (value) {
              print(value);
            },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "رقم الهاتف",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 60),
            WaslButton(
              text: "تأكيد",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
