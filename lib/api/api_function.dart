import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';

class Api {
  final dio = Dio();

  // Function to generate options with authentication token and JSON acceptance
  Future<Options> _generateOptions() async {
    final token = await _getToken();
    return Options(headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
  }

  // How to retrieve the token
  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      throw 'Token not found';
    }
    return token;
  }

  Future<Map<String, dynamic>> fetchOngoingStays() async {
    dio.options.baseUrl = AppConfig.baseUrl;

    try {
      final response = await dio.get(
        '/secretary/ongoing-stays',
        options: await _generateOptions(),
      );

      final data = response.data;

      return data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw 'Erreur de réseau';
      }
      final errorMessage =
          e.response?.data['error'] ?? e.response?.data['message'];
      throw errorMessage;
    } catch (e) {
      throw 'Erreur de réseau';
    }
  }

  Future<Map<String, dynamic>> fetchUserFolder(String id) async {
    dio.options.baseUrl = AppConfig.baseUrl;

    try {
      final response = await dio.get(
        '/user-details',
        queryParameters: {'user_id': id},
        options: await _generateOptions(),
      );

      final data = response.data;

      return data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw 'Erreur de réseau';
      }
      final errorMessage =
          e.response?.data['error'] ?? e.response?.data['message'];
      throw errorMessage;
    } catch (e) {
      throw 'Erreur de réseau';
    }
  }
}
