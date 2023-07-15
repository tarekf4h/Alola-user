import 'package:adelco_user/repositories/Orders/orders_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/default_model.dart';
import '../../models/order/orders_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
    static OrdersCubit get(context) => BlocProvider.of(context);


    OrdersModel? ordersModel ;
    getOrders() async {
    emit (GetOrdersLoadingState());
    try {
      Map<String,dynamic> response = await OrdersRepository.getOrders();
      ordersModel = OrdersModel.fromJson(response);
      emit(GetOrdersLoadedState());
    } catch (e) {
      emit(GetOrdersErrorState());
      return Future.error(e);
    }
  }
  DefaultModel? cancelModel;
    cancel(String id) async {
    emit (CancelLoadingState());
    try {
      Map<String,dynamic> response = await OrdersRepository.cancel(id);
      cancelModel = DefaultModel.fromJson(response);
      emit(CancelLoadedState());
    } catch (e) {
      emit(CancelErrorState());
      return Future.error(e);
    }
  }

  DefaultModel? reorderModel;
    reorder(String id , String addressId ,String deliveryDuration ,String note ,String promoCode ) async {
    emit (ReorderLoadingState());
      Map<String,String> formData = {
      "address_id" : addressId ,
      "delivery_duration":deliveryDuration ,
      "payment_method_id":"1",
      "delivery_notes":note,
      "discount_code":promoCode ,
      "id":id 
    };
    try {
      Map<String,dynamic> response = await OrdersRepository.reorder(formData);
      reorderModel = DefaultModel.fromJson(response);
      emit(ReorderLoadedState());
    } catch (e) {
      emit(ReorderErrorState());
      return Future.error(e);
    }
  }
  
  String? captainReview;
  String? deliveryTimeReview;
  String? deliverySpeedReview;
  String? productsReview;
  DefaultModel? reviewModel;
    review(String id) async {
    emit (ReviewLoadingState());
      Map<String,String> formData = {
      "captain_review" : captainReview ?? "" ,
      "delivery_time_review":deliveryTimeReview ?? "" ,
      "delivery_speed_review":deliverySpeedReview ?? "",
      "products_review":productsReview ?? "",
      "order_id":id 
    };
    try {
      Map<String,dynamic> response = await OrdersRepository.review(formData);
      reviewModel = DefaultModel.fromJson(response);
      emit(ReviewLoadedState());
    } catch (e) {
      emit(ReviewErrorState());
      return Future.error(e);
    }
  }
}
