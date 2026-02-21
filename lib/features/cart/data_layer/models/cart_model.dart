import 'package:wasl_market_app/features/cart/data_layer/models/sub_model/cart_item_model.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';

part '../../../../core/database/cart_model.g.dart';

@HiveType(typeId: DbTypeId.cart)
class CartModel extends CartEntity {
  CartModel({@HiveField(0) required super.products});

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      products: entity.products
          .map((e) => CartItemModel.fromEntity(e))
          .toList(),
    );
  }

  CartEntity toEntity() {
    return this;
  }
}
