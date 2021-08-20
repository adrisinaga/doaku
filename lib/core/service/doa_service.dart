part of 'services.dart';

class DoaService {

  // static List parsePosts(String responseBody) {
  //   final parsed = json.decode(responseBody).cast();
  //
  //   return parsed.map((json) => DoaModel.fromJson(json)).toList();
  // }

  static Future<ApiReturnValue<DoaModel>> getDoa(
      {http.Client? client}) async {
    client ??= http.Client();
    String url = baseUrl + urlDoa;
    var response = await client.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      var getDoa = DoaModel.fromJson(jsonDecode(response.body));
      return ApiReturnValue(getDoa.status ?? 'Please try again');
    }

    print(response.body);
    var data = DoaModel.fromJson(jsonDecode(response.body));
    return ApiReturnValue('All data doa', data);
  }


  static Future<ApiReturnValue<ResponsePostDoa>> postDoa(
      String isiDoa,
      String idUser,
      {http.Client? client}) async {
    client ??= http.Client();

    // var userToken = await getAccessToken();

    String url = baseUrl + urlDoa;

    // var file = MultipartFile.fromString(value);

    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        // "api-token": "Bearer $userToken",
      },
      body: jsonEncode(
        <String, dynamic>{
          'isi_doa': isiDoa,
          'id_user': idUser,
        },
      ),
    );
    print(response.body);

    if (response.statusCode != 200 && response.statusCode != 201) {
      var postDoa =
      ResponsePostDoa.fromJson(jsonDecode(response.body));
      return ApiReturnValue("Please try again", postDoa);
    }
    var postDoa =
    ResponsePostDoa.fromJson(jsonDecode(response.body));
    return ApiReturnValue('Post Doa Success', postDoa);
  }

  static Future<ApiReturnValue<ResponsePostBerdoa>> postBerdoa(
      String idDoa,
      String idUser,
      {http.Client? client}) async {
    client ??= http.Client();

    // var userToken = await getAccessToken();

    String url = baseUrl + urlBerdoa;

    // var file = MultipartFile.fromString(value);

    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        // "api-token": "Bearer $userToken",
      },
      body: jsonEncode(
        <String, dynamic>{
          'id_doa': idDoa,
          'id_user': idUser,
        },
      ),
    );
    print(response.body);

    if (response.statusCode != 200 && response.statusCode != 201) {
      var postBerdoa =
      ResponsePostBerdoa.fromJson(jsonDecode(response.body));
      return ApiReturnValue("Please try again", postBerdoa);
    }
    var postBerdoa =
    ResponsePostBerdoa.fromJson(jsonDecode(response.body));
    return ApiReturnValue('Post Doa Success', postBerdoa);
  }
}
