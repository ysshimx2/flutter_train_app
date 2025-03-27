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

void _confirmBooking() {
  if (selectedSeats.isEmpty) return; // 선택된 좌석이 없으면 예약하지 않음

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('예매 확인'),
          content: Text('예매하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, selectedSeats);
              },
              child: const Text('확인'),
            ),
          ],
        ),
  );
}
