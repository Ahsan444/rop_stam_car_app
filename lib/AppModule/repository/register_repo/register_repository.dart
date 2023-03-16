
import '../../services/app_urls.dart';
import '../../services/network/network_api_services.dart';

class RegisterRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> registerUserApi(var data)async{
    dynamic response = _apiService.post(AppUrls().REGISTER_URL, data);
    return response;
  }

}