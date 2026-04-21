import 'package:wasl_market_app/features/home/data_layer/models/sub_models/brand_model.dart';
import 'package:wasl_market_app/features/home/domain_layer/entities/brands_list_entity.dart';

class BrandsListModel extends BrandsListEntity {
  BrandsListModel({required super.brands, super.nextPage});
  factory BrandsListModel.fromJson(Map<String, dynamic> json) {
    return BrandsListModel(
      brands: (json['data'] as List<dynamic>)
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['next_page'],
    );
  }
}
