part of '../../features/home/data_layer/models/product_model.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  int get typeId => DbTypeId.product;

  @override
  ProductModel read(BinaryReader reader) {
    return ProductModel(
      id: reader.read(),
      name: reader.read(),
      description: reader.read(),
      sku: reader.read(),
      price: reader.read(),
      stockQuantity: reader.read(),
      availabilityStatus: reader.read(),
      images: reader.read(),
      unit: reader.read(),
      minOrderQuantity: reader.read(),
      isActive: reader.read(),
      createdAt: reader.read(),
      updatedAt: reader.read(),
      deletedAt: reader.read(),
      profile: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.sku);
    writer.write(obj.price);
    writer.write(obj.stockQuantity);
    writer.write(obj.availabilityStatus);
    writer.write(obj.images);
    writer.write(obj.unit);
    writer.write(obj.minOrderQuantity);
    writer.write(obj.isActive);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
    writer.write(obj.deletedAt);
    writer.write(obj.profile);
  }
}
