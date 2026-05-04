part of 'address_cubit.dart';

enum AddressStatus { initial, loading, loaded, error, add, update, delete }

@immutable
class AddressState {
  final AddressStatus status;
  final List<Marker>? markers;
  final LatLng? selectedLocation;
  final List<AddressEntity>? addresses;
  final String? errorMessage;
  final int? selectedAddressId;

  const AddressState({
    this.markers,
    this.selectedLocation,
    this.addresses,
    this.status = AddressStatus.initial,
    this.errorMessage,
    this.selectedAddressId,
  });

  AddressState copyWith({
    List<Marker>? markers,
    LatLng? selectedLocation,
    List<AddressEntity>? addresses,
    AddressStatus? status,
    String? errorMessage,
    int? selectedAddressId,
  }) {
    return AddressState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      addresses: addresses ?? this.addresses,
      markers: markers ?? this.markers,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
    );
  }
}
