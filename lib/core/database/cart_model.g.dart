part of '../../features/cart/data_layer/models/cart_model.dart';

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  int get typeId => DbTypeId.cart;

  @override
  CartModel read(BinaryReader reader) {
    return CartModel(
      products: reader
          .readList()
          .map((e) => CartItemModel.fromEntity(e))
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, CartModel object) {
    writer.writeList(object.products);
  }
}
