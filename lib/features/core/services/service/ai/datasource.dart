import 'dart:io';

import 'package:abayati/features/core/model/response/abstract_response.dart';
import 'package:abayati/features/core/services/api/api_client.dart';
import 'package:abayati/features/core/services/api/endpoints.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:dio/dio.dart';

class AIDatasource {
  final _client = ApiClient();

  Future<AbstractResponse> search(String query) async {
    try {
      final response =
          await _client.post(Endpoints.search, data: {"query": query});
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> getMeasurement() async {
    try {
      final response = await _client.get(Endpoints.getMeasurement);
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }

  Future<AbstractResponse> createMeasurements(
      {required String height,
      required String width,
      required File frontImage,
      required File sideImage}) async {
    try {
      final response = await _client.sendFormData(Endpoints.createMeasurements,
          formData: FormData.fromMap({
            'name': globals.user!.username,
            'gender': 'male',
            'height': height,
            'width': width,
            'front_image': await MultipartFile.fromFile(frontImage.path,
                filename: frontImage.path.split('/').last),
            'side_image': await MultipartFile.fromFile(sideImage.path,
                filename: sideImage.path.split('/').last),
          }));
      final output = handleResponse(response);
      return output;
    } catch (e) {
      rethrow;
    }
  }
}
