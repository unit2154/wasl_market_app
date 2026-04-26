import 'package:wasl_market_app/features/home/domain_layer/entities/sub_entities/brand_entity.dart';

class BrandsListEntity {
  final List<BrandEntity> brands;
  final String? nextPageUrl;
  BrandsListEntity({required this.brands, this.nextPageUrl});
}
