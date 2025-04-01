import 'package:abayati/features/core/model/response/abstract_response.dart';
import 'package:abayati/features/core/services/api/api_client.dart';
import 'package:abayati/features/core/services/api/endpoints.dart';

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
}
