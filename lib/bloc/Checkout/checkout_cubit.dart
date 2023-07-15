import 'package:adelco_user/repositories/Checkout/checkout_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/default_model.dart';
import '../../models/product/coupon_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  static CheckoutCubit get(context) => BlocProvider.of(context);
  DefaultModel? placementOrderModel;
  final TextEditingController note = TextEditingController();
  final TextEditingController promoCode = TextEditingController();
  String? addressId;
  String? deliveryDuration;
  String? promoCodeText;
  num? discount;

    placementOrder() async {
    emit (PlacementOrderLoadingState());
        Map<String,String> formData = {
      "address_id" : addressId ?? "",
      "delivery_duration":deliveryDuration ?? "",
      "payment_method_id":"1",
      "delivery_notes":note.text,
      "discount_code":promoCodeText ?? "" 
    };
    try {
      Map<String,dynamic> response = await CheckoutRepository.placementOrder(formData);
      placementOrderModel = DefaultModel.fromJson(response);
      emit(PlacementOrderLoadedState());
    } catch (e) {
      emit(PlacementOrderErrorState());
      return Future.error(e);
    }
  }

CouponModel? couponModel;
    coupon() async {
    emit (ValidateCouponCodeLoadingState());
    try {
      Map<String,dynamic> response = await CheckoutRepository.validateCouponCode(promoCode.text);
      couponModel = CouponModel.fromJson(response);
      emit(ValidateCouponCodeLoadedState());
    } catch (e) {
      emit(ValidateCouponCodeErrorState());
      return Future.error(e);
    }
  }
}
