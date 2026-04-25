part of 'locator.dart';

Future<void> dbDependencies() async {
  // ======================= DB =======================
  getIt.registerLazySingleton<Box<TokenModel>>(
    () => Hive.box<TokenModel>(DBBoxes.tokenBox),
  );
  getIt.registerLazySingleton<Box<UserModel>>(
    () => Hive.box<UserModel>(DBBoxes.userBox),
  );
  getIt.registerLazySingleton<Box<CartModel>>(
    () => Hive.box<CartModel>(DBBoxes.cartBox),
  );
  getIt.registerLazySingleton<Box<CatalogItemModel>>(
    () => Hive.box<CatalogItemModel>(DBBoxes.catalogItemBox),
  );
  getIt.registerLazySingleton<Box<BrandModel>>(
    () => Hive.box<BrandModel>(DBBoxes.brandBox),
  );
  getIt.registerLazySingleton<Box<CompanyModel>>(
    () => Hive.box<CompanyModel>(DBBoxes.companyBox),
  );
  getIt.registerLazySingleton<Box<ItemModel>>(
    () => Hive.box<ItemModel>(DBBoxes.itemBox),
  );
  // ======================= DB =======================
}
