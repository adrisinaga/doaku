import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:doaku/core/model/api_return_model.dart';
import 'package:doaku/core/model/doa_model.dart';
import 'package:doaku/core/service/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'doa_state.dart';

class DoaCubit extends Cubit<DoaState> {
  DoaCubit() : super(GetDoaLoading());

  Future<void> getDoa() async {
    ApiReturnValue<DoaModel> result = await DoaService.getDoa();
    if (result.value != null) {
      emit(GetDoaLoaded(result.value!));
    } else {
      emit(GetDoaFailed(result.value!.status!));
    }
  }
}

class PostDoaCubit extends Cubit<PostDoaState> {
  PostDoaCubit() : super(PostDoaLoading());

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
}
