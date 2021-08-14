part of 'services.dart';

class ComproService {
  static Future<ApiReturnValue<DoaModel>> getDoa(
      {http.Client? client}) async {
    client ??= http.Client();
    String url = baseUrl + urlGetDoa;
    var response = await client.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      var survey = DoaModel.fromJson(jsonDecode(response.body));
      return ApiReturnValue(survey.status ?? 'Please try again');
    }

    print(response.body);
    var data = DoaModel.fromJson(jsonDecode(response.body));
    return ApiReturnValue('All data doa', data);
  }
}
