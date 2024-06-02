import 'package:get/get.dart';
import 'package:dietitian/utils/apis/api_client.dart';

class HomeRepo extends GetxService {
  final ApiClient apiClient;

  HomeRepo({
    required this.apiClient,
  });
}
