import 'package:adelco_user/repositories/Cart/cart_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Cart/cart_model.dart';
import '../../models/default_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
    static CartCubit get(context) => BlocProvider.of(context);

    CartModel?  cartModel;
    getCart() async {
    emit (GetCartLoadingState());
    try {
      Map<String,dynamic> response = await CartRepository.getCart();
      cartModel = CartModel.fromJson(response);
      emit(GetCartLoadedState());
    } catch (e) {
      emit(GetCartErrorState());
      return Future.error(e);
    }
  }

  DefaultModel? removeCartModel;
  removeCart(String id) async {
    emit (RemoveCartLoadingState());
    try {
      Map<String,dynamic> response = await CartRepository.removeCart(id);
      removeCartModel = DefaultModel.fromJson(response);
      emit(RemoveCartLoadedState());
    } catch (e) {
      emit(RemoveCartErrorState());
      return Future.error(e);
    }
  }
  DefaultModel? updateCartModel;
  updateCart(int id , int quantity) async {
    emit (UpdateCartLoadingState());
    try {
      Map<String,dynamic> response = await CartRepository.updateCart(id, quantity);
      updateCartModel = DefaultModel.fromJson(response);
      emit(UpdateCartLoadedState());
    } catch (e) {
      emit(UpdateCartErrorState());
      return Future.error(e);
    }
  }

  
    DefaultModel? removeAllModel;
  removeAll() async {
    emit (RemoveAllCartLoadingState());
    try {
      Map<String,dynamic> response = await CartRepository.removeAll();
      removeAllModel = DefaultModel.fromJson(response);
      emit(RemoveAllCartLoadedState());
    } catch (e) {
      emit(RemoveAllCartErrorState());
      return Future.error(e);
    }
  }
}
