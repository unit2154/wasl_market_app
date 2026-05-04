import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/entities/address_entity.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/usecases/add_address.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/usecases/delete_address.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/usecases/get_addresses.dart';
import 'package:wasl_market_app/features/addresses/domain_layer/usecases/update_address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(
    this.addAddressUseCase,
    this.getAddressesUseCase,
    this.deleteAddressUseCase,
    this.updateAddressUseCase,
  ) : super(const AddressState());

  final AddAddressUseCase addAddressUseCase;
  final GetAddressesUseCase getAddressesUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;
  final UpdateAddressUseCase updateAddressUseCase;

  void selectLocation(LatLng location) {
    emit(
      state.copyWith(
        status: AddressStatus.loaded,
        selectedLocation: location,
        markers: [
          Marker(point: location, child: const Icon(Icons.location_pin)),
        ],
      ),
    );
  }

  Future<void> getAddresses() async {
    debugPrint("Address cubit: getAddresses");
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final result = await getAddressesUseCase();
      result.fold(
        (l) {
          debugPrint("Address cubit failure: ${l.message}");
          emit(
            state.copyWith(
              status: AddressStatus.error,
              errorMessage: l.message,
            ),
          );
        },
        (r) {
          debugPrint("Address cubit loaded: ${r.length}");
          emit(state.copyWith(status: AddressStatus.loaded, addresses: r));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(status: AddressStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> addAddress(AddressEntity address) async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final result = await addAddressUseCase(address);
      result.fold(
        (l) => emit(
          state.copyWith(status: AddressStatus.error, errorMessage: l.message),
        ),
        (r) => emit(
          state.copyWith(
            status: AddressStatus.add,
            addresses: [...state.addresses!, r],
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AddressStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> deleteAddress(int id) async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final result = await deleteAddressUseCase(id);
      result.fold(
        (l) => emit(
          state.copyWith(status: AddressStatus.error, errorMessage: l.message),
        ),
        (r) => emit(
          state.copyWith(
            status: AddressStatus.delete,
            addresses: state.addresses?.where((e) => e.id != id).toList(),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AddressStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> updateAddress(AddressEntity address) async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final result = await updateAddressUseCase(address);
      result.fold(
        (l) => emit(
          state.copyWith(status: AddressStatus.error, errorMessage: l.message),
        ),
        (r) => emit(
          state.copyWith(
            status: AddressStatus.update,
            addresses: state.addresses
                ?.map((e) => e.id == address.id ? address : e)
                .toList(),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AddressStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
