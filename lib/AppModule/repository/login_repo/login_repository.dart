
import '../../services/app_urls.dart';
import '../../services/network/network_api_services.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginUserApi(var data)async{
    dynamic response = _apiService.post(AppUrls().LOGIN_URL, data);
    return response;
  }

}