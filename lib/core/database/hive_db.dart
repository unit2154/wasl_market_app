import 'package:hive_flutter/hive_flutter.dart';
import 'package:wasl_market_app/core/database/db_boxes.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/token_model.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/user_model.dart';
import 'package:wasl_market_app/features/home/data_layer/models/product_model.dart';
import 'package:wasl_market_app/features/cart/data_layer/models/cart_model.dart';
import 'package:wasl_market_app/features/cart/data_layer/models/sub_model/cart_item_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TokenModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(CartItemModelAdapter());
  await Hive.openBox<UserModel>(DBBoxes.userBox);
  await Hive.openBox<TokenModel>(DBBoxes.tokenBox);
  await Hive.openBox<ProfileModel>(DBBoxes.profileBox);
  await Hive.openBox<ProductModel>(DBBoxes.productBox);
  await Hive.openBox<CartModel>(DBBoxes.cartBox);
  await Hive.openBox<CartItemModel>(DBBoxes.cartItemBox);
}
