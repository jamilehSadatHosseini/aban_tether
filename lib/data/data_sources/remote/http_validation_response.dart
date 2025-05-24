import 'package:aban_tether_app/core/error/exceptions.dart';
import 'package:dio/dio.dart';

mixin HttpResponseValidate {
  validate(Response<dynamic> response) {
    if (response.statusCode != 200) {
      throw ServerException(message: response.data['message']);
    }
  }
}
