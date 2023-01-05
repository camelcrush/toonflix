import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // build로 자동 완성
  @override
  Widget build(BuildContext context) {
    // MaterialApp or CupertinoApp 중 선택, MaterialApp 추천
    return MaterialApp(
      // scaffold : 레이아웃 위젯
      home: Scaffold(
          backgroundColor: Color(0xFF181818),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]),
          )),
    );
  }
}
