import 'package:adelco_user/models/product/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/default_model.dart';
import '../../models/product/category_model.dart';
import '../../models/product/favorites_model.dart';
import '../../models/product/get_product_details_model.dart';
import '../../models/product/products_model.dart';
import '../../repositories/product/product_repository.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  // Category
  CategoryModel? categoryModel;
  getCategory() async {
    emit(CategoryLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.category();
      categoryModel = CategoryModel.fromJson(response);
      emit(CategoryLoadedState());
    } catch (e) {
      emit(CategoryErrorState());
      return Future.error(e);
    }
  }

  SubCategoryModel? subCategoryModel;
  getSubCategory(int id) async {
    emit(SubCategoryLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.subCategory(id);
      subCategoryModel = SubCategoryModel.fromJson(response);
      emit(SubCategoryLoadedState());
    } catch (e) {
      emit(SubCategoryErrorState());
      return Future.error(e);
    }
  }
  // Products
  ProductsModel? productsModel;
  final TextEditingController search= TextEditingController();
  products(int page,String? categoryId , String? subCategoryId , String? productNumber , String? search) async {
    emit (ProductsLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.products(page, productNumber ?? "", categoryId ?? "", subCategoryId ?? "", search ?? "");
      productsModel = ProductsModel.fromJson(response);
      emit(ProductsLoadedState());
    } catch (e) {
      emit(ProductsErrorState());
      return Future.error(e);
    }
  }
  // CheckProduct
  GetProductDetailsModel?  getProductDetailsModel;
  getProductsDetails(String productNumber) async {
    emit (GetProductsDetailsLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.getProductsDetails(productNumber);
      getProductDetailsModel = GetProductDetailsModel.fromJson(response);
      emit(GetProductsDetailsLoadedState());
    } catch (e) {
      emit(GetProductsDetailsErrorState());
      return Future.error(e);
    }
  }

  HomeModel?  homeModel;
  home() async {
    emit (HomeLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.home();
      homeModel = HomeModel.fromJson(response);
      emit(HomeLoadedState());
    } catch (e) {
      emit(HomeErrorState());
      return Future.error(e);
    }
  }


FavoritesModel? favoritesModel;
  getFavorites() async {
    emit (GetFavoriteLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.getFavorite();
      favoritesModel = FavoritesModel.fromJson(response);
      emit(GetFavoriteLoadedState());
    } catch (e) {
      emit(GetFavoriteErrorState());
      return Future.error(e);
    }
  }
DefaultModel? addFavoriteModel;
  addFavorite(String id) async {
    emit (AddFavoriteLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.addFavorite(id);
      addFavoriteModel = DefaultModel.fromJson(response);
      emit(AddFavoriteLoadedState());
    } catch (e) {
      emit(AddFavoriteErrorState());
      return Future.error(e);
    }
  }

DefaultModel? removeFavoriteModel;
  removeFavorite(String id) async {
    emit (RemoveFavoriteLoadingState());
    try {
      Map<String,dynamic> response = await ProductRepository.removeFavorite(id);
      removeFavoriteModel = DefaultModel.fromJson(response);
      emit(RemoveFavoriteLoadedState());
    } catch (e) {
      emit(RemoveFavoriteErrorState());
      return Future.error(e);
    }
  }

}
