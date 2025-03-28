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
    // TODO: implement build
    throw UnimplementedError();
  }
}
