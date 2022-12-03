import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInit());
  static BottomNavCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  setCurrentIndex(index){
    currentIndex = index;
    emit(ChangeState());
  }

  int homeIndex = 0;
  setHomeIndex(index){
    homeIndex = index;
    emit(ChangeState());
  }

  int warehouseIndex = 0;
  setWarehouseIndex(index){
    warehouseIndex = index;
    emit(ChangeState());
  }

  
    int preparationIndex = 0;
  setPreparationIndex(index){
    preparationIndex = index;
    emit(ChangeState());
  }

   int reportsIndex = 0;
  setReportsIndex(index){
    reportsIndex = index;
    emit(ChangeState());
  }
}
