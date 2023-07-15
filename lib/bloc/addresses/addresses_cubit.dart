import 'package:adelco_user/repositories/Addresses/addresses_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Addresses/address_model.dart';
import '../../models/default_model.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial());
  static AddressesCubit get(context) => BlocProvider.of(context);
  final addressFormKey = GlobalKey<FormState>();

AddressModel? getAddressModel;
  getAddress() async {
    emit (GetAddressLoadingState());
    try {
      Map<String,dynamic> response = await AddressesRepository.getAddress();
      getAddressModel = AddressModel.fromJson(response);
      emit(GetAddressLoadedState());
    } catch (e) {
      emit(GetAddressErrorState());
      return Future.error(e);
    }
  }

  String? latitude;
  String? longitude;
  final TextEditingController street = TextEditingController();
  final TextEditingController blockName = TextEditingController();
  final TextEditingController apartmentName = TextEditingController();
  final TextEditingController specialMarque = TextEditingController();

DefaultModel? addAddressModel;
  addAddress() async {
    emit(AddAddressLoadingState());
    Map<String,String> formData = {
      "street_name" : street.text,
      "block_name": blockName.text,
      "apartment_name":apartmentName.text,
      "special_marque":specialMarque.text,
      "latitude":latitude ?? "",
      "longitude":longitude ?? ""
    };
    try{
      Map<String,dynamic> response = await AddressesRepository.addAddress(formData);
      addAddressModel = DefaultModel.fromJson(response);
      emit(AddAddressLoadedState());
    }catch(e){
      emit(AddAddressErrorState());
      return Future.error(e);
    }
  }
DefaultModel? removeAddressModel;
  removeAddress(String id) async {
    emit (RemoveAddressLoadingState());
    try {
      Map<String,dynamic> response = await AddressesRepository.removeAddress(id);
      removeAddressModel = DefaultModel.fromJson(response);
      emit(RemoveAddressLoadedState());
    } catch (e) {
      emit(RemoveAddressErrorState());
      return Future.error(e);
    }
  }

  DefaultModel? defaultAddressModel;
  defaultAddress(String id) async {
    emit (DefaultAddressLoadingState());
    try {
      Map<String,dynamic> response = await AddressesRepository.defaultAddress(id);
      defaultAddressModel = DefaultModel.fromJson(response);
      emit(DefaultAddressLoadedState());
    } catch (e) {
      emit(DefaultAddressErrorState());
      return Future.error(e);
    }
  }

DefaultModel? updateAddressModel;
  updateAddress(String id) async {
    emit(UpdateAddressLoadingState());
    Map<String,String> formData = {
      "street_name" : street.text,
      "block_name": blockName.text,
      "apartment_name":apartmentName.text,
      "special_marque":specialMarque.text,
      "latitude":latitude ?? "",
      "longitude":longitude ?? "",
      "id":id
    };
    try{
      Map<String,dynamic> response = await AddressesRepository.updateAddress(formData);
      updateAddressModel = DefaultModel.fromJson(response);
      emit(UpdateAddressLoadedState());
    }catch(e){
      emit(UpdateAddressErrorState());
      return Future.error(e);
    }
  }
}
