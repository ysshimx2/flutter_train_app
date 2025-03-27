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
} //예약확인 메세지 팝업

@override // 좌석 선택 화면 UI
Widget build(Buildcontext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('좌석 선택')),
    body: Column(
      children: [
        Text(
          '${widget.departureStation} → ${widget.arrivalStation}',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ), //상단 출발역,도착역 정보보
            itemCount: 80,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _toggleSeat(index),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        selectedSeats.contaions(index)
                            ? Colors.purple
                            : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ), //각 좌석 특성 설정
                ),
              );
            },
          ),
        ),
        ElevatedButton(onPressed: _confirmBooking, child: const Text('예매하기')),
      ], //하단 예매하기 버튼
    ),
  );
}
