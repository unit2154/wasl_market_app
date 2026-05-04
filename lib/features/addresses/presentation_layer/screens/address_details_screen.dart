import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/addresses/data_layer/models/address_model.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/providers/cubit/address_cubit.dart';

class AddressDetailsScreen extends StatelessWidget {
  final AddressEntity? address;
  const AddressDetailsScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    final mapController = MapController();
    final nameController = TextEditingController(text: address?.name);
    final areaController = TextEditingController(text: address?.area);
    final cityController = TextEditingController(text: address?.city);
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.status == AddressStatus.update ||
            state.status == AddressStatus.add) {
          Navigator.pop(context);
        } else if (state.status == AddressStatus.error) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("خطأ"),
                content: Text(state.errorMessage ?? "حدث خطأ"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("حسنا"),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text("عنوان التوصيل"),
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
                        context.read<AddressCubit>().selectLocation(point);
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: "com.vorhex.wasl",
                      ),
                      MarkerLayer(markers: state.markers ?? []),
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
                  controller: areaController,
                  decoration: InputDecoration(
                    hintText: "المنطقة",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    hintText: "المدينة",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "اسم العنوان",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    address == null
                        ? context.read<AddressCubit>().addAddress(
                            AddressModel(
                              name: nameController.text,
                              area: areaController.text,
                              city: cityController.text,
                              latitude: state.selectedLocation!.latitude,
                              longitude: state.selectedLocation!.longitude,
                            ),
                          )
                        : context.read<AddressCubit>().updateAddress(
                            AddressModel(
                              id: address!.id,
                              customerId: address!.customerId,
                              area: areaController.text,
                              city: cityController.text,
                              latitude: state.selectedLocation!.latitude,
                              longitude: state.selectedLocation!.longitude,
                              name: nameController.text,
                              createdAt: address!.createdAt,
                              updatedAt: address!.updatedAt,
                            ),
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "تأكيد",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
