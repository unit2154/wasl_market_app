import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/entities/master_order_entity.dart';
import 'package:wasl_market_app/features/master_orders/domain_layer/usecases/get_master_orders.dart';

part 'master_orders_state.dart';

class MasterOrdersCubit extends Cubit<MasterOrdersState> {
  final GetMasterOrdersUseCase getMasterOrdersUseCase;
  List<MasterOrderEntity> masterOrdersList = [];
  MasterOrdersCubit({required this.getMasterOrdersUseCase})
    : super(MasterOrdersInitial());

  Future<void> getMasterOrders() async {
    emit(MasterOrdersLoading());
    final result = await getMasterOrdersUseCase();
    result.fold(
      (failure) {
        emit(MasterOrdersError(message: failure.message));
      },
      (masterOrderListEntity) {
        //sort orders by date
        masterOrdersList = masterOrderListEntity.orders ?? [];
        masterOrdersList != []
            ? masterOrdersList.sort(
                (a, b) => b.createdAt.compareTo(a.createdAt),
              )
            : null;
        emit(MasterOrdersLoaded(masterOrdersList: masterOrdersList));
      },
    );
  }

  Future<void> searchOrders(String query) async {
    if (query.isEmpty) {
      emit(MasterOrdersLoaded(masterOrdersList: masterOrdersList));
      return;
    }
    var filteredOrdersList = masterOrdersList
        .where(
          (order) =>
              order.masterOrderNumber
                  .toString()
                  .split('-')
                  .last
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              order.companyOrders.any(
                (order) => order.company!.name.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              ),
        )
        .toList();
    emit(MasterOrdersLoaded(masterOrdersList: filteredOrdersList));
  }
}
