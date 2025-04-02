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
    }); // 선택된 좌석의 상태 변경
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
        centerTitle: true,
      ), //상단 앱바 제목 가운데 고정
      body: Column(
        children: [
          _buildStationRow(widget), // 출발역 ~ 도착역 Row 분리
          const SizedBox(height: 16), // Row와 GridView 사이 여백
          /*Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
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
                    ),
                  ),
                );
              },
            ),
          ), */
          //좌석 선택 그리드뷰
          //코드 내 오류는 발견되지 않지만 UI작동하지 않는 문제 발생 중
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              //하단 예매하기 버튼
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
              onPressed: () => _confirmBooking,
              child: const Text(
                '예매하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 출발역, 화살표, 도착역 Row 위젯으로 분리
Widget _buildStationRow(dynamic widget) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40), // 좌우 동일한 여백 확보
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown, // 역 이름 길면 텍스트 크기 자동 줄임
            child: Text(
              widget.departureStation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
        ),
        Expanded(
          child: const Icon(
            Icons.arrow_circle_right_outlined,
            size: 30,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown, // 역 이름 길면 텍스트 크기 자동 줄임
            child: Text(
              widget.arrivalStation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ],
    ),
  );
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
