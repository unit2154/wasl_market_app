import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/home/data_layer/models/product_model.dart';

@HiveType(typeId: DbTypeId.cartItem)
class CartItemModel extends CartItemEntity {
  CartItemModel({required super.product, required super.quantity});

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: entity.product as ProductModel,
      quantity: entity.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': (product as ProductModel).toJson(),
      'quantity': quantity,
    };
  }
}
