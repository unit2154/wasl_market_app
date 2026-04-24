import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/item_entity.dart';

class ItemsListEntity {
  final List<ItemEntity> items;
  final String? nextPageUrl;
  ItemsListEntity({required this.items, this.nextPageUrl});
}