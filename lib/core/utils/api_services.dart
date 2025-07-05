import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required body,
    required String? token,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers:headers ?? {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
