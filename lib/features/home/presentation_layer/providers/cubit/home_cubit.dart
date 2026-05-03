import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/categories_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/companies_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/search_suggest_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/filter_items.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_brands.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_categories.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_companies.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/search_suggest.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCompaniesUseCase getCompaniesUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetBrandsUseCase getBrandsUseCase;
  final FilterItemsUseCase filterItemsUseCase;
  final SearchSuggestUseCase searchSuggestUseCase;
  HomeCubit({
    required this.getCompaniesUseCase,
    required this.getCategoriesUseCase,
    required this.getBrandsUseCase,
    required this.filterItemsUseCase,
    required this.searchSuggestUseCase,
  }) : super(
         HomeState(
           items: ItemsListEntity(items: []),
           companies: CompaniesListEntity(companies: []),
           categories: CategoriesListEntity(categories: []),
           brands: BrandsListEntity(brands: []),
         ),
       );

  Future<void> getCategoriesAndCompanies() async {
    emit(state.copyWith(stateType: StateType.loading));
    try {
      final categories = await getCategoriesUseCase(1);
      categories.fold(
        (l) {
          debugPrint('categoriesssss: $l');
          emit(
            state.copyWith(stateType: StateType.failure, message: l.message),
          );
        },
        (cats) async {
          final companies = await getCompaniesUseCase(1);
          companies.fold(
            (l) {
              debugPrint('companies: $l');
              emit(
                state.copyWith(
                  stateType: StateType.failure,
                  message: l.message,
                ),
              );
            },
            (comps) async {
              final brands = await getBrandsUseCase(1);
              brands.fold(
                (l) {
                  debugPrint('brands: $l');
                  emit(
                    state.copyWith(
                      stateType: StateType.failure,
                      message: l.message,
                    ),
                  );
                },
                (brands) {
                  debugPrint('from cubit brands: ${brands.brands.length}');
                  debugPrint(
                    'from cubit categories: ${cats.categories.length}',
                  );
                  debugPrint('from cubit companies: ${comps.companies.length}');
                  emit(
                    state.copyWith(
                      stateType: StateType.success,
                      companies: comps,
                      categories: cats,
                      brands: brands,
                    ),
                  );
                },
              );
            },
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(stateType: StateType.failure, message: e.toString()));
    }
  }

  Future<void> filterProducts({required FilterModel filter}) async {
    emit(state.copyWith(stateType: StateType.loading));
    try {
      final items = await filterItemsUseCase(
        FilterParams(
          category: filter.category,
          company: filter.company,
          brand: filter.brand,
          search: filter.search,
          page: filter.page,
        ),
      );
      items.fold(
        (l) {
          debugPrint('items: $l');
          emit(
            state.copyWith(stateType: StateType.failure, message: l.message),
          );
        },
        (items) {
          debugPrint('items: ${items.items.length}');
          emit(
            state.copyWith(
              stateType: StateType.success,
              items: items,
              filter: filter,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(stateType: StateType.failure, message: e.toString()));
    }
  }

  Future<void> getNextPage({required NextPageModel nextPageModel}) async {
    debugPrint("getting page no: ${nextPageModel.itemsPage}");
    emit(state.copyWith(stateType: StateType.loading));
    try {
      if (nextPageModel.companiesPage != null) {
        final companies = await getCompaniesUseCase(
          nextPageModel.companiesPage!,
        );
        companies.fold(
          (l) {
            debugPrint('companies: $l');
            emit(
              state.copyWith(stateType: StateType.failure, message: l.message),
            );
          },
          (companies) {
            emit(
              state.copyWith(
                stateType: StateType.success,
                companies: CompaniesListEntity(
                  companies: [
                    ...state.companies.companies,
                    ...companies.companies,
                  ],
                  nextPageUrl: companies.nextPageUrl,
                ),
              ),
            );
          },
        );
      } else if (nextPageModel.brandsPage != null) {
        final brands = await getBrandsUseCase(nextPageModel.brandsPage!);
        brands.fold(
          (l) {
            debugPrint('brands: $l');
            emit(
              state.copyWith(stateType: StateType.failure, message: l.message),
            );
          },
          (brands) {
            debugPrint('brands: ${brands.brands.length}');
            emit(
              state.copyWith(
                stateType: StateType.success,
                brands: BrandsListEntity(
                  brands: [...state.brands.brands, ...brands.brands],
                  nextPageUrl: brands.nextPageUrl,
                ),
              ),
            );
          },
        );
      } else if (nextPageModel.itemsPage != null) {
        final items = await filterItemsUseCase(
          FilterParams(
            category: state.filter?.category,
            company: state.filter?.company,
            brand: state.filter?.brand,
            search: state.filter?.search,
            page: nextPageModel.itemsPage,
          ),
        );
        items.fold(
          (l) {
            debugPrint('items: $l');
            emit(
              state.copyWith(stateType: StateType.failure, message: l.message),
            );
          },
          (items) {
            debugPrint('items: ${items.items.length}');
            emit(
              state.copyWith(
                stateType: StateType.success,
                items: ItemsListEntity(
                  items: [...state.items.items, ...items.items],
                  nextPageUrl: items.nextPageUrl,
                ),
              ),
            );
          },
        );
      }
    } catch (e) {
      emit(state.copyWith(stateType: StateType.failure, message: e.toString()));
    }
  }

  Future<void> searchSuggest({required String query}) async {
    try {
      final searchSuggests = await searchSuggestUseCase(query);
      searchSuggests.fold(
        (l) {
          debugPrint('searchSuggests: $l');
        },
        (searchSuggests) {
          debugPrint('searchSuggests: ${searchSuggests.length}');
          emit(
            state.copyWith(
              stateType: StateType.searchSuggest,
              searchSuggests: searchSuggests,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(stateType: StateType.failure, message: e.toString()));
    }
  }

  void clearSearchSuggest() {
    emit(state.copyWith(stateType: StateType.success, searchSuggests: []));
  }

  // Future<void> search({required String search, int? page}) async {
  //   emit(state.copyWith(stateType: StateType.loading));
  //   try {
  //     final items = await filterItemsUseCase(
  //       FilterParams(search: search, page: page),
  //     );
  //     items.fold(
  //       (l) {
  //         debugPrint('items: $l');
  //         emit(
  //           state.copyWith(stateType: StateType.failure, message: l.message),
  //         );
  //       },
  //       (items) {
  //         debugPrint('items: ${items.items.length}');
  //         emit(state.copyWith(stateType: StateType.success, items: items));
  //       },
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(stateType: StateType.failure, message: e.toString()));
  //   }
  // }

  void loadNextPage() {
    debugPrint("loading next page: ${state.items.nextPageUrl}");
    int page = state.items.nextPageUrl != null
        ? int.parse(state.items.nextPageUrl!.split("page=")[1])
        : 0;
    if (page != 0) {
      getNextPage(nextPageModel: NextPageModel(itemsPage: page));
    }
  }
}
