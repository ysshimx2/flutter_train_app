import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final bool isDeparture;
  final List<String> stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ]; // 역 목록
  StationListPage({super.key, required this.isDeparture});

  @override // 출발역 도착역 선택 박스
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isDeparture ? '출발역' : '도착역'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, stations[index]); // 역을 선택하고, 선택된 값 반환
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ), //역이름 감싸는 영역
                ),
              ),
              child: ListTile(
                title: Text(
                  stations[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
