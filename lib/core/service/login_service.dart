part of 'services.dart';

class LoginService {

  static Future<ApiReturnValue<LoginModel>> login(
      String email,
      String password,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseUrl + urlLogin;

    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        // "api-token": "Bearer $userToken",
      },
      body: jsonEncode(
        <String, dynamic>{
          'email': email,
          'password': password,
        },
      ),
    );
    print(response.body);

    if (response.statusCode != 200 && response.statusCode != 201) {
      var login =
      LoginModel.fromJson(jsonDecode(response.body));
      return ApiReturnValue("Please try again", login);
    }
    var login =
    LoginModel.fromJson(jsonDecode(response.body));
    return ApiReturnValue('Login Success', login);
  }


}
