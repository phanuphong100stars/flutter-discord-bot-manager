import 'package:dio/dio.dart';

abstract class Api<T> {
  static const String supabaseUrl = 'https://your-supabase-url.com';
  static const String supabaseKey = 'your-supabase-api-key';

  final Dio _dio = Dio(BaseOptions(
    baseUrl: supabaseUrl,
    headers: {
      'Content-Type': 'application/json',
      'apikey': supabaseKey,
    },
  ));

  Future<List<T>> getAll(String path) async {
    try {
      Response response = await _dio.get(path);
      return _handleListResponse(response);
    } catch (e) {
      throw Exception('Failed to load data. Error: $e');
    }
  }

  Future<T> getById(String path, String id) async {
    try {
      Response response = await _dio.get('$path/$id');
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to load data by ID. Error: $e');
    }
  }

  Future<T> create(String path, T data) async {
    try {
      Response response = await _dio.post(path, data: data);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to create data. Error: $e');
    }
  }

  Future<void> delete(String path, String id) async {
    try {
      Response response = await _dio.delete('$path/$id');
      if (response.statusCode == 200) {
        print('Item deleted successfully');
      } else {
        throw Exception(
            'Failed to delete item. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting item: $e');
    }
  }

  Future<T> update(String path, String id, T data) async {
    try {
      Response response = await _dio.put('$path/$id', data: data);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to update data. Error: $e');
    }
  }

  List<T> _handleListResponse(Response response) {
    if (response.statusCode == 200) {
      List<dynamic> dataList = response.data as List<dynamic>;
      return dataList.map((itemData) => _fromJson(itemData)).toList();
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  T _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return _fromJson(response.data);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  T _fromJson(Map<String, dynamic> json);
}
