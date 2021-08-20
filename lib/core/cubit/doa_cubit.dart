
import 'package:bloc/bloc.dart';
import 'package:doaku/core/model/api_return_model.dart';
import 'package:doaku/core/model/doa_model.dart';
import 'package:doaku/core/model/response/post_berdoa.dart';
import 'package:doaku/core/model/response/post_doa.dart';
import 'package:doaku/core/service/services.dart';
import 'package:equatable/equatable.dart';

part 'doa_state.dart';

class DoaCubit extends Cubit<DoaState> {
  DoaCubit() : super(DoaUninitialized());

  Future<void> getDoa() async {
    ApiReturnValue<DoaModel> result = await DoaService.getDoa();
    if (result.value != null) {
      emit(GetDoaLoaded(result.value!));
    } else {
      emit(GetDoaFailed(result.value!.status!));
    }
  }

  Future<void> postDoa(
      String isiDoa,
      String idUser,
      ) async {
    ApiReturnValue<ResponsePostDoa> result =
    await DoaService.postDoa(isiDoa, idUser);
    if (result.value != null) {
      emit(PostDoaLoaded(result.value!));
    } else {
      emit(PostDoaFailed('Failed'));
    }
  }

  Future<void> postBerdoa(
      String idDoa,
      String idUser,
      ) async {
    ApiReturnValue<ResponsePostBerdoa> result =
    await DoaService.postBerdoa(idDoa, idUser );
    if (result.value != null) {
      emit(PostBerdoaLoaded());
      ApiReturnValue<DoaModel> result = await DoaService.getDoa();
      if (result.value != null) {
        emit(GetDoaLoaded(result.value!));
      } else {
        emit(GetDoaFailed(result.value!.status!));
      }
    } else {
      emit(PostBerdoaFailed('Failed'));
    }
  }
}

// class PostDoaCubit extends Cubit<PostDoaState> {
//   PostDoaCubit() : super(PostDoaLoading());
//
//
// }


