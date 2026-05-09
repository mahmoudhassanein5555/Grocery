import 'meal_model.dart';

class MealsResponseModel {
  final bool success;
  final String message;
  final List<MealModel> data;

  MealsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MealsResponseModel.fromJson(Map<String, dynamic> json) {
    return MealsResponseModel(
      success: json['success'],
      message: json['message'],
      data: List<MealModel>.from(
        json['data'].map((e) => MealModel.fromJson(e)),
      ),
    );
  }
}
