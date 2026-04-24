import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/catalog_item_entity.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/company_entity.dart';

class ItemEntity {
  final int id;
  final CatalogItemEntity catalogItem;
  final CompanyEntity company;
  final String availabilityStatus;
  final int stockQuantity;
  final double price;
  final List<dynamic>? priceTiers;
  final String? customSku;

  ItemEntity({
    required this.id,
    required this.catalogItem,
    required this.company,
    required this.availabilityStatus,
    required this.stockQuantity,
    required this.price,
    this.priceTiers,
    this.customSku,
  });
}
