class BaseResponse {
  bool? _success;
  int? _status;
  String? _message;
  Map<String, dynamic>? _errors;

  bool? get success => _success;
  int? get status => _status;

  String? get message => _message;
  Map<String, dynamic>? get errors => _errors;

  BaseResponse({
    int? status,
    bool? success,
    String? message,
    Map<String, dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _errors = errors;
    _status = status;
  }

  BaseResponse.fromJson(dynamic json) {
    if (json is Map) {
      _status = json["status"] as int?;
      _success = json["success"] as bool?;
      _message = json["message"] as String?;
      _errors = json["errors"] as Map<String, dynamic>?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["success"] = _success;
    map["message"] = _message;
    map["errors"] = _errors;
    map["status"] = _status;
    return map;
  }
}
