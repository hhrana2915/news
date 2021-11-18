import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=9a0c8e375ada4198a26f7a52638c4b78");

  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articalsList = map['articles'];

    List<NewsApiModel> newsList = _articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))
        .toList();

    print(_articalsList);

    return newsList;
  } else {
    print("error");
    return [];
  }
}