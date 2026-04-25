import 'package:wasl_market_app/features/home/domain_layer/entities/items_list_entity.dart';

abstract class StoreProductsDataSource {
  Future<ItemsListEntity> getProducts();
}
