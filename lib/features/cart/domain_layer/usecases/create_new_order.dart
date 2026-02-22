import 'package:dartz/dartz.dart';
import 'package:wasl_market_app/core/error/failure.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/new_order_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/new_order_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/repositories/cart_repo.dart';

class CreateNewOrder {
  final CartRepo cartRepo;

  CreateNewOrder({required this.cartRepo});
  Future<Either<Failure, void>> call(CartEntity cart) async {
    var products = cart.products;
    var companies = {
      for (var product in products)
        {product.product.profile?.id: product}.values.toList(),
    };

    String mainCustomerId = '';
    List<NewOrderItemEntity> items = [];

    for (var company in companies) {
      mainCustomerId = company.first.product.profile!.id.toString();
      for (var product in company) {
        items.add(
          NewOrderItemEntity(
            itemId: product.product.id.toString(),
            quantity: product.quantity,
          ),
        );
      }
    }
    return await cartRepo.createNewOrder(
      NewOrderEntity(
        mainCustomerId: mainCustomerId,
        items: items,
        shippingAddress: '123 Main Street, Baghdad',
        notes: 'Please handle with care',
      ),
    );
  }
}
