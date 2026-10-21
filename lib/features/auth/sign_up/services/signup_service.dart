import 'package:ecommerce_app_huma_volve/core/constants/api_endpoint.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/models/signup_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/models/signup_req_model.dart';

class SignupService {
  ApiClient apiClient;
  SignupService(this.apiClient);
  Future<SignupModel> signup(SignupReqModel signupReqModel) async {
    final response = await apiClient.dio.post(
      ApiEndpoint.signup,
      data: {
        "email": signupReqModel.email,
        "name": signupReqModel.name,
        "password": signupReqModel.password,
        "avatar": "https://i.pravatar.cc/150",
      },
    );

    final Map<String, dynamic> json = response.data;
    final modelData = SignupModel.fromJson(json);
    return modelData;
  }
}
