import 'dart:io';

import 'package:abayati/features/core/model/response/abstract_response.dart';
import 'package:abayati/features/core/model/response/measurement.dart';
import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/core/services/service/ai/datasource.dart';
import 'package:dartz/dartz.dart';

class AIRepository {
  final _datasource = AIDatasource();

  Future<Either<String, List<Product>>> search(String query) async {
    final output = await _datasource.search(query);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final products = (output.data as List)
          .map((product) => Product.fromJson(product))
          .toList();
      return Right(products);
    }
  }

  Future<Either<String, Measurement>> getMeasurement() async {
    final output = await _datasource.getMeasurement();
    if (output.error != null) {
      return Left(output.message!);
    } else {
      final measurement = Measurement.fromJson(output.data);
      return Right(measurement);
    }
  }

  Future<Either<String, AbstractResponse>> createMeasurements(
      {required String height,
      required String width,
      required File frontImage,
      required File sideImage}) async {
    final output = await _datasource.createMeasurements(
        height: height,
        width: width,
        frontImage: frontImage,
        sideImage: sideImage);
    if (output.error != null) {
      return Left(output.message!);
    } else {
      return Right(output);
    }
  }
}
