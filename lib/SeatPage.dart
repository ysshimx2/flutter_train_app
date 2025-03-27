import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
} //출발역 도착역 클래스

class _SeatPageState extends State<SeatPage> {
  Set<int> selectedSeats = {}; // 선택된 좌석

  void _toggleSeat(int seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber);
      } else {
        selectedSeats.add(seatNumber);
      }
    }); // 선택된 좌석의 좌석번호 상태 토글
  }
}
