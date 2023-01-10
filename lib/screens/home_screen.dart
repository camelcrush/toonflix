import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // Future Class를 통해 State를 쓰지 않고 StatelessWidget으로 데이터 받아오기, const 제거
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            // Data를 가지고 있을 때 ListView, ListView.builder, ListView.separated 사용 가능
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              // itemBuilder required
              itemBuilder: ((context, index) {
                // index를 통해 snapshot.data에 접근할 수 있음
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              }),
              separatorBuilder: ((context, index) => const SizedBox(
                    width: 20,
                  )),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
