import 'package:bloc/bloc.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api_endpoints.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../features/login/data/local/local_data_source.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiManager apiManger;
  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();

  ProfileCubit({required this.apiManger}) : super(ProfileInitial());

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();
    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }
    return {'Authorization': 'Bearer $token'};
  }

  Future<void> logout() async {
    if (isClosed) return;
    emit(ProfileLoading());
    try {
      await apiManger.postData(
        endPoint: ApiEndpoints.logout,
        headers: await _authHeaders(),
      );
      if (!isClosed) emit(ProfileSuccess());
    } catch (e) {
      print('logout error: $e');
      if (!isClosed) emit(ProfileError(message: e.toString()));
    }
  }
}
