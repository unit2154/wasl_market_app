part of '../../features/home/data_layer/models/sub_models/catalog_item_model.dart';

class CatalogItemModelAdapter extends TypeAdapter<CatalogItemModel> {
  @override
  int get typeId => DbTypeId.catalogItem;

  @override
  CatalogItemModel read(BinaryReader reader) {
    return CatalogItemModel(
      id: reader.read(),
      name: reader.read(),
      description: reader.read(),
      image: reader.read(),
      brand: reader.read(),
      sku: reader.read(),
      searchSynonyms: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CatalogItemModel obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.image);
    writer.write(obj.brand);
    writer.write(obj.sku);
    writer.write(obj.searchSynonyms);
  }
}