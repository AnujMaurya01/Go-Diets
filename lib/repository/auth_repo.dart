import 'package:get/get.dart';
import 'package:dietitian/utils/apis/api_client.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login({String? number, String? firebaseotp}) async {
    return apiClient.postData(ApiConstants.login_Url,
        {"step_0": "1", "mobile_no": number, "firebase_otp": firebaseotp});
  }

  Future<Response> dietitianList({String? number}) async {
    return apiClient.postData(ApiConstants.dietitianList, {});
  }

  Future<Response> feedbackkklistdataa() async {
    return apiClient.getData(
      ApiConstants.feedbackchanck,
    );
  }

  Future<Response> addUserRemarks(
      {String? addRemarks,
      String? addSpecialInstrction,
      String? formattedDate,
      String? p_userId}) async {
    return apiClient.postData(ApiConstants.addUserRemarks, {
      "p_user_id": p_userId,
      "remarks": addRemarks,
      "special_instruction": addSpecialInstrction,
      "remarks_date": formattedDate,
    });
  }

  Future<Response> LogoutPage({String? number}) async {
    return apiClient.postData(ApiConstants.logout, {});
  }

  Future<Response> dietitianLogin({String? number, String? password}) async {
    return apiClient.postData(
        ApiConstants.dietitianLogin, {"user_id": number, "password": password});
  }

  Future<Response> feedbackpostapiii(
      {String? shareprogram, String? message}) async {
    return apiClient.postData(ApiConstants.feedbackapipost,
        {"share_program": shareprogram, "message": message});
  }

  Future<Response> ratingpostapiii({double? rating, String? duserid}) async {
    return apiClient.postData(ApiConstants.ratingpostapi,
        {"rating": rating, "d_user_id": duserid, "comment": 'comment'});
  }

  Future<Response> dietitianFCMToken({String? token}) async {
    return apiClient.postData(ApiConstants.saveDietitianToken, {
      "app_token": token,
    });
  }

  Future<Response> userFCMToken({String? token}) async {
    return apiClient.postData(ApiConstants.userAddToken, {
      "app_token": token,
    });
  }

  Future<Response> dietitianDetails({int? page, String? filtername}) async {
    return apiClient.postData(
        ApiConstants.dietitianList, {'page': page, 'name': filtername});
  }

  Future<Response> chatAudioHistoryDetails({int? page}) async {
    return apiClient.postData(ApiConstants.audio_chat, {
      "page": page,
    });
  }

  Future<Response> weeklyydocotordietsss(
      {String? templeteidd, String? puseridd}) async {
    return apiClient.postData(ApiConstants.weeklyydietsssdoctor,
        {"diet_template_id": templeteidd, "p_user_id": puseridd});
  }

  Future<Response> specaillldocotordietsss(
      {String? templeteidd, String? puseridd}) async {
    return apiClient.postData(ApiConstants.specialllldeyislsssdocotr,
        {"special_diet_id": templeteidd, "p_user_id": puseridd});
  }

  Future<Response> chatAudioHistoryDietitian({int? page}) async {
    return apiClient.postData(ApiConstants.dietitianAudioChat, {'page': page});
  }

  Future<Response> myDiet() async {
    return apiClient.postData(ApiConstants.my_diet, {});
  }

  Future<Response> userspeciallmyDiet() async {
    return apiClient.postData(ApiConstants.userspecialdiets, {});
  }

//
  Future<Response> weeklydeits() async {
    return apiClient.postData(ApiConstants.weeklyydietttnew, {});
  }

//
  Future<Response> specialdietssss() async {
    return apiClient.postData(ApiConstants.specialdeiets, {});
  }

  Future<Response> transactionHistory({int? page}) async {
    return apiClient.postData(ApiConstants.transactionHistory, {'page': page});
  }

  Future<Response> listWeeklyMeasurements({int? page}) async {
    return apiClient
        .postData(ApiConstants.listWeeklyMeasurements, {'page': page});
  }

  Future<Response> listRemarks({String? dititianID}) async {
    return apiClient
        .postData(ApiConstants.listRemarks, {"d_user_id": dititianID});
  }

  ///
  Future<Response> doctorbraeckkk(
      {String? dititianID, String? statuess}) async {
    return apiClient.postData(ApiConstants.doctorbraeck,
        {"p_user_id": dititianID, "break_status": statuess});
  }

/////////-==--=-==-=-=-==-==-=-=-=-=-=-=-=-=-=-=-=-=-==-=--
  Future<Response> detoxxposttt(
      {String? templateename, String? contentt}) async {
    return apiClient.postData(ApiConstants.detoxdietpostapi,
        {"template_name": templateename, "content": contentt});
  }

  Future<Response> weeklyyposttt(
      {String? templateename, String? contentt}) async {
    return apiClient.postData(ApiConstants.weeklypostdatata,
        {"template_name": templateename, "content": contentt});
  }

  Future<Response> dondonttt(
      {String? questionn, String? dseridd, String? answer}) async {
    return apiClient.postData(ApiConstants.dondonttt, {
      "question": questionn,
      //"d_user_id": dseridd,
      "answer": answer
    });
  }

  Future<Response> weeeklyypostss({
    String? weeklyidddd,
    String? puseriddd,
  }) async {
    return apiClient.postData(ApiConstants.weeklydietss,
        {"weekly_template_id": weeklyidddd, "p_user_id": puseriddd});
  }

  Future<Response> speciakldietsss({
    String? weeklyidddd,
    String? puseriddd,
  }) async {
    return apiClient.postData(ApiConstants.specialdeilss,
        {"special_template_id": weeklyidddd, "p_user_id": puseriddd});
  }

  Future<Response> doctorrdondonttt(
      {String? answer, String? pseridd, String? question}) async {
    return apiClient.postData(ApiConstants.doctordondont,
        {"answer": answer, "p_user_id": pseridd, "question": question});
  }
  //doctordondont

  Future<Response> codetempelteposttt(
      {String? templateename, String? contentt}) async {
    return apiClient.postData(ApiConstants.codetempltepostdatata,
        {"template_name": templateename, "content": contentt});
  }

  Future<Response> detoxgetdatataa({int? page}) async {
    return apiClient.getData(
      ApiConstants.detoxdietgetapi,
    );
  }

  Future<Response> weeklyygetdatataa({int? page}) async {
    return apiClient.getData(
      ApiConstants.weeklygetdataa,
    );
  }

  Future<Response> codetempletegetdatataa({int? page}) async {
    return apiClient.getData(
      ApiConstants.codetempletegetdataa,
    );
  }

  Future<Response> donodonn({int? page}) async {
    return apiClient.getData(
      ApiConstants.donotlistdataa,
    );
  }
//  Future<Response> doctoreedonodonn({int? page}) async {
//     return apiClient.getData(
//       ApiConstants.dcotrlostss,
//     );
//   }

  Future<Response> doctoreedonodonn(
      {String? pusertid, String? contentt}) async {
    return apiClient.postData(ApiConstants.dcotrlostss, {
      "p_user_id": pusertid,
    });
  }

//
  Future<Response> doctorrrpayhistory() async {
    return apiClient.getData(
      ApiConstants.doctorhistroy,
    );
  }

  Future<Response> viewreportttt() async {
    return apiClient.getData(
      ApiConstants.viewmedicalreport,
    );
  }

  Future<Response> doctorviewMedicalt(
      {String? pusertid, String? contentt}) async {
    return apiClient.postData(ApiConstants.doctormdeical, {
      "p_user_id": pusertid,
    });
  }

  Future<Response> detoxxdeleete({int? id, String? contentt}) async {
    return apiClient.postData(ApiConstants.detoxdietdeleteapiii, {
      "id": id,
    });
  }

  Future<Response> weeklyydeleete({int? id, String? contentt}) async {
    return apiClient.postData(ApiConstants.weeklydeletehistory, {
      "id": id,
    });
  }

  Future<Response> codetempletedeleete({int? id, String? contentt}) async {
    return apiClient.postData(ApiConstants.codetempletedeletehistory, {
      "id": id,
    });
  }

  Future<Response> dietitianWeeklyMeasurement(
      {String? dititianID, int? page}) async {
    return apiClient.postData(ApiConstants.dietitianWeeklyMeasurement,
        {"patient_user_id": dititianID, "page": page});
  }

  Future<Response> weeklyMeasurements() async {
    return apiClient.postData(ApiConstants.weeklyMeasurements, {
      "chest_bust": "",
      "waist": "",
      "hip": "",
      "arms": "",
    });
  }

  Future<Response> saveUserChatHistory(
      {String? type, String? userID, String? time, String? dietitianID}) async {
    return apiClient.postData(ApiConstants.saveUserDietitianHistory, {
      "d_user_id": dietitianID,
      "p_user_id": userID,
      "conversation_type": type,
      "start_date_time": time,
    });
  }

  Future<Response> saveUserDietitian(
      {String? type, String? userID, String? time, String? dietitianID}) async {
    return apiClient.postData(ApiConstants.saveUserDietitian, {
      "d_user_id": dietitianID,
      "p_user_id": userID,
      "conversation_type": type,
      "start_date_time": time,
    });
  }

  Future<Response> dietitianUsreDetails({String? id}) async {
    return apiClient
        .postData(ApiConstants.dietitianclient, {"patient_user_id": id});
  }

  Future<Response> viewDietitan({String? id}) async {
    return apiClient.postData(ApiConstants.viewDietitan, {"p_user_id": id});
  }

  Future<Response> verifyNumber({String? number, String? OTP}) async {
    return apiClient.postData(ApiConstants.login_Url,
        {"step_0": "1", "mobile_no": number, "otp": OTP});
  }

  Future<Response> userDetails() async {
    return apiClient.postData(ApiConstants.user, {});
  }

  Future<Response> adminBankDetails() async {
    return apiClient.postData(ApiConstants.admin_bank_details, {});
  }

  Future<Response> dietitian_details() async {
    return apiClient.postData(ApiConstants.dietitian_details, {});
  }

  Future<Response> dietitianUser() async {
    return apiClient.postData(ApiConstants.dietitianUser, {});
  }

  /* Future<Response> forgotPassword({
    String? emailId,
  }) async {
    return apiClient.postData(ApiConstants.forgotpassword, {
      "email": emailId,
    });
  }*/

/*  Future<Response> forgotVerify({
    String? token,
    String? newPassword,
  }) async {
    return apiClient.postData(ApiConstants.forgotVerify, {
      "forgot_token": token,
      "new_password": newPassword,
    });
  }*/
  String? getNumberId() {
    return sharedPreferences.getString(ApiConstants.number);
  }

  String? getGender() {
    return sharedPreferences.getString(ApiConstants.gender);
  }

  String? getUserToken() {
    return sharedPreferences.getString(ApiConstants.token);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token.toString();
    apiClient.updateHeader(token.toString());
    return await sharedPreferences.setString(
        ApiConstants.token, token.toString());
  }

  Future<bool> saveUserId(String userId) async {
    return await sharedPreferences.setString(ApiConstants.userId, userId);
  }

  Future<bool> saveDietitianId(String userId) async {
    return await sharedPreferences.setString(ApiConstants.dietitianId, userId);
  }

  Future<bool> saveGender(String userId) async {
    return await sharedPreferences.setString(ApiConstants.gender, userId);
  }

  Future<bool> saveDietitian(String userId) async {
    return await sharedPreferences.setString(ApiConstants.dietitian, userId);
  }

  Future<bool> saveId(String userId) async {
    return await sharedPreferences.setString(ApiConstants.Id, userId);
  }

  Future<bool> saveName(String userId) async {
    // apiClient.userID = userId;
    // apiClient.userId(userId);
    return await sharedPreferences.setString(ApiConstants.Name, userId);
  }

  Future<bool> saveNumber(String userId) async {
    // apiClient.userID = userId;
    // apiClient.userId(userId);
    return await sharedPreferences.setString(ApiConstants.number, userId);
  }

  String? getUserId() {
    return sharedPreferences.getString(ApiConstants.userId);
  }

  String? getdietician_id() {
    return sharedPreferences.getString(ApiConstants.dietitianId);
  }

  String? getName() {
    return sharedPreferences.getString(ApiConstants.Name);
  }

  String? getID() {
    return sharedPreferences.getString(ApiConstants.Id);
  }

  String? getDietitian() {
    return sharedPreferences.getString(ApiConstants.dietitian);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(ApiConstants.token);
  }

  void removeUserToken() async {
    await sharedPreferences.remove(ApiConstants.token);
  }

  void removedietitian() async {
    await sharedPreferences.remove(ApiConstants.dietitian);
  }
}
