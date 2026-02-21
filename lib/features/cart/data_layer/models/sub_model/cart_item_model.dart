import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/home/data_layer/models/product_model.dart';

part '../../../../../core/database/cart_Item_model.g.dart';

@HiveType(typeId: DbTypeId.cartItem)
class CartItemModel extends CartItemEntity {
  CartItemModel({
    @HiveField(0) required super.product,
    @HiveField(1) required super.quantity,
  });

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: entity.product as ProductModel,
      quantity: entity.quantity,
    );
  }

  CartItemEntity toEntity() {
    return this;
  }
}
