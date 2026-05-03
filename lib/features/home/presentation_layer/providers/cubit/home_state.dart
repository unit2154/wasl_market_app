part of 'home_cubit.dart';

class FilterModel {
  final int? category;
  final int? company;
  final int? brand;
  final String? search;
  final int? page;
  FilterModel({this.category, this.company, this.brand, this.search, this.page});
}

class NextPageModel {
  final int? companiesPage;
  final int? brandsPage;
  final int? itemsPage;
  NextPageModel({this.companiesPage, this.brandsPage, this.itemsPage});
}

enum StateType { initial, loading, success, searchSuggest, failure }

class HomeState {
  final StateType stateType;
  final FilterModel? filter;
  final ItemsListEntity items;
  final CompaniesListEntity companies;
  final CategoriesListEntity categories;
  final BrandsListEntity brands;
  final List<SearchSuggestEntity>? searchSuggests;
  final String? message;
  HomeState({
    this.stateType = StateType.initial,
    this.filter,
    required this.items,
    required this.companies,
    required this.categories,
    required this.brands,
    this.searchSuggests,
    this.message,
  });

  HomeState copyWith({
    StateType? stateType,
    FilterModel? filter,
    ItemsListEntity? items,
    CompaniesListEntity? companies,
    CategoriesListEntity? categories,
    BrandsListEntity? brands,
    List<SearchSuggestEntity>? searchSuggests,
    String? message,
  }) {
    return HomeState(
      stateType: stateType ?? this.stateType,
      filter: filter ?? this.filter,
      items: items ?? this.items,
      companies: companies ?? this.companies,
      categories: categories ?? this.categories,
      brands: brands ?? this.brands,
      searchSuggests: searchSuggests ?? this.searchSuggests,
      message: message ?? this.message,
    );
  }
}

// final class HomeInitial extends HomeState {}

// final class HomeLoading extends HomeState {}

// final class HomeSuccess extends HomeState {
//   final FilterModel? filter;
//   final List<ProductEntity> products;
//   final CompaniesListEntity companies;
//   final CategoriesListEntity categories;
//   final BrandsListEntity brands;
//   HomeSuccess({
//     this.filter,
//     required this.products,
//     required this.companies,
//     required this.categories,
//     required this.brands,
//   });
// }

// final class HomeFailure extends HomeState {
//   final String message;
//   HomeFailure({required this.message});
// }
