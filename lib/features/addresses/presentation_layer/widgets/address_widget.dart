import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/providers/cubit/address_cubit.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/screens/address_details_screen.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, required this.address});

  final AddressEntity address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.location_on), Text(address.name)],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AddressCubit>().selectLocation(
                    LatLng(address.latitude, address.longitude),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<AddressCubit>(),
                        child: AddressDetailsScreen(address: address),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.edit_outlined, color: Colors.white),
                    Text("تعديل", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<AddressCubit>().deleteAddress(address.id!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete_outlined, color: Colors.white),
                    Text("حذف", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
