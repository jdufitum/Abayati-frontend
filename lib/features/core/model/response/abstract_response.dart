class AbstractResponse {
  final int? status;
  final dynamic data;
  final String? message;
  final String? error;

  AbstractResponse({
    this.status,
    this.data,
    this.message,
    this.error,
  });

  factory AbstractResponse.fromJson(Map<String, dynamic> json) =>
      AbstractResponse(
        status: json["status"],
        data: json["data"],
        message: json["message"],
        error: json["error"],
      );
}

AbstractResponse handleResponse(dynamic response) {
  return AbstractResponse.fromJson(response.data);
}
