part of '../../features/home/data_layer/models/sub_models/brand_model.dart';

class BrandModelAdapter extends TypeAdapter<BrandModel> {
  @override
  int get typeId => DbTypeId.brand;

  @override
  BrandModel read(BinaryReader reader) {
    return BrandModel(
      type: reader.read(),
      id: reader.read(),
      name: reader.read(),
      slug: reader.read(),
      status: reader.read(),
      image: reader.read(),
      icon: reader.read(),
      cover: reader.read(),
      itemsCount: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, BrandModel obj) {
    writer.write(obj.type);
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.slug);
    writer.write(obj.status);
    writer.write(obj.image);
    writer.write(obj.icon);
    writer.write(obj.cover);
    writer.write(obj.itemsCount);
  }
}