import 'package:wasl_market_app/features/home/domain_layer/entities/product_entity.dart';

class CartEntity {
  final List<ProductEntity> products;
  final double totalPrice;

  CartEntity({required this.products, required this.totalPrice});
}
