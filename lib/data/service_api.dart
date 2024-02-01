import 'dart:convert';
import 'dart:ffi';
import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:flutter_ahlul_quran_app/data/model/detail_surah.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_model.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  final http.Client client;
  Apiservice({required this.client});

  Future<Either<String, List<SurahModel>>> getAllSurah() async {
    try {
      final response =
          await client.get(Uri.parse('https://equran.id/api/surat'));
      return Right(
        List<SurahModel>.from(
          jsonDecode(response.body).map(
            (x) => SurahModel.fromJson(x),
          ),  
        ).toList(),
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, DetailSurahModel>> getDetailSurah(
      Int nomorSurah) async {
    try {
      final response = await client
          .get(Uri.parse('https://equran.id/api/surat/$nomorSurah'));
      return Right(DetailSurahModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
