part of 'master_orders_cubit.dart';

@immutable
sealed class MasterOrdersState {}

final class MasterOrdersInitial extends MasterOrdersState {}

final class MasterOrdersLoading extends MasterOrdersState {}

final class MasterOrdersLoaded extends MasterOrdersState {
  final List<MasterOrderEntity> masterOrdersList;
  MasterOrdersLoaded({required this.masterOrdersList});
}

final class MasterOrdersError extends MasterOrdersState {
  final String message;
  MasterOrdersError({required this.message});
}
