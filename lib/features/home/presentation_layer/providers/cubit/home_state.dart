part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductEntity> products;
  final CompaniesListEntity companies;
  HomeSuccess({required this.products, required this.companies});
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure({required this.message});
}
