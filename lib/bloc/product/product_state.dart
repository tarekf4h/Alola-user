part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class CategoryLoadingState extends ProductState{}
class CategoryLoadedState extends ProductState{}
class CategoryErrorState extends ProductState{}

class SubCategoryLoadingState extends ProductState{}
class SubCategoryLoadedState extends ProductState{}
class SubCategoryErrorState extends ProductState{}

class ProductsLoadingState extends ProductState{}
class ProductsLoadedState extends ProductState{}
class ProductsErrorState extends ProductState{}

class GetProductsDetailsLoadingState extends ProductState{}
class GetProductsDetailsLoadedState extends ProductState{}
class GetProductsDetailsErrorState extends ProductState{}

// class LoadingState extends ProductState{}
// class LoadedState extends ProductState{}
// class ErrorState extends ProductState{}

class HomeLoadingState extends ProductState{}
class HomeLoadedState extends ProductState{}
class HomeErrorState extends ProductState{}

class AddFavoriteLoadingState extends ProductState{}
class AddFavoriteLoadedState extends ProductState{}
class AddFavoriteErrorState extends ProductState{}

class RemoveFavoriteLoadingState extends ProductState{}
class RemoveFavoriteLoadedState extends ProductState{}
class RemoveFavoriteErrorState extends ProductState{}

class GetFavoriteLoadingState extends ProductState{}
class GetFavoriteLoadedState extends ProductState{}
class GetFavoriteErrorState extends ProductState{}