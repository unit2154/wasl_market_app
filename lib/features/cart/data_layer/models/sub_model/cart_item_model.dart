import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_type_id.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';

part '../../../../../core/database/cart_Item_model.g.dart';

@HiveType(typeId: DbTypeId.cartItem)
class CartItemModel extends CartItemEntity {
  CartItemModel({
    @HiveField(0) required super.product,
    @HiveField(1) required super.quantity,
  });

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: entity.product,
      quantity: entity.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {'item_id': product.id, 'quantity': quantity};
  }
}
