part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class PlacementOrderLoadingState extends CheckoutState{}
class PlacementOrderLoadedState extends CheckoutState{}
class PlacementOrderErrorState extends CheckoutState{}


class ValidateCouponCodeLoadingState extends CheckoutState{}
class ValidateCouponCodeLoadedState extends CheckoutState{}
class ValidateCouponCodeErrorState extends CheckoutState{}