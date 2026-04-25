part of '../../features/home/data_layer/models/sub_models/company_model.dart';

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  int get typeId => DbTypeId.company;

  @override
  CompanyModel read(BinaryReader reader) {
    return CompanyModel(
      id: reader.read(),
      name: reader.read(),
      description: reader.read(),
      city: reader.read(),
      country: reader.read(),
      image: reader.read(),
      isActive: reader.read(),
      type: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.city);
    writer.write(obj.country);
    writer.write(obj.image);
    writer.write(obj.isActive);
    writer.write(obj.type);
  }
}