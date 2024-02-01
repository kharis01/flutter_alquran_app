import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/data/model/detail_surah.dart';
import 'package:flutter_ahlul_quran_app/data/service_api.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(
    this.apiservice
  ) : super(AyatInitial());

  final Apiservice apiservice;

  void getDetailSurah(Int noSurah) async {
    emit(AyatLoading());
    final result = await apiservice.getDetailSurah(noSurah);

    result.fold(
    (l) => emit(AyatError(message: l)), 
    (r) => emit(Ayatloaded(detail: r)));
  }
}
