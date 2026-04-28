import 'package:wasl_market_app/features/home/domain_layer/entities/search_suggest_entity.dart';

class SearchSuggestModel extends SearchSuggestEntity {
  SearchSuggestModel({
    required super.indexKey,
    required super.entityType,
    required super.name,
    required super.sku,
    required super.image,
  });
  factory SearchSuggestModel.fromJson(Map<String, dynamic> json) {
    return SearchSuggestModel(
      indexKey: json['index_key'],
      entityType: json['entity_type'],
      name: json['name']['ar'],
      sku: json['sku'],
      image: json['image'],
    );
  }
}
