import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';

final contactRepositoryProvider = Provider<ContactRepository>((ref) {
  return ContactRepository(ref.watch(dioProvider));
});

class ContactRepository {
  final Dio _dio;

  ContactRepository(this._dio);

  /// 개발자에게 문의 메일 전송
  Future<void> sendContact(String message) async {
    return apiCall(() async {
      await _dio.post(
        ApiEndpoints.contact,
        data: {'message': message},
      );
    });
  }
}
