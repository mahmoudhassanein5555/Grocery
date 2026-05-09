import 'package:bloc/bloc.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';
import 'package:grocery1/features/profile/presentation/cubit/setting/setting_state.dart';

class SettingCubit extends Cubit<SettingsState> {
  final ApiManager apiManger;
  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();

  SettingCubit({required this.apiManger}) : super(SettingsInitial());

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();
    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }
    return {'Authorization': 'Bearer $token'};
  }

  Future<void> deleteAccount() async {
    if (isClosed) return;
    emit(SettingsDeleteLoading());

    try {
      await apiManger.deleteData(
          endPoint: ApiEndpoints.deleteAccount, headers: await _authHeaders());

      // delete token
      //  await UserPreferences.clearToken();

      if (!isClosed) emit(SettingsDeleteSuccess());
    } catch (e) {
      print('delete account error : $e');
      if (!isClosed) emit(SettingsError(message: e.toString()));
    }
  }
}
