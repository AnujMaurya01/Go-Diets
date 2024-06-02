import 'package:get/get.dart';
import 'package:dietitian/utils/apis/api_client.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  RegistrationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> createAccount(
      {String? name,
      String? age,
      String? dob,
      String? gender,
      String? address}) async {
    return apiClient.postData(ApiConstants.registration, {
      "step_1": 1,
      "name": name,
      "age": age,
      "date_of_birth": dob,
      "gender": gender,
      "address": address
    });
  }

  //this Stepper for two
  Future<Response> createAccount1(
      {String? profession,
      String? height,
      String? weight,
      String? bloodGroup,
      String? modeicalProblem,
      String? vitaminDeficiency,
      String? parentMedicalProblem,
      String? VegNonVeg,
      String? constipationProblem,
      String? gastritis,
      String? anyFoodAllgery}) async {
    return apiClient.postData(ApiConstants.registration, {
      "step_2": 1,
      "professional": profession,
      "height": height,
      "weight": weight,
      "blood_group": bloodGroup,
      "medical_problem": modeicalProblem,
      "any_vitamin_deficiency": vitaminDeficiency,
      "parents_medical_problem": parentMedicalProblem,
      "veg_non_veg": VegNonVeg,
      "constipation_problem": constipationProblem,
      "gastritis_problem": gastritis,
      "any_food_allergy": anyFoodAllgery
    });
  }

  //this Stepper for three
  Future<Response> createAccount2({
    String? eatingPattern,
    String? earlyMoring,
    String? breakFastMoring,
    String? midMorning,
    String? Lunch,
    String? teaTime,
    String? dinner,
    String? SleepTime,
    String? wakeTime,
    String? lastPeriod,
    String? waterIntake,
    String? workOut,
    String? alchohalintake,
  }) async {
    return apiClient.postData(ApiConstants.registration, {
      "step_3": 1,
      "eating_pattern": eatingPattern,
      "early_morning": earlyMoring,
      "break_fast": breakFastMoring,
      "mid_morning": midMorning,
      "lunch": Lunch,
      "tea_time": teaTime,
      "dinner": dinner,
      "sleep_time": SleepTime,
      "wake_up_time": wakeTime,
      "last_period_date": lastPeriod,
      "water_intake": waterIntake,
      "workout": workOut,
      "alcohol_intake": alchohalintake
    });
  }
}
