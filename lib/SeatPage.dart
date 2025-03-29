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

//class _toggleSeat {
//final int index;
//const _toggleSeat(this.index);
//}

class _SeatPageState extends State<SeatPage> {
  Set<int> selectedSeats = {}; // 선택된 좌석

  void _toggleSeat(int seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber);
      } else {
        selectedSeats.add(seatNumber);
      }
    }); // 선택된 좌석의 상태 변경
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('좌석 선택')),
      body: Row(
        children: [
          Text(
            widget.departureStation,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const Icon(
            Icons.arrow_circle_right_outlined,
            size: 30,
            color: Colors.grey,
          ),
          Text(
            widget.arrivalStation,
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
              ), //상단 출발역,도착역 정보
              itemCount: 80,
              itemBuilder: (context, index) {
                var selectedSeats;
                return GestureDetector(
                  onTap: () => _toggleSeat(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          selectedSeats.contains(index)
                              ? Colors.purple
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ), //각 좌석 특성 설정
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => _confirmBooking,
            child: const Text('예매하기'),
          ),
        ], //하단 예매하기 버튼
      ),
    );
  }
}

void _confirmBooking(dynamic selectedSeats) {
  if (selectedSeats.isEmpty) return; // 선택된 좌석이 없으면 예약하지 않음

  var context;
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('예매 확인'),
          content: const Text('예매하시겠습니까?'),
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

class _toggleSeat {
  _toggleSeat(int index);
}
