class ApiConstants {
  //==== base url =====

  static const String baseUrl = 'https://godiet.aks.5g.in/api/';

  static const String login_Url = 'login';
  static const String registration = 'registration';
  static const String user = 'user';
  static const String getProfileUrl = 'user/me';
  static const String logout = 'logout';
  static const String admin_bank_details = 'admin-bank-details';
  static const String dietitian_details = 'dietitian-details';
  static const String audio_chat = 'user-chat-audio-video-history';
  static const String my_diet = 'my-diet';
  static const String transactionHistory = 'transaction-history';
  static const String weeklyMeasurements = 'save-weekly-measurements';
  static const String listWeeklyMeasurements = 'list-weekly-measurements';
  static const String listRemarks = 'list-remarks';
  static const String saveUserDietitianHistory = 'save-user-dietitian-history';
  static const String userAddToken = 'add-token';
  static const String feedbackapipost = 'feedback-save';
  static const String feedbackchanck = 'feedback-check';
  static const String savemedicalreport = 'save-medical-report';
  static const String viewmedicalreport = 'list-medical-report';
  static const String ratingpostapi = 'rating-save';

  /// https://godiet.aks.5g.in/api/logout
  //////https://godiet.aks.5g.in/api/dietitian/
  static const String dietitianLogin = 'dietitian/login';
  static const String dietitianUser = 'dietitian/user';
  static const String dietitianList = 'dietitian/client-list';
  static const String dietitianclient = 'dietitian/client-view-details';
  static const String viewDietitan = 'dietitian/view-user-remarks';
  static const String dietitianAudioChat =
      'dietitian/user-chat-audio-video-list';
  static const String addUserRemarks = 'dietitian/add-user-remarks';
  static const String dietitianWeeklyMeasurement =
      'dietitian/view-user-weekly-measurement';
  static const String saveUserDietitian =
      'dietitian/save-user-dietitian-history';
  static const String saveDietitianToken = 'dietitian/add-token';
  static const String doctorbraeck = 'dietitian/change-user-break';

  static const String detoxdietpostapi = 'dietitian/detox-diet-save';
  static const String detoxdietgetapi = 'dietitian/get-detox-diet';
  static const String doctormdeical = 'dietitian/user-medical-report';
  static const String detoxdietdeleteapiii = 'dietitian/delete-detox-diet';
  static const String doctorhistroy = 'dietitian/user-transaction-history';

  //https://godiet.aks.5g.in/api/do-and-dont-save
  static const String weeklypostdatata = 'dietitian/weekly-diet-save';
  static const String weeklygetdataa = 'dietitian/get-weekly-diet';
  static const String weeklydeletehistory = 'dietitian/delete-weekly-diet';
  //
  static const String codetempltepostdatata = 'dietitian/code-template-save';
  static const String codetempletegetdataa = 'dietitian/get-code-template';
  static const String codetempletedeletehistory =
      'dietitian/delete-code-template';
  static const String dondonttt = 'do-and-dont-save';
  static const String donotlistdataa = 'do-and-dont-list';
  static const String doctordondont = 'dietitian/do-and-dont-save';
  static const String dcotrlostss = 'dietitian/do-and-dont-list';

  static const String weeklyydietttnew = 'dietitian/weekly-diet-list';
  static const String specialdeiets = 'dietitian/special-diet-list';

  static const String weeklydietss = 'dietitian/assign-weekly-diet';
  static const String specialdeilss = 'dietitian/assign-special-diet';

  static const String userspecialdiets = 'my-special-diet';
  static const String editweeklyydietss = 'dietitian/save-weekly-diet';
  static const String editseciallyydietss = 'dietitian/save-special-diet';
  // docotr view templetre-=-=-=-=-=-=-=-=-=
  static const String weeklyydietsssdoctor = 'dietitian/view-weekly-diet';
  static const String specialllldeyislsssdocotr = 'dietitian/view-special-diet';

  ///
  static const int screenTransitionTime = 0;
  static const int catId = 0;

  static const String socialbaseUrl = 'https://dhxiinayr0zha.cloudfront.net/';

  //https://dhxiinayr0zha.cloudfront.net/
  /// Define App ID and Token
  static const appId = 'ee6e747d20a442ae91f49eb3c0cc0dd1';
  static const agoratoken =
      "006ee6e747d20a442ae91f49eb3c0cc0dd1IAAyY6HuwUrkNI9WZFpORmdJBw4Ov8X5Pnr8/J+cd8TNhB8wepq2yYmFIgB9J1nBSZgPZgQAAQDZVA5mAgDZVA5mAwDZVA5mBADZVA5m";
  static const String theme = 'theme';
  static const String token = 'token';
  static const String userId = 'user_id';
  static const String dietitianId = 'Dietitian_Id';
  static const String gender = 'Gender';
  static const String dietitian = 'dietitian';
  static const String Id = 'id';
  static const String Name = 'name';
  static const String number = 'number';
  static const String languageCode = 'language_code';
  static const String contryCode = 'country_code';
  //
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class UserInfo {
  String id = '';
  String name = '';

  UserInfo({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  UserInfo.empty();
}

UserInfo currentUser = UserInfo.empty();
const String cacheUserIDKey = 'cache_user_id_key';
const String cacheUserIDKeyName = 'cache_Name_key';
