import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/utils/dimensions.dart';
import 'package:dietitian/utils/style.dart';
import 'package:dietitian/view_model/BankDetailsInfo.dart';
import 'package:dietitian/view_model/ChatAudioHistsoryModel.dart';
import 'package:dietitian/view_model/ClientListModel.dart';
import 'package:dietitian/view_model/RemarksSpecialInstruction.dart';
import 'package:dietitian/view_model/TransationHistoryModel.dart';
import 'package:dietitian/view_model/WeeklyPicture.dart';
import 'package:dietitian/view_model/code_templatemodel.dart';
import 'package:dietitian/view_model/detox.dart';
import 'package:dietitian/view_model/doctor_history.dart';
import 'package:dietitian/view_model/doctordont.dart';
import 'package:dietitian/view_model/doctormodel.dart';
import 'package:dietitian/view_model/dondont.dart';
import 'package:dietitian/view_model/user_mdeical.dart';
import 'package:dietitian/view_model/viewreportModel.dart';
import 'package:dietitian/view_model/weeklymodel.dart';
import 'package:dietitian/widget/AppLifecycleObserver.dart';
import 'package:http/http.dart' as http;
import 'package:dietitian/repository/auth_repo.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/apis/api_checker.dart';
import 'package:dietitian/view_model/DieititanUserDeatils.dart';
import 'package:dietitian/view_model/ProfileDetails.dart';
import 'package:dietitian/views/screen/auth/CraeteNewDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

import '../chatApp/chatMessageFuntion.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  ClientList? clientList;
  List<ClientData> clientData = [];
//
  DetoxListModel? detoxlist;
  List<DetoxxmodelList> detoxlistdatata = [];
  ViewReportModel? viewreport;
  List<ViewMedicalLidtdataa> viewreportlistdataaa = [];
  List<DoctorPaymemtHistory> doctorhistory = [];
//
  WeeklyDietModel? weeklydiet;
  List<WeeklyDietModelList> weeklydietlistdataa = [];
  CodeTempleteDietModel? codetempleteee;
  List<CodeTempleteDataList> codetempletelistdataa = [];
  //
  DonDontModel? dondontt;
  List<DontListdata> dopntlistdataa = [];

  DonDontdoctorModel? doctordonttt;
  List<DoctorDontListData> doctordontlidtdataa = [];
  //DoctorDontListData
  ViewdoctorMedicalModel? doctorlist;
  List<DcotorMedicaldata> doctorlistdataaa = [];

  UserMedicalReport? usermedicalreport;
  List<UserMedicalReportdata> usermedicalreportlistdata = [];
//
  RemarksDataSpecialView? remarksDataSpecialView;
  List<RemarksData> remarksData = [];
  ChatAudioHistory? chatAudioModel;
  List<ChatData> chatData = [];
  final _lastSeen = "".obs;
  final _InChatSeen = "".obs;
  final _MessageChatAcess = "".obs;
  final _tokenValue = "".obs;
  String get lastSeen => _lastSeen.value;
  String get InChatSeen => _InChatSeen.value;
  String get messageComeFromUSer => _MessageChatAcess.value;
  String get tokenValue => _tokenValue.value;
  set lastSeen(String lastseen) {
    _lastSeen.value = lastseen;
    update();
  }

  set InChatSeen(String lastseen) {
    _InChatSeen.value = lastseen;
    update();
  }

  set messageComeFromUSer(String lastseen) {
    _MessageChatAcess.value = lastseen;
    update();
  }

  set tokenValue(String lastseen) {
    _tokenValue.value = lastseen;
    update();
  }

  TransactionHistory? transactionHistory;
  List<TransactionData> transactionData = [];
  List<Data> dietitianWeekly = [];
  var isLoading = false.obs;
  var isAllLoaded = false.obs;
  WeeklyPicture? weeklyPicture;
  Map<String, dynamic>? Mydite;
  Map<String, dynamic>? viewweeklyyassing;
  Map<String, dynamic>? specailviewdetss;

  Map<String, dynamic>? userspeciallMydite;

  //
  Map<String, dynamic> weeklydietss = {};
  Map<String, dynamic> specialdietssplan = {};

  RxBool isLoad = false.obs;
  RxString UserName = "".obs;
  RxString media_count = "".obs;
  var imageupload;
  ProfileDetails? _profileDetails;
  BankDetailsInfo? _bankDetailsInfo;
  UserDetails? _userdetails;
  late List<VideoPlayerController?> videoControllers;
  late List<VideoPlayerController?> videoController;
  UserDetails? get userDetails => _userdetails;
  BankDetailsInfo? get bankDetailsInfo => _bankDetailsInfo;
  ProfileDetails? get profileDetails => _profileDetails;
  get user {
    return _userdetails;
  }

  get bankInfo {
    return _bankDetailsInfo;
  }

  get users {
    return _profileDetails;
  }

  Map<String, dynamic>? Listdata;
  TextEditingController textNewPassword = TextEditingController();
  TextEditingController textOldPassword = TextEditingController();
  TextEditingController textNewConfirmPassword = TextEditingController();
  RxList<dynamic> mediaData = [].obs;
  List weeekeleyyyd = [];
  List specialdietsss = [];

  ///Weekly Data mAnage Form TextEditController Value
  TextEditingController textChestBust = TextEditingController();
  TextEditingController textWaist = TextEditingController();
  TextEditingController textHip = TextEditingController();
  TextEditingController textARMS = TextEditingController();
  TextEditingController weighttt = TextEditingController();

  TextEditingController textUploadPicture = TextEditingController();

  ////    Add Remarks Details/////=======T
  TextEditingController textAddRemarks = TextEditingController();
  TextEditingController textAddSpecialData = TextEditingController();
  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Login Api==================================
  Future<Response> login({
    required BuildContext context,
    String? number,
    String? firebaseotp,
  }) async {
    isLoad.value = true;
    update();
    Response response = await authRepo.login(
      number: number!.trim(),
      firebaseotp: firebaseotp,
    );
    if (response.statusCode == 200) {
      Get.find<AuthController>().sendNmber(
        context: context,
        number: number,
        OTP: firebaseotp,
      );
      // Get.to(OTPScreen(number: number));
      isLoad.value = false;
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoad.value = false;
    }
    isLoad.value = false;
    update();
    return response;
  }

  // profile form  list api  ==========
  Future<Response?> getUserFormDetails(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isupdate = true;

    Response response = await authRepo.dietitianList();

    if (response.statusCode == 200) {
      isupdate = false;
    } else {
      isupdate = false;
      ApiChecker.checkApi(response);
    }

    update();
    return response;
  }

  // profile form  list api  ==========
  Future<Response?> addRemarksDetails({
    required BuildContext context,
    String? addRemarks,
    String? addSpecialInstrction,
    String? p_userId,
  }) async {
    isLoad.value = true;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    Response response = await authRepo.addUserRemarks(
      addRemarks: addRemarks,
      addSpecialInstrction: addSpecialInstrction,
      formattedDate: formattedDate,
      p_userId: p_userId,
    );

    if (response.statusCode == 200) {
      isLoad.value = false;
      SmartDialog.dismiss();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Success',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: 'Your Data has been Saved Successfully',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          // Get.find<HomeController>().getWalletValue();
          // Get.offUntil(
          //   MaterialPageRoute(builder: (context) => HistoryTraction()),
          //   (route) => route.isFirst,
          // );
        },
      ).show();
      textAddRemarks.clear();
      textAddSpecialData.clear();
    } else {
      ApiChecker.checkApi(response);
    }

    update();
    return response;
  }

  // profile form  list api  ==========
  Future<Response?> userLogout(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isupdate = true;

    Response response = await authRepo.LogoutPage();

    if (response.statusCode == 200) {
      isupdate = false;
    } else {
      isupdate = false;
      ApiChecker.checkApi(response);
    }

    update();
    return response;
  }

  void logOut() {
    Get.offNamed(RouteHelper.getCreateAccountRoute());
    return authRepo.removeUserToken();
  }

  void removedietitian() {
    return authRepo.removedietitian();
  }

  Future<Response> dietitianLogin(
      {required BuildContext context,
      String? number,
      String? password,
      String? fcmToken}) async {
    isLoad.value = true;
    update();
    Response response = await authRepo.dietitianLogin(
      number: number!.trim(),
      password: password!.trim(),
    );
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token'].toString());
      dietitianUserDetails(context: context);
      dietitianFCMMobile(context: context, token: fcmToken);
      SmartDialog.dismiss();
    } else {
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Warning',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: '${response.body['message']}',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 20, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          // Get.find<HomeController>().getWalletValue();
          // Get.offUntil(
          //   MaterialPageRoute(builder: (context) => HistoryTraction()),
          //   (route) => route.isFirst,
          // );
        },
      ).show();

      SmartDialog.dismiss();
      isLoad.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> dietitianFCMMobile(
      {required BuildContext context, String? token}) async {
    Response response = await authRepo.dietitianFCMToken(
      token: token!.trim(),
    );
    if (response.statusCode == 200) {
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoad.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<void> fetchInstagramMedia({int? pagee}) async {
    final url =
        'https://graph.instagram.com/me/media?fields=id,caption,media_url,media_type,timestamp,children{media_url}&limit=$pagee&access_token=IGQWRQSWg2cDZA1NUwwU29HR0dSSGx0M0pQcWl4ZAXRpQWctVnZAjWkx5TnVVcVN2OEUwaXVsUHNlS3N3MmVGaU5TWkRpc1gtUzhfUFkzckdxaGkzOGRicFhpY21MR3dZAaXZAXQ2dHVUY0YTBhV2hzZA2Y0QkJvSVhkbHMZD';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      mediaData.clear();
      mediaData.value = jsonDecode(response.body)['data'];
      //  isLoading = false;

      _initializeControllers();
      print("SDJNKSNKDNKSNDKnSKNKnskND${mediaData.length}");
    } else {
      throw Exception('Failed to load Instagram media');
    }
  }

  Future<void> fetchInstagramName() async {
    final url =
        'https://graph.instagram.com/me?fields=id,username,media_count,account_type,followers_count&access_token=IGQWRQSWg2cDZA1NUwwU29HR0dSSGx0M0pQcWl4ZAXRpQWctVnZAjWkx5TnVVcVN2OEUwaXVsUHNlS3N3MmVGaU5TWkRpc1gtUzhfUFkzckdxaGkzOGRicFhpY21MR3dZAaXZAXQ2dHVUY0YTBhV2hzZA2Y0QkJvSVhkbHMZD';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mediaData = jsonDecode(response.body);
      UserName.value = mediaData["username"];
      media_count.value = mediaData["media_count"].toString();
      // _initializeControllers();
      print("SDJNKSN${media_count.value}KDNKSNDKnSKNKnskND${UserName.value}");
    } else {
      throw Exception('Failed to load Instagram media');
    }
  }

  void _initializeControllers() async {
    videoControllers =
        List<VideoPlayerController?>.filled(mediaData.length, null);

    String? imageUrl;
    for (var i = 0; i < mediaData.length; i++) {
      var media = mediaData[i];

      if (media['media_type'] == 'VIDEO') {
        try {
          videoControllers[i] =
              VideoPlayerController.network(media['media_url']);
          await videoControllers[i]!.initialize();
        } catch (e) {
          // Handle the exception gracefully
          print('Error initializing video ${i}: $e');
          // You can choose to show an error message or take some other action here
        }
      } else if (media['media_type'] == 'CAROUSEL_ALBUM') {
        var media = mediaData[i];
        videoController = List<VideoPlayerController?>.filled(
            media["children"]["data"].length, null);

        for (var j = 0; j < media["children"]["data"].length; j++) {
          imageUrl = media["children"]["data"][j]['media_url'];
          bool isImage =
              imageUrl!.contains('.jpg') || imageUrl.contains('.png');
          if (!isImage) {
            try {
              print("jkhjgcfdxcgvbjhhnkml");
              videoController[j] = VideoPlayerController.network(
                  media["children"]["data"][j]['media_url']);
              await videoController[j]!.initialize();
            } catch (e) {
              // Handle the exception gracefully
              print('Error initializing video cont${j}roller: $e');
              // You can choose to show an error message or take some other action here
            }
          }
        }
      }
    }
  }

  Future<Response> userFCMMobile({String? token}) async {
    isLoad.value = true;
    Response response = await authRepo.userFCMToken(
      token: token!.trim(),
    );
    if (response.statusCode == 200) {
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoad.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> dietitianDetails(
      {required int page, String? filtername}) async {
    isLoading.value = true;
    update();
    Response response =
        await authRepo.dietitianDetails(page: page, filtername: filtername);
    if (response.statusCode == 200) {
      var data = response.body;

      clientList = ClientList.fromJson(data["data"]);

      if (clientList!.data == null || clientList!.data!.isEmpty) {
        isAllLoaded.value = true;
        print("Anuj");
      } else if (page == 1) {
        isLoading.value = false;
        clientData.clear();
        clientData.addAll(clientList!.data!);
        print("MKAKAKKA");
      } else {
        print("AJNNJAN");
        isLoading.value = false;
        clientData.addAll(clientList!.data!);
      }
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> chatAudioHistoryDetails({required int page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.chatAudioHistoryDetails(page: page);
    if (response.statusCode == 200) {
      final jsonData = response.body["data"];

      ChatAudioHistory chatAudioHistory = ChatAudioHistory.fromJson(jsonData);
      if (chatAudioHistory.data == null || chatAudioHistory.data!.isEmpty) {
        isAllLoaded.value = true;
      } else if (page == 1) {
        chatData.clear();
        chatData.addAll(chatAudioHistory.data!);
      } else {
        chatData.addAll(chatAudioHistory.data!);
      }

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> chatAudioHistoryDietitian({required int page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.chatAudioHistoryDietitian(page: page);
    if (response.statusCode == 200) {
      var data = response.body;
      chatAudioModel = ChatAudioHistory.fromJson(response.body['data']);
      if (chatAudioModel!.data == null || chatAudioModel!.data!.isEmpty) {
        isAllLoaded.value = true;
      } else if (page == 1) {
        chatData.clear();
        chatData.addAll(chatAudioModel!.data!);
      } else {
        chatData.addAll(chatAudioModel!.data!);
      }
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> transactionFunt({required int page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.transactionHistory(page: page);
    if (response.statusCode == 200) {
      var data = response.body;
      transactionHistory = TransactionHistory.fromJson(data["data"]);
      if (transactionHistory!.data == null ||
          transactionHistory!.data!.isEmpty) {
        isAllLoaded.value = true;
      } else if (page == 1) {
        transactionData.clear();
        transactionData.addAll(transactionHistory!.data!);
        // page++;
      } else {
        transactionData.addAll(transactionHistory!.data!);
      }

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> listWeeklyMeasurements({required int page}) async {
    // if (isLoading.value || isAllLoaded.value) return;
    isLoading.value = true;
    update();
    Response response = await authRepo.listWeeklyMeasurements(page: page);
    if (response.statusCode == 200) {
      //  weeklyPicture = WeeklyPicture.fromJson(response.body["data"]);
      print("objectMKAOOOAOAOAOAOOAOA$page");
      final jsonData = response.body["data"];

      WeeklyPicture weeklyPicture = WeeklyPicture.fromJson(jsonData);
      if (weeklyPicture.data == null || weeklyPicture.data!.isEmpty) {
        isAllLoaded.value = true;
      } else if (page == 1) {
        dietitianWeekly.clear();
        dietitianWeekly.addAll(weeklyPicture.data!);
        print("MKAKAKKA");
        //  page++;
      } else {
        dietitianWeekly.addAll(weeklyPicture.data!);
        //     page++;
        //     page++;
      }
      /* final jsonData = json.decode(response.body['data']['data']);
      List<Data> fetchedMeasurements = [];
      for (var item in jsonData) {
        fetchedMeasurements.add(Data.fromJson(item));
      }
      if (fetchedMeasurements.isEmpty) {
        isAllLoaded.value = true;
      } else {
        dietitianWeekly.addAll(fetchedMeasurements);
        page.value++;
      }*/
      // dietitianWeekly.clear();
      // dietitianWeekly.addAll(weeklyPicture!.data!);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> listRemark({
    required int page,
    String? dititianID,
  }) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.listRemarks(dititianID: dititianID);
    if (response.statusCode == 200) {
      var data = response.body["data"];
      remarksDataSpecialView = RemarksDataSpecialView.fromJson(data);
      if (remarksDataSpecialView!.data == null ||
          remarksDataSpecialView!.data!.isEmpty) {
        isAllLoaded.value = true;
      } else if (page == 1) {
        remarksData.clear();
        remarksData.addAll(remarksDataSpecialView!.data!);
        print("MKAKAKKA");
        //  page++;
      } else {
        remarksData.addAll(remarksDataSpecialView!.data!);
        //     page++;
        //     page++;
      }

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

//
  Future<Response> doctorrrbareckkk(
      {String? dititianID, String? staetsss}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.doctorbraeckkk(
        dititianID: dititianID, statuess: staetsss);
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      Get.find<AuthController>().dietitianDetails(page: 1);
      isLoading.value = false;
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> dietitianWeeklys(
      {String? dititianID, required int page}) async {
    // isLoading.value = true;
    update();
    Response response = await authRepo.dietitianWeeklyMeasurement(
        dititianID: dititianID, page: page);
    if (response.statusCode == 200) {
      var data = response.body;
      weeklyPicture = WeeklyPicture.fromJson(response.body["data"]);
      if (weeklyPicture!.data == null || weeklyPicture!.data!.isEmpty) {
        // isAllLoaded.value = true;
      } else if (page == 1) {
        dietitianWeekly.clear();
        dietitianWeekly.addAll(weeklyPicture!.data!);
        print("MKAKAKKA");
        //  page++;
      } else {
        dietitianWeekly.addAll(weeklyPicture!.data!);
        //     page++;
        //     page++;
      }

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> saveUserChatHistory({
    BuildContext? context,
    String? type,
    String? userID,
    String? time,
  }) async {
    var dititianID = Get.find<AuthController>().getDietitianID();
    isLoading.value = true;
    update();
    Response response = await authRepo.saveUserChatHistory(
        type: type, userID: userID, time: time, dietitianID: dititianID);
    if (response.statusCode == 200) {
      var data = response.body;

      Get.find<AuthController>().chatAudioHistoryDetails(page: 1);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> saveDietitianHistory({
    BuildContext? context,
    String? type,
    String? userID,
    String? time,
  }) async {
    var dititianID = Get.find<AuthController>().getDietitianID();
    isLoading.value = true;
    update();
    Response response = await authRepo.saveUserChatHistory(
        type: type, userID: userID, time: time, dietitianID: dititianID);
    if (response.statusCode == 200) {
      var data = response.body;
      Get.find<AuthController>().chatAudioHistoryDietitian(page: 1);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  void saveWeeklyMeasurements(
      {required BuildContext context,
      String? ARMs,
      String? chest,
      String? waist,
      String? hip,
      String? weightt,
      String? UploadPictire}) async {
    isLoad.value = true;
    String url = "${ApiConstants.baseUrl}${ApiConstants.weeklyMeasurements}";

    String? token = Get.find<AuthController>().getAuthToken();
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add token to headers
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['chest_bust'] = chest!.trim();
    request.fields['waist'] = waist!.trim();
    request.fields['hip'] = hip!.trim();
    request.fields['arms'] = ARMs!.trim();
    request.fields['weight'] = weightt!.trim();
    var file = await http.MultipartFile.fromPath(
        'upload_picture', UploadPictire!.trim());
    print("sDNKnSNNDN$file");
    request.files.add(file);

    try {
      var response = await request.send();
      print('fghjk${response}');
      var responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        isLoad.value = false;
        SmartDialog.dismiss();
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          closeIcon: const Icon(Icons.close_fullscreen_outlined),
          title: 'Success',
          titleTextStyle: poppinstMedium.copyWith(
              fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
          desc: 'Your Data has been Saved Successfully',
          descTextStyle:
              poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
          btnCancelColor: Colors.grey[500],
          btnOkColor: ColorResources.verifyScreenButton,
          btnOkOnPress: () {},
        ).show();
        textWaist.clear();
        textUploadPicture.clear();
        textChestBust.clear();
        textARMS.clear();
        textHip.clear();
        weighttt.clear();
        print('Measurements saved successfully');
      } else {
        print(
            'Failed to save measurements. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error saving measurements: $error');
    }
  }

  Future<Response> myDietDetails(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.myDiet();
    if (response.statusCode == 200) {
      Mydite = response.body["data"];
      print("sdsddsd$Mydite");
      //getmyDiet = data["data"]["data"];

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  ///
  Future<Response> doctorweeklyyviewsietss(BuildContext context,
      {String? templeteidd, String? puseridd}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.weeklyydocotordietsss(
        templeteidd: templeteidd, puseridd: puseridd);
    if (response.statusCode == 200) {
      viewweeklyyassing = response.body["data"];

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> doctorspecialliewsietss(BuildContext context,
      {String? templeteidd, String? puseridd}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.specaillldocotordietsss(
        templeteidd: templeteidd, puseridd: puseridd);
    if (response.statusCode == 200) {
      specailviewdetss = response.body["data"];

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  //
  Future<Response> usermyDietDetails(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.userspeciallmyDiet();
    if (response.statusCode == 200) {
      userspeciallMydite = response.body["data"];
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

// weeklyyy detslsssss
  Future<Response> weeklyydeitsss(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.weeklydeits();
    if (response.statusCode == 200) {
      weeekeleyyyd = response.body["data"];
      for (int i = 0; i < weeekeleyyyd.length; i++) {
        weeklydietss[i];
      }

      print("sdsddsd$weeklydietss");

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

//
  Future<Response> specialdiett(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.specialdietssss();
    if (response.statusCode == 200) {
      specialdietsss = response.body["data"];
      for (int i = 0; i < specialdietsss.length; i++) {
        specialdietssplan[i];
      }

      print("sdsddsd$weeklydietss");

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> dietitianUser({String? id}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.dietitianUsreDetails(id: id);
    if (response.statusCode == 200) {
      var data = response.body["data"];

      _profileDetails = ProfileDetails.fromJson(data);
      print('SDNNSDNSDN${_profileDetails}');

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> viewDietitan({String? id}) async {
    //isLoading.value = true;
    update();
    Response response = await authRepo.viewDietitan(id: id);
    if (response.statusCode == 200) {
      var data = response.body["data"];
      print("SDKMSKLDMKLSMDLKMSLDMLSDML${data}");
      remarksDataSpecialView = RemarksDataSpecialView.fromJson(data);
      remarksData.clear();
      remarksData.addAll(remarksDataSpecialView!.data!);
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      // isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> userDetail(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isLoad.value = true;
    update();
    Response response = await authRepo.userDetails();
    if (response.statusCode == 200) {
      if (response.body["step_1"] == null) {
        isLoad.value = false;
        Get.offAll(CreateNewDeatils(Stepeer: "0"));
      } else if (response.body["step_2"] == null) {
        isLoad.value = false;
        authRepo.saveGender(response.body["gender"]);
        Get.offAll(CreateNewDeatils(Stepeer: "1"));
      } else if (response.body["step_3"] == null) {
        isLoad.value = false;
        authRepo.saveGender(response.body["gender"]);
        Get.offAll(CreateNewDeatils(Stepeer: "2"));
      } else {
        Map<String, dynamic> data = response.body;
        if (data["dietician_id"] != null) {
          authRepo.saveDietitianId(data["dietician_id"]);
        }
        MessageChat messageChat = MessageChat();
        messageChat.loginCall(
            data["mobile_no"].toString(), response.body["name"].toString());

        _profileDetails = ProfileDetails.fromJson(data);

        if (data["dietician_id"] != null) {
          authRepo.saveDietitianId(data["dietician_id"]);
        }
        isLoad.value = false;
        Get.offAllNamed(RouteHelper.dasboard, arguments: true);
      }
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> adminBankDetails({
    BuildContext? context,
  }) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.adminBankDetails();
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.body['data'];
      _bankDetailsInfo = BankDetailsInfo.fromJson(data);
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  /*todo--------get token from firebase*/
  Future<String?> getFirebaseToken(userId) async {
    print("CODE IS WORKING");
    try {
      Stream<DocumentSnapshot> stream =
          FBCollections.tokens.doc('${userId}').snapshots();

      stream.listen((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          Map<String, dynamic> userData =
              docSnapshot.data() as Map<String, dynamic>;

          String token = userData['token'];

          print(token);
          String id = userData['id'];

          var lastseen = userData['lastseen'];
          if (lastseen == "Online") {
            lastSeen = "Online";
          } else {
            DateTime lastSeenTime =
                DateTime.fromMillisecondsSinceEpoch(int.parse(lastseen));
            lastSeen = "last seen at " + _formatDateTime(lastSeenTime);
            print("sDsDksmDmsM$lastSeen");
          }
        } else {
          print('Document does not exist');
        }
      });
    } catch (e) {
      print('Error retrieving data: $e');
      return null;
    }
    return null;
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      final format = DateFormat.jm();
      return format.format(dateTime);
    } else if (dateTime.year == now.year) {
      final format = DateFormat('MMM d');
      return format.format(dateTime);
    } else {
      final format = DateFormat('MMM d, y');
      return format.format(dateTime);
    }
  }

  Future<String?> getFireToken(userId) async {
    print("CODE IS WORKINGASMKLSM${userId}");
    try {
      Stream<DocumentSnapshot> stream =
          FBCollections.chat.doc('${userId}').snapshots();

      stream.listen((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          Map<String, dynamic> userData =
              docSnapshot.data() as Map<String, dynamic>;

          String token = userData['token'];
          print("SDKNSKDNKNSDNSNDKNS      $token");
          //     tokenValue = userData['token'];
          String id = userData['id'];

          var lastseen = userData['lastseen'];
          if (lastseen == "Online") {
            InChatSeen = "Online";
            print("sDsDksmDmsMAKLAMLMAMMAL$InChatSeen");
          } else {
            InChatSeen = "Offline";
            print("sDsDksmDmsMAKLAMLMAMMAL$InChatSeen");
          }
        } else {
          InChatSeen = "";
          print('Document does not exist');
        }
      });
    } catch (e) {
      print('Error retrieving data: $e');
      return null;
    }
    return null;
  }

  Future<String?> getFirebaseDoctorAccess(userId) async {
    try {
      Stream<DocumentSnapshot> stream =
          FBCollections.userTalkAccess.doc('${userId}').snapshots();

      stream.listen((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          Map<String, dynamic> userData =
              docSnapshot.data() as Map<String, dynamic>;

          String token = userData['token'];
          tokenValue = userData['token'];
          String id = userData['id'];
          var lastseen = userData['lastseen'];
          if (lastseen == "FirstTime") {
            messageComeFromUSer = userId.toString();
          }
        } else {
          print('Document does not exist');
        }
      });
    } catch (e) {
      print('Error retrieving data: $e');
      return null;
    }
    return null;
  }

  Future<Response> dietitian_details({
    BuildContext? context,
  }) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.dietitian_details();
    if (response.statusCode == 200) {
      Listdata = response.body['data'];
      print("SDMSMDLMSLDMSMDMMS  $Listdata");
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> dietitianUserDetails({
    required BuildContext context,
  }) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.dietitianUser();
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.body;
      authRepo.saveUserId(response.body["user_id"].toString());
      MessageChat messageChat = MessageChat();
      messageChat.loginCall(
          response.body["id"].toString(), response.body["name"].toString());
      authRepo.saveDietitian("Dietitian");
      authRepo.saveName(response.body["name"].toString());
      authRepo.saveId(response.body["id"].toString());
      authRepo.saveNumber(response.body["mobile_no"].toString());
      authRepo.saveDietitianId(data["id"].toString());
      _userdetails = UserDetails.fromJson(data);
      isLoad.value = false;
      Get.offAllNamed(RouteHelper.welcomeDietitian, arguments: true);
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  /// Login Api==================================
  Future<Response> sendNmber(
      {required BuildContext context,
      String? number,
      String? OTP,
      String? fcmToken}) async {
    isLoad.value = true;
    update();
    Response response =
        await authRepo.verifyNumber(number: number!.trim(), OTP: OTP);
    if (response.statusCode == 200) {
      authRepo
          .saveUserToken(response.body["data"]["original"]['token'].toString());
      userDetail(context, isupdate: false);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoad.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> feedbackpostapii(
      {required BuildContext context,
      String? shareprogram,
      String? messagee,
      String? fcmToken}) async {
    //isLoad.value = true;
    update();
    Response response = await authRepo.feedbackpostapiii(
      shareprogram: shareprogram!.trim(),
      message: messagee!.trim(),
    );
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Thank You',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc:
            'Thank you for your valuable time and opinion. Your patience is much appreciated!',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          Get.offAllNamed(RouteHelper.dasboard, arguments: true);
        },
      ).show();
      SmartDialog.dismiss();
      // isLoad.value = false;
    } else {
      SmartDialog.dismiss();
      // isLoad.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> ratingpostapiii(
      {required BuildContext context,
      double? ratringfg,
      String? duseridd,
      String? fcmToken}) async {
    //isLoad.value = true;
    update();
    Response response = await authRepo.ratingpostapiii(
      rating: ratringfg,
      duserid: duseridd,
    );
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Thank You',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc:
            'Thank you for your valuable time and opinion. Your patience is much appreciated!',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          Get.offAllNamed(RouteHelper.dasboard, arguments: true);
        },
        onDismissCallback: (type) {
          Get.offAllNamed(RouteHelper.dasboard, arguments: true);
        },
      ).show();

      SmartDialog.dismiss();
      // isLoad.value = false;
    } else {
      SmartDialog.dismiss();
      // isLoad.value = false;
    }
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response?> getfeedbackdataaa(BuildContext context,
      {bool reload = false, bool? isupdate}) async {
    isupdate = true;

    Response response = await authRepo.feedbackkklistdataa();

    if (response.statusCode == 200) {
      isupdate = false;
    } else {
      isupdate = false;
      ApiChecker.checkApi(response);
    }

    update();
    return response;
  }

  String? getNumber() {
    return authRepo.getNumberId();
  }

  String? getGender() {
    return authRepo.getGender();
  }

  String? getAuthToken() {
    return authRepo.getUserToken();
  }

  String? getName() {
    return authRepo.getName();
  }

  String? getDietitian() {
    return authRepo.getDietitian();
  }

  String? getUserMessage() {
    return authRepo.getDietitian();
  }

  String? getID() {
    return authRepo.getID();
  }

  String? getUserId() {
    return authRepo.getUserId();
  }

  String? getDietitianID() {
    return authRepo.getdietician_id();
  }

  void saveuploadprecription({context, String? UploadPictire}) async {
    isLoad.value = true;
    String url = "${ApiConstants.baseUrl}${ApiConstants.savemedicalreport}";

    String? token = Get.find<AuthController>().getAuthToken();
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

    var file = await http.MultipartFile.fromPath(
        "medical_report", UploadPictire!.trim());
    print("sDNKnSNNDN$file");
    request.files.add(file);

    try {
      var response = await request.send();
      print('fghjk${response}');
      var responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        isLoad.value = false;
        SmartDialog.dismiss();

        print('Measurements saved successfully');
      } else {
        print(
            'Failed to save measurements. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error saving measurements: $error');
    }
  }

  Future<Response> viewrepoertttt() async {
    isLoading.value = true;
    update();
    Response response = await authRepo.viewreportttt();
    if (response.statusCode == 200) {
      var data = response.body;

      usermedicalreport = UserMedicalReport.fromJson(data);
      usermedicalreportlistdata.clear();
      usermedicalreportlistdata.addAll(usermedicalreport!.data!);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> doctorviewrepoertttt({String? puseridd}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.doctorviewMedicalt(pusertid: puseridd);
    if (response.statusCode == 200) {
      var data = response.body;

      doctorlist = ViewdoctorMedicalModel.fromJson(data);
      doctorlistdataaa.clear();
      doctorlistdataaa.addAll(doctorlist!.data!);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> doctorpaymentlisttt({int? page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.doctorrrpayhistory();
    if (response.statusCode == 200) {
      // var data = response.body;
      var res = response.body['data'] as List;
      var dataList = DoctorPaymemtHistory.fromJson(res as Map<String, dynamic>);

      // detoxlist = DetoxListModel.fromJson(data);
      doctorhistory.clear();
      doctorhistory.addAll(dataList as Iterable<DoctorPaymemtHistory>);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  ///-=-=-=-=-=-=-=-==--=-
  Future<Response> detoxxxxpostapiiii(
      {String? templatename, String? contenttname, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.detoxxposttt(
        templateename: templatename, contentt: contenttname);
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      Get.find<AuthController>().detoxlisttdataa();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> detoxlisttdataa({int? page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.detoxgetdatataa(page: page);
    if (response.statusCode == 200) {
      var data = response.body;

      detoxlist = DetoxListModel.fromJson(data);
      detoxlistdatata.clear();
      detoxlistdatata.addAll(detoxlist!.data!);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> detoccdeleteapiii({int? id, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.detoxxdeleete(
      id: id,
    );
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      update();
      Get.find<AuthController>().detoxlisttdataa();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  //
  Future<Response> weeklyyypostapiiii(
      {String? templatename, String? contenttname, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.weeklyyposttt(
        templateename: templatename, contentt: contenttname);
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      Get.find<AuthController>().weeklyylisttdataa();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  //
  Future<Response> weeklyypostdataaa(
      {String? weeklttempleteidd, String? pueriss, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.weeeklyypostss(
        weeklyidddd: weeklttempleteidd, puseriddd: pueriss);
    if (response.statusCode == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Successfully',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: 'Weekly Diet Assign Successfully',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {
          // Get.offAllNamed(RouteHelper.dasboard, arguments: true);
        },
      ).show();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  //
  Future<Response> specialdietsspostapii(
      {String? weeklttempleteidd, String? pueriss, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.speciakldietsss(
        weeklyidddd: weeklttempleteidd, puseriddd: pueriss);
    if (response.statusCode == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Successfully',
        titleTextStyle: poppinstMedium.copyWith(
            fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: 'Detox Diet Assign Successfully',
        descTextStyle:
            poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: ColorResources.verifyScreenButton,
        btnOkOnPress: () {},
      ).show();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> weeklyylisttdataa({int? page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.weeklyygetdatataa(page: page);
    if (response.statusCode == 200) {
      var data = response.body;

      weeklydiet = WeeklyDietModel.fromJson(data);
      weeklydietlistdataa.clear();
      weeklydietlistdataa.addAll(weeklydiet!.data!);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> weeklydeleteapiii({int? id, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.weeklyydeleete(
      id: id,
    );
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      update();
      Get.find<AuthController>().weeklyylisttdataa();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  //
  Future<Response> codetempletepostapiiii(
      {String? templatename, String? contenttname, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.codetempelteposttt(
        templateename: templatename, contentt: contenttname);
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      Get.find<AuthController>().codetempletelisttdataa();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> codetempletelisttdataa({int? page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.codetempletegetdatataa(page: page);
    if (response.statusCode == 200) {
      var data = response.body;

      codetempleteee = CodeTempleteDietModel.fromJson(data);
      codetempletelistdataa.clear();
      codetempletelistdataa.addAll(codetempleteee!.data!);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> codetempletedeleteapiii({int? id, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.codetempletedeleete(
      id: id,
    );
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      update();
      Get.find<AuthController>().codetempletelisttdataa();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  // do n don't==-==-=-=-=-=-=
  Future<Response> donndonttt(
      {String? questionn, String? duseridd, String? answer, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.dondonttt(
        questionn: questionn, dseridd: duseridd, answer: answer);
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      Get.find<AuthController>().dondontttt();

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  //
  Future<Response> dondontttt({int? page}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.donodonn(page: page);
    if (response.statusCode == 200) {
      var data = response.body;
      dondontt = DonDontModel.fromJson(data);
      dopntlistdataa.clear();
      dopntlistdataa.addAll(dondontt!.data!);
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> doctordonndonttt(
      {String? answer, String? puseridd, String? question, context}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.doctorrdondonttt(
        answer: answer, pseridd: puseridd, question: question);
    if (response.statusCode == 200) {
      print('Response Data:::::::${response.body}');
      Get.find<AuthController>().doctoreedondontttt(psuerdidd: puseridd);

      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }

  Future<Response> doctoreedondontttt({String? psuerdidd}) async {
    isLoading.value = true;
    update();
    Response response = await authRepo.doctoreedonodonn(pusertid: psuerdidd);
    if (response.statusCode == 200) {
      var data = response.body;
      doctordonttt = DonDontdoctorModel.fromJson(data);
      doctordontlidtdataa.clear();
      doctordontlidtdataa.addAll(doctordonttt!.data!);
      SmartDialog.dismiss();
      update();
    } else {
      SmartDialog.dismiss();
      isLoading.value = false;
    }
    isLoading.value = false;
    SmartDialog.dismiss();
    update();
    return response;
  }
}

/*
UserName  ClassName*/
class UserTransactionHistoryController extends GetxController
    implements GetxService {
  var userTransactions = [].obs;

  @override
  void onInit() {
    // fetchUserTransactions();
    super.onInit();
  }

  void fetchUserTransactions({String? iddd}) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.doctorhistroy}";

    String? token = Get.find<AuthController>().getAuthToken();
    final Map<String, dynamic> body = {
      'p_user_id': iddd,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      userTransactions.assignAll(jsonData['data']['data']);
    } else {
      throw Exception('Failed to load user transactions');
    }
  }
  // void fetchUserTransactions() async {

  //   final response = await http
  //       .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     userTransactions.assignAll(jsonData['data']['data']);
  //   } else {
  //     throw Exception('Failed to load user transactions');
  //   }
  // }
}
