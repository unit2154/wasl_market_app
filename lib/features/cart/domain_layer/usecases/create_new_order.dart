import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/new_order_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class CreateNewOrder {
  final CartRepo cartRepo;

  CreateNewOrder({required this.cartRepo});
  Future<Either<Failure, void>> call(
    CartEntity cart,
    int? addressId,
    String? paymentType,
    String? notes,
  ) async {
    var products = cart.products;
    List<NewOrderItemEntity> items = [];
    for (var product in products) {
      items.add(
          NewOrderItemEntity(
            itemId: product.product.id.toString(),
            quantity: product.quantity,
          ),
        );
      }
    
    return await cartRepo.createNewOrder(
      NewOrderEntity(
        addressId: addressId??0,
        paymentType: paymentType??"",
        items: items,
        notes: notes??"",
      ),
    );
  }
}
