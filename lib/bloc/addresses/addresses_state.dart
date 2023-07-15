part of 'addresses_cubit.dart';

@immutable
abstract class AddressesState {}

class AddressesInitial extends AddressesState {}

class AddAddressLoadingState extends AddressesState{}
class AddAddressLoadedState extends AddressesState{}
class AddAddressErrorState extends AddressesState{}


class RemoveAddressLoadingState extends AddressesState{}
class RemoveAddressLoadedState extends AddressesState{}
class RemoveAddressErrorState extends AddressesState{}


class UpdateAddressLoadingState extends AddressesState{}
class UpdateAddressLoadedState extends AddressesState{}
class UpdateAddressErrorState extends AddressesState{}


class GetAddressLoadingState extends AddressesState{}
class GetAddressLoadedState extends AddressesState{}
class GetAddressErrorState extends AddressesState{}

class DefaultAddressLoadingState extends AddressesState{}
class DefaultAddressLoadedState extends AddressesState{}
class DefaultAddressErrorState extends AddressesState{}
