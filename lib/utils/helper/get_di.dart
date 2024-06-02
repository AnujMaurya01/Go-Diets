import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/controller/registraterAccountDetails.dart';
import 'package:dietitian/repository/registration_repo.dart';
import 'package:get/get.dart';
import 'package:dietitian/controller/bottom_controller%20.dart';
import 'package:dietitian/repository/auth_repo.dart';
import 'package:dietitian/repository/home_repo.dart';
import 'package:dietitian/repository/profile_repo.dart';
import 'package:dietitian/utils/apis/api_client.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);
  Get.lazyPut(() => ApiClient(
        appBaseUrl: ApiConstants.baseUrl,
        sharedPreferences: Get.find(),
      ));
  Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);

  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() =>
      RegistrationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => HomeRepo(
        apiClient: Get.find(),
      ));

  Get.lazyPut(() => ProfiileRepo(
        apiClient: Get.find(),
      ));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserTransactionHistoryController());
  Get.lazyPut(() => RegisterController(registrationRepo: Get.find()));

  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}
