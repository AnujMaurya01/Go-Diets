import 'package:get/get.dart';
import 'package:dietitian/utils/apis/api_client.dart';
import 'package:dietitian/utils/constants.dart';


class ProfiileRepo extends GetxService {
  final ApiClient apiClient;

  ProfiileRepo({
    required this.apiClient,
  });




  Future<Response> getProfile() async {
    return apiClient
        .getData(ApiConstants.getProfileUrl);
  }


  //
}
