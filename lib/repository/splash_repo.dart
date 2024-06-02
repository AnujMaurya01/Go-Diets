// import 'package:podcastapp/utils/apis/api_client.dart';

// import 'package:podcastapp/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashRepo {
//   ApiClient apiClient;
//   final SharedPreferences sharedPreferences;
//   SplashRepo({required this.sharedPreferences, required this.apiClient});

//   Future<bool> initSharedData() {
//     if (!sharedPreferences.containsKey(ApiConstants.TOKEN)) {
//       return sharedPreferences.setString(
//           ApiConstants.TOKEN, ApiConstants.TOKEN);
//     }

//     return Future.value(true);
//   }

//   Future<bool> removeSharedData() {
//     return sharedPreferences.clear();
//   }
// }
