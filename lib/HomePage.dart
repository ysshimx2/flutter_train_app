import 'package:flutter/material.dart';
import 'StationListPage.dart';
import 'SeatPage.dart';
//앞서 작성된 StationListPage.dart와 SeatPage.dart를 import

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  //HomePage 클래스의 상태를 나타내는 _HomePageState 클래스를 반환
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;
  //출발역과 도착역 선언

  void _selectStation(bool isDeparture) async {
    final selectedStation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(isDeparture: isDeparture),
      ),
    );
    //StationListPage로부터 선택된 역 이름 가져옴

    if (selectedStation != null) {
      setState(() {
        if (isDeparture) {
          departureStation = selectedStation;
        } else {
          arrivalStation = selectedStation;
        }
      });
    }
  }

  void _goToSeatPage() {
    if (departureStation == null || arrivalStation == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('출발역과 도착역을 선택하세요!.')));
      //출발역과 도착역이 선택되지 않았을 때 메세지 출력
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SeatPage(
              departureStation: departureStation!,
              arrivalStation: arrivalStation!,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("기차 예매")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역 선택
            ListTile(
              title: const Text('출발역'),
              subtitle: Text(departureStation ?? '선택 안됨'),
              onTap: () => _selectStation(true),
            ),
            const SizedBox(height: 20),
            // 도착역 선택
            ListTile(
              title: const Text('도착역'),
              subtitle: Text(arrivalStation ?? '선택 안됨'),
              onTap: () => _selectStation(false),
            ),
            const SizedBox(height: 40),
            // 좌석 선택 버튼
            ElevatedButton(
              onPressed: _goToSeatPage,
              child: const Text('좌석 선택'),
            ),
          ],
        ),
      ),
    );
  }
}
