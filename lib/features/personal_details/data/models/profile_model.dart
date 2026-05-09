import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    super.username,
    super.firstname,
    super.lastname,
    super.email,
    super.phone,
    super.countryCode,
    super.preferredLanguage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data']['me']; // ← المشكلة هنا — البيانات جوا data.me
    return ProfileModel(
      username: data['username'],
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      phone: data['phone'],
      countryCode: data['country_code'],
      preferredLanguage: data['preferred_languages'] != null &&
              (data['preferred_languages'] as List).isNotEmpty
          ? data['preferred_languages'][0]
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
      'preferred_languages[0]': preferredLanguage,
    };
  }
}
