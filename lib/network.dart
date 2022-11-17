import "package:dio/dio.dart";
import 'package:lessonlocal/login_request_model.dart';

abstract class WebService {
  Future<void> login(LoginRequestModel loginRequestModel);
}

class GlobalDio implements WebService {
  Dio dio = Dio(BaseOptions(baseUrl: "http://localhost:3000/"));

  @override
  Future login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await dio.post("posts", data: loginRequestModel);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      return error;
    }
  }
}
