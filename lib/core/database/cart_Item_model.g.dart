part of '../../features/cart/data_layer/models/sub_model/cart_item_model.dart';

class CartItemModelAdapter extends TypeAdapter<CartItemModel> {
  @override
  final int typeId = DbTypeId.cartItem;

  @override
  CartItemModel read(BinaryReader reader) {
    return CartItemModel(product: reader.read(), quantity: reader.read());
  }

  @override
  void write(BinaryWriter writer, CartItemModel obj) {
    writer.write(obj.product);
    writer.write(obj.quantity);
  }
}
