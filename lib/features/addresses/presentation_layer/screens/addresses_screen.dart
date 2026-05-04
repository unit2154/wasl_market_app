import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/providers/cubit/address_cubit.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/screens/address_details_screen.dart';
import 'package:wasl_market_app/features/addresses/presentation_layer/widgets/address_widget.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text("المواقع"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await context.read<AddressCubit>().getAddresses();
          },
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    debugPrint(state.addresses?.length.toString());
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return AddressWidget(
                            address: state.addresses![index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: (state.addresses?.length) ?? 0,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: MediaQuery.of(context).padding.bottom + 16,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<AddressCubit>(),
                          child: const AddressDetailsScreen(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "إضافة موقع جديد",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
