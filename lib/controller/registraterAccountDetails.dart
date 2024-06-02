import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/repository/registration_repo.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController implements GetxService {
  final RegistrationRepo registrationRepo;
  RegisterController({required this.registrationRepo});
  bool isLoading = false;
  RxBool isLoad = false.obs;
  String? gender;
  DateTime date = DateTime.now();
  DateTime AgeRange = DateTime.now();
  GlobalKey<FormState> formKeyStep1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyStep2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyStep3 = GlobalKey<FormState>();
  var DOB;
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final DateFormat dateFormats = DateFormat("yyyy-MM-dd");
  TextEditingController textName = TextEditingController();
  TextEditingController textAge = TextEditingController();
  TextEditingController textDOB = TextEditingController();
  TextEditingController textAddress = TextEditingController();

  ///this for Stepper two

  TextEditingController textProfession = TextEditingController();
  TextEditingController textHeight = TextEditingController();
  TextEditingController textWeight = TextEditingController();
  TextEditingController textBloodGroup = TextEditingController();
  TextEditingController textMedicalProblem = TextEditingController();
  TextEditingController textParentMedicalProblem = TextEditingController();
  TextEditingController textAnyVitaminDeficiency = TextEditingController();
  TextEditingController textVegNonVeg = TextEditingController();
  TextEditingController textConstipation = TextEditingController();
  TextEditingController textGastritis = TextEditingController();
  TextEditingController textAnyFood = TextEditingController();

  ///this for Stepper three

  TextEditingController textEatingPattern = TextEditingController();
  TextEditingController textEarlyMorning = TextEditingController();
  TextEditingController textBreakFast = TextEditingController();
  TextEditingController textMid = TextEditingController();
  TextEditingController textLunch = TextEditingController();
  TextEditingController textTeaTime = TextEditingController();
  TextEditingController textDinner = TextEditingController();
  TextEditingController textSleepTime = TextEditingController();
  TextEditingController textWakeTime = TextEditingController();
  TextEditingController textLastPeriod = TextEditingController();
  TextEditingController textWaterIntake = TextEditingController();
  TextEditingController textWorkout = TextEditingController();
  TextEditingController textAlchohal = TextEditingController();

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String? selectedGender;
  String? selectedVeg;
  RxString errorText = "".obs;
  RxString errorVeg = "".obs;
  /* handleSubmit() {

  }*/

  handleRadioValueChange(String? value) {
    selectedGender = value;
  }

  Future<void> saveStringToPrefs(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<Response> registerUser({
    BuildContext? context,
    String? name,
    String? age,
    String? dob,
    String? gender,
    String? address,
  }) async {
    isLoad.value = true;
    update();
    Response response = await registrationRepo.createAccount(
      name: name!.trim(),
      age: age!.trim(),
      dob: dob!.trim(),
      gender: gender!.trim(),
      address: address!.trim(),
    );
    if (response.statusCode == 200) {
      await saveStringToPrefs(ApiConstants.gender, gender.trim());
      isLoad.value = false;
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> registerUser1({
    BuildContext? context,
    String? profession,
    String? height,
    String? weight,
    String? bloodGroup,
    String? modeicalProblem,
    String? vitaminDeficiency,
    String? parentMedicalProblem,
    String? VegNonVeg,
    String? constipationProblem,
    String? gastritis,
    String? anyFoodAllgery,
  }) async {
    isLoad.value = true;
    update();
    Response response = await registrationRepo.createAccount1(
      profession: profession,
      height: height,
      weight: weight,
      bloodGroup: bloodGroup,
      modeicalProblem: modeicalProblem,
      vitaminDeficiency: vitaminDeficiency,
      parentMedicalProblem: parentMedicalProblem,
      VegNonVeg: VegNonVeg,
      constipationProblem: constipationProblem,
      gastritis: gastritis,
      anyFoodAllgery: anyFoodAllgery,
    );
    if (response.statusCode == 200) {
      isLoad.value = false;
      SmartDialog.dismiss();
    } else {
      isLoad.value = false;
      SmartDialog.dismiss();
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> registerUser2({
    required BuildContext context,
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
    isLoad.value = true;
    update();
    Response response = await registrationRepo.createAccount2(
      eatingPattern: eatingPattern,
      earlyMoring: earlyMoring,
      breakFastMoring: breakFastMoring,
      midMorning: midMorning,
      Lunch: Lunch,
      teaTime: teaTime,
      dinner: dinner,
      SleepTime: SleepTime,
      wakeTime: wakeTime,
      lastPeriod: lastPeriod,
      waterIntake: waterIntake,
      workOut: workOut,
      alchohalintake: alchohalintake,
    );
    if (response.statusCode == 200) {
      isLoad.value = false;
      Get.find<AuthController>().userDetail(context, isupdate: false);
      SmartDialog.dismiss();
    } else {
      isLoad.value = false;
      SmartDialog.dismiss();
    }
    SmartDialog.dismiss();
    update();
    return response;
  }
}
/*
UserName  ClassName*/
