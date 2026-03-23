import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_market_app/core/constants/colors.dart';
import 'package:wasl_market_app/core/widgets/search_bar.dart';
import 'package:wasl_market_app/features/master_orders/presentation_layer/providers/cubit/master_orders_cubit.dart';
import 'package:wasl_market_app/features/master_orders/presentation_layer/widgets/master_order_card_widget.dart';

class MasterOrderTabWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const MasterOrderTabWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MasterOrdersCubit, MasterOrdersState>(
        builder: (context, state) {
          if (state is MasterOrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MasterOrdersError) {
            return Center(child: Text(state.message));
          }
          return Column(
            children: [
              SearchInput(
                onChanged: (value) {
                  context.read<MasterOrdersCubit>().searchOrders(value);
                },
                height: constraints.maxHeight * 0.065,
              ),
              Expanded(
                child: RefreshIndicator(
                  displacement: 20,
                  color: AppColors.primaryColor,
                  onRefresh: () async {
                    context.read<MasterOrdersCubit>().getMasterOrders();
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount:
                        (state as MasterOrdersLoaded).masterOrdersList.length,
                    itemBuilder: (context, index) => MasterOrderCard(
                      order: state.masterOrdersList[index],
                      constraints: constraints,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
