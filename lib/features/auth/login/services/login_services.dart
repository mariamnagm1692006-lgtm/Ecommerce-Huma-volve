import 'package:ecommerce_app_huma_volve/core/constants/api_endpoint.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/models/login_model.dart';

class LoginServices {
  ApiClient apiClient;
  LoginServices(this.apiClient);
  Future<LoginModel> login({required String email,required String password})async{
   final response= await apiClient.dio.post(ApiEndpoint.login,data: {
      "email":email,
      "password": password}
    );
   final Map<String,dynamic>json=response.data;
   final modelData=LoginModel.fromJson(json);
   
   print("Access token: ${modelData.accessToken}");
   print("refresh token: ${modelData.refreshToken}");
   return modelData;
  }
}