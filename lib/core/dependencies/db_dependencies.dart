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
  // ======================= DB =======================
}
