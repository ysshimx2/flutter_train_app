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
      appBar: AppBar(title: const Center(child: Text("기차 예매"))), //상단 앱바
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //세로 중앙 정렬
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '출발역',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => _selectStation(true), // 출발역 선택
                        child: const Text(
                          '선택',
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  const SizedBox(width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '도착역',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => _selectStation(true), // 도착역역 선택
                        child: const Text(
                          '선택',
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 150,
                  vertical: 15,
                ),
              ),
              onPressed: _goToSeatPage,
              child: const Text(
                '좌석 선택',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
