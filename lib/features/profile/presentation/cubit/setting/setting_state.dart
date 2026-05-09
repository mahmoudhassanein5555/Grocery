abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsDeleteLoading extends SettingsState {}

class SettingsDeleteSuccess extends SettingsState {}

class SettingsError extends SettingsState {
  final String message;
  SettingsError({required this.message});
}
