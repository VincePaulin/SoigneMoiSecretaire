import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';
import 'package:soigne_moi_secretaire/model/doctor.dart';

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

  Future<Map<String, dynamic>> fetchDoctorPresent() async {
    dio.options.baseUrl = AppConfig.baseUrl;

    try {
      final response = await dio.get(
        '/doctors-with-appointments-today',
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

  Future<List<Doctor>> fetchAllDoctors() async {
    dio.options.baseUrl = AppConfig.baseUrl;

    try {
      final response = await dio.get(
        '/doctors',
        options: await _generateOptions(),
      );

      final data = response.data['doctors'];

      // Assuming data is a list of JSON objects
      final List<Doctor> doctorList =
          (data as List<dynamic>).map((item) => Doctor.fromJson(item)).toList();

      return doctorList;
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
