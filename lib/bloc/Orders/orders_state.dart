part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class ReorderLoadingState extends OrdersState{}
class ReorderLoadedState extends OrdersState{}
class ReorderErrorState extends OrdersState{}

class CancelLoadingState extends OrdersState{}
class CancelLoadedState extends OrdersState{}
class CancelErrorState extends OrdersState{}

class ReviewLoadingState extends OrdersState{}
class ReviewLoadedState extends OrdersState{}
class ReviewErrorState extends OrdersState{}

class GetOrdersLoadingState extends OrdersState{}
class GetOrdersLoadedState extends OrdersState{}
class GetOrdersErrorState extends OrdersState{}

class GetOrderDetailsLoadingState extends OrdersState{}
class GetOrderDetailsLoadedState extends OrdersState{}
class GetOrderDetailsErrorState extends OrdersState{}

class GetOrderStatusLoadingState extends OrdersState{}
class GetOrderStatusLoadedState extends OrdersState{}
class GetOrderStatusErrorState extends OrdersState{}