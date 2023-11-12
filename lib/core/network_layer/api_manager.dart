import 'dart:convert';

import '../../models/category_model.dart';
import '../../models/source_model.dart';
import '../contants.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<SourceModel> fetchSources(String categoryId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);

    SourceModel sourceModel = SourceModel.fromJason(jsonDecode(response.body));

    print(response.body);

    return sourceModel;
  }

  static Future<ArticalsModel> fetchArticals({String? sourceId ,String? searchKeyWord}) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
      "q" : searchKeyWord,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines",
      queryParameters,
    );

    var response = await http.get(uri);

    ArticalsModel articalsModel =
    ArticalsModel.fromJson(jsonDecode(response.body));

    print(response.body);

    return articalsModel;
  }
}