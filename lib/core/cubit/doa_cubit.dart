import 'package:bloc/bloc.dart';
import 'package:doaku/core/model/api_return_model.dart';
import 'package:doaku/core/model/doa_model.dart';
import 'package:doaku/core/service/services.dart';
import 'package:equatable/equatable.dart';

part 'doa_state.dart';

class DoaCubit extends Cubit<DoaState>{
  DoaCubit() : super(DoaLoading());
  Future<void> getDoa()async{
    ApiReturnValue<DoaModel> result =await ComproService.getDoa();
    if(result.value!=null){
      emit(DoaLoaded(result.value!));
    }else{
      emit(DoaFailed(result.value!.status!));
    }
  }
}
