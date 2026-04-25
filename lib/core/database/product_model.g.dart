part of '../../features/home/data_layer/models/sub_models/item_model.dart';

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  int get typeId => DbTypeId.item;

  @override
  ItemModel read(BinaryReader reader) {
    return ItemModel(
      id: reader.read(),
      catalogItem: reader.read(),
      company: reader.read(),
      availabilityStatus: reader.read(),
      stockQuantity: reader.read(),
      price: reader.read(),
      priceTiers: reader.read(),
      customSku: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer.write(obj.id);
    writer.write(obj.catalogItem);
    writer.write(obj.company);
    writer.write(obj.availabilityStatus);
    writer.write(obj.stockQuantity);
    writer.write(obj.price);
    writer.write(obj.priceTiers);
    writer.write(obj.customSku);
  }
}
