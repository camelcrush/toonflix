// Fetch Data 각각을 Instance로 만들기 위해 클래스화
class WebtoonModel {
  final String title, thumb, id;

// named constructor : Api를 만든 때 쓰는 가장 보편적인 패턴
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
