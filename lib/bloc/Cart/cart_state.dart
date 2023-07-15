part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class RemoveCartLoadingState extends CartState{}
class RemoveCartLoadedState extends CartState{}
class RemoveCartErrorState extends CartState{}

class UpdateCartLoadingState extends CartState{}
class UpdateCartLoadedState extends CartState{}
class UpdateCartErrorState extends CartState{}

class GetCartLoadingState extends CartState{}
class GetCartLoadedState extends CartState{}
class GetCartErrorState extends CartState{}

class RemoveAllCartLoadingState extends CartState{}
class RemoveAllCartLoadedState extends CartState{}
class RemoveAllCartErrorState extends CartState{}