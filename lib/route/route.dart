import 'package:dietitian/views/ChatCallDitataion/Call_MessageDietitian.dart';
import 'package:dietitian/views/screen/ChatHistoryForDititian/ChatNavBarDItitaionCase.dart';
import 'package:dietitian/views/screen/ChatHistoryForUser/ChatHistoryUser.dart';
import 'package:dietitian/views/screen/DashBoard/notification.dart';
import 'package:dietitian/views/screen/HistoryTraction/TractionHistory.dart';
import 'package:dietitian/views/screen/HistoryTraction/historyTransactionNav.dart';
import 'package:dietitian/views/screen/MtSubscribePlan/MySubscribePlan.dart';
import 'package:dietitian/views/screen/MyClientPage/MyClientNavBar.dart';
import 'package:dietitian/views/screen/MyClientPage/MyClientsPage.dart';
import 'package:dietitian/views/screen/ProfileDetailsView/ProfileNavBar.dart';
import 'package:dietitian/views/screen/RemarksandSpecial/RemarkandSpecial.dart';
import 'package:dietitian/views/screen/ViewDied/ViewDied.dart';
import 'package:dietitian/views/screen/ViewRemarks/ViewRemarksDetails.dart';
import 'package:dietitian/views/screen/ViewWeight/ViewWeight.dart';
import 'package:dietitian/views/screen/WeeklyPictureView/WeeklyPictureRequirmentView.dart';
import 'package:dietitian/views/screen/auth/CraeteNewDetails.dart';
import 'package:dietitian/views/screen/auth/DitationsPage.dart';
import 'package:dietitian/views/screen/auth/createaccount_screen.dart';
import 'package:dietitian/views/screen/auth/new_pages/about_us.dart';
import 'package:dietitian/views/screen/auth/new_pages/bmi_cal.dart';
import 'package:dietitian/views/screen/auth/new_pages/faq_page.dart';
import 'package:dietitian/views/screen/auth/new_pages/login_instagram.dart';
import 'package:dietitian/views/screen/auth/new_pages/package.dart';
import 'package:dietitian/views/screen/auth/new_pages/package_details.dart';
import 'package:dietitian/views/screen/auth/otp_screen.dart';
import 'package:dietitian/views/screen/auth/welcome_screen.dart';
import 'package:dietitian/views/support/feedback.dart';
import 'package:dietitian/views/support/rating.dart';
import 'package:dietitian/views/support/support.dart';
import 'package:get/get.dart';
import 'package:dietitian/utils/constants.dart';
import 'package:dietitian/views/screen/auth/login_screen.dart';
import 'package:dietitian/views/screen/splash_screen.dart';

import '../views/WeeklyPictureRequirment/WeeklyPictureReq.dart';
import '../views/screen/MyDietitonsPage/MyDietitionPage.dart';

const int yourAppID = 1574188373;
const String yourAppSign =
    "6ac2de4d4b8e28bc9e8ca4e6ef872abca1754d545f6242b4074a9151c0cca543";

class RouteHelper {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String createAccount = '/createAccount';
  static const String forgotpassword = '/forgorpassword';
  static const String otpverify = '/otpverify';
  static const String home = '/home';
  static const String dasboard = '/dashboard';
  static const String welcomeDietitian = '/welcomeDietitian';
  static const String welcome = '/welcome';
  static const String myClientPage = '/myClientPage';
  static const String myClientPageNav = '/myClientPageNav';
  static const String myCallMessage = '/myCallMessage';
  static const String profileNav = '/profileNav';
  static const String createNewDeatils = '/CreateNewDeatils';
  static const String viewWeight = '/ViewWeight';
  static const String viewRemarksDetails = '/ViewRemarksDetails';
  static const String specialRemark = '/SpecialRemark';
  static const String historyTransaction = '/historyTransaction';
  static const String historyTransactionNav = '/historyTransactionNav';
  static const String chatScreenHistoryNav = '/chatScreenHistoryNav';
  static const String chatUserHistoryNav = '/chatUserHistoryNav';
  static const String mySubscribePlan = '/mySubscribePlan';
  static const String myDietitianPage = '/myDietitianPage';
  static const String culture = '/culture';
  static const String channels = '/channel';
  static const String weeklyPictureViewDetails = '/WeeklyPictureViewDetails';
  static const String channelsDetails = '/channelDteails';
  static const String carPlayer = '/carPlayer';
  static const String share = '/share';
  static const String download = '/download';
  static const String save = '/save';
  static const String history = '/history';
  static const String topEpisode = '/topepisode';
  static const String language = '/language';
  static const String myProfile = '/myprofile';
  static const String notifications = '/notification';
  static const String updateInterest = '/updateInterest';
  static const String account = '/account';
  static const String noticationList = '/notificationList';
  static const String subcribedChannel = '/subcribedChannel';
  static const String contactus = '/contactus';
  static const String changePassword = '/changePassword';
  static const String changeNumber = '/changeNumber';
  static const String editProfile = '/editProfile';
  static const String suggestionplayer = '/suggestionPlayer';
  static const String search = '/search';
  static const String lpginInstramScreen = '/lpginInstramScreen';
  static const String aboutUsSCreen = '/aboutUsSCreen';
  static const String bmiCalScreen = '/bmiCalScreen';
  static const String packageScreen = '/packageScreen';
  static const String faqScreen = '/faqScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String packageDetailsScreen = '/packageDetailsScreen';
  static const String sendInuriesScreen = '/sendInuriesScreen';
  static const String supportScreen = '/supportScreen';
  static const String feedbackScreen = '/feedbackScreen';
  static const String ratingScreen = '/ratingScreen';

  //

  static getSplashRoute() => splash;

  static getLoginRoute() => login;
  static getCreateAccountRoute() => createAccount;

  static getOtpVeriftyRoute({required String emailAddress}) {
    return '$otpverify?email=$emailAddress';
  }

  static getForgotPasswordScreenRoute() => forgotpassword;
  static getweeklyPictureViewDetails() => weeklyPictureViewDetails;
  static getmyCallMessage() => myCallMessage;
  static getHomeScreenRoute() => home;
  static getprofileNav() => profileNav;
  static getWelcomeRoute() => welcome;
  static getmyClientPageRoute() => myClientPage;

  static getConfirmPasswordRoute() => viewWeight;

  static getviewRemarksDetailsRoute() => viewRemarksDetails;
  static getDashBoardRoute() => dasboard;
  static getwelcomeDietitian() => welcomeDietitian;
  static getCreateNewDeatils() => createNewDeatils;
  static getspecialRemarkRoute() => specialRemark;
  static gethistoryTransactionRoute() => historyTransaction;
  static gethistoryTransactionNavRoute() => historyTransactionNav;
  static getchatScreenHistoryNav() => chatScreenHistoryNav;
  static getchatUserHistoryNavRoute() => chatUserHistoryNav;
  static getmySubscribePlanRoute() => mySubscribePlan;
  static getLibraryRoute() => myDietitianPage;
  static getCultureRoute() => culture;
  static getChannelRoute() => channels;
  static getChannelPlayerRoute() => channelsDetails;
  static getCarPlayerRoute() => carPlayer;
  static getShareRoute() => share;
  static getDownloadRoute() => download;
  static getbmiCalScreenRoute() => bmiCalScreen;
  static getSaveRoute() => save;
  static getHistoryRoute() => history;
  static getTopEpisodeRoute() => topEpisode;
  static getLanguageRoute() => language;
  static getmyClientPageNav() => myClientPageNav;
  static getlpginInstramScreenRoute() => lpginInstramScreen;
  static getMyProfileRoute() => myProfile;
  static getNotificationRoute() => notifications;
  static getUpdateInterestRoute() => updateInterest;
  static getAccountRoute() => account;
  static getNotificationListRoute() => noticationList;
  static getSubscribedChannelRoute() => subcribedChannel;
  static getContactUsRoute() => contactus;
  static getChangeNumberRoute() => changeNumber;
  static getEditProfileRoute() => editProfile;
  static getChangePasswordRoute() => changePassword;
  static getaboutUsSCreenRoute() => aboutUsSCreen;
  static getPackageScreenRoute() => packageScreen;
  static getfaqScreenRoute() => faqScreen;
  static getnotificationScreenRoute() => notificationScreen;
  static getpackageDetailsScreenRoute() => packageDetailsScreen;
  static getsendInuriesScreenRoute() => sendInuriesScreen;
  static getsupportScreenRoute() => supportScreen;
  static getfeedbackScreenRoute() => feedbackScreen;
  static getratingScreenRoute() => ratingScreen;
  static getSuggestionPlayerRoute(
          //{@required dynamic suggestionList}
          ) =>
      suggestionplayer;
  // {
  // return '$suggestionplayer?suggestionlist=$suggestionList';

  // }

  static getSearchRoute() => search;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: login,
      page: () => const Login(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: createAccount,
      page: () => const CreateAccount(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    // GetPage(
    //     name: forgotpassword,
    //     page: () => const ForgetPassword(),
    //     transitionDuration:
    //         const Duration(milliseconds: ApiConstants.screenTransitionTime),
    //     ),
    GetPage(
      name: otpverify,
      page: () => OTPScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: profileNav,
      page: () => ProfileNav(),
      transitionDuration:
          Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: createNewDeatils,
      page: () => CreateNewDeatils(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: dasboard,
      page: () => const WelcomePage(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: welcomeDietitian,
      page: () => const WelcomeDietitian(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    // //dasboard

    GetPage(
      name: myClientPage,
      page: () => MyClientPage(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: myClientPageNav,
      page: () => MyClientPageNav(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: myCallMessage,
      page: () => MyDietitianChatMessage(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: myCallMessage,
      page: () => MyDietitianChatMessage(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: viewWeight,
      page: () => ViewWeight(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: viewRemarksDetails,
      page: () => ViewRemarksDetails(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: specialRemark,
      page: () => SpecialRemark(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: historyTransaction,
      page: () => HistoryTransaction(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: historyTransactionNav,
      page: () => HistoryTransactionNav(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: chatScreenHistoryNav,
      page: () => ChatScreenHistoryNav(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: chatUserHistoryNav,
      page: () => ChatUserHistoryNav(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: mySubscribePlan,
      page: () => const MySubscribePlan(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: myDietitianPage,
      page: () => const MyDietitianPage(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),

    GetPage(
      name: culture,
      page: () => const ViewDied(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: channels,
      page: () => WeeklyPicture(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: weeklyPictureViewDetails,
      page: () => WeeklyPictureViewDetails(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: lpginInstramScreen,
      page: () => LpginInstramScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: aboutUsSCreen,
      page: () => AboutUsSCreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: bmiCalScreen,
      page: () => BmiCalScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: packageScreen,
      page: () => PackageScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: faqScreen,
      page: () => FaqScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: packageDetailsScreen,
      page: () => PackageDetailsScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: supportScreen,
      page: () => SupportScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: feedbackScreen,
      page: () => FeedbackScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
    GetPage(
      name: ratingScreen,
      page: () => RatingScreen(),
      transitionDuration:
          const Duration(milliseconds: ApiConstants.screenTransitionTime),
    ),
  ];
}
