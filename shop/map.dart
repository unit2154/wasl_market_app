import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wasl/widgets/waslButton.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  MapController mapController = MapController();
  List<Marker> markers = [Marker(point: LatLng(33.3152, 44.3661), child: Icon(Icons.location_pin, color: Color(0xFF000B5B), size: 50.0,), alignment: Alignment(-0.8, -2.2)),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("اختر موقعك"),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(33.3152, 44.3661),
              initialZoom: 13.0,
              onTap: (tapPosition, point){
                print(point);
                setState(() {
                  //mapController.move(point, 13.0);
                  // mark selected location
                  markers[0] = Marker(point: point, child: Icon(Icons.location_pin, color: Color(0xFF000B5B), size: 50.0,), alignment: Alignment(-0.8, -2.2));
                });
              },
            ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: "com.vorhex.wasl",
            ),
            MarkerLayer(
              markers: markers,
            ),
          ],
        ),

        Positioned(
          left: MediaQuery.of(context).size.width * 0.1 ,
          bottom: MediaQuery.of(context).size.height * 0.15,
          child: FloatingActionButton(
            shape: ShapeBorder.lerp(
              CircleBorder(),
              CircleBorder(),
              0.5,
            ),
            backgroundColor: Color(0XFF000B5B),
            onPressed: (){
              Geolocator.getCurrentPosition().then((loc){
                setState(() {
                  mapController.move(LatLng(loc.latitude, loc.longitude), 13.0);
                  markers[0] = Marker(point: LatLng(loc.latitude, loc.longitude), child: Icon(Icons.location_pin, color: Color(0xFF000B5B), size: 50.0,), alignment: Alignment(-0.8, -2.2));
                });
              });
            },
          child: Icon(Icons.location_searching, color: Colors.white,),
        ),),

        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.05,
          height: 55.0,
          left: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          child: WaslButton(text: "تاكيد", onPressed: (){
            Navigator.pop(context, markers);
          }),
        ),
        ],
      ),
    );
  }
}