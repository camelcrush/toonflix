import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

// Future: 비동기 데이터타입 with async await
  Future<List<WebtoonModel>> getTodayToons() async {
    // Instance화된 FetchData 만들기
    List<WebtoonModel> webtoonInstances = [];
    // uri를 url로 변환
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // json 데이터를 fultter에 맞게 decode화
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // 각각의 Data들을 인스턴스로 만들어서 List에 추가
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
