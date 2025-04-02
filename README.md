# flutter_train_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

##기차예매 앱 화면 구성하기
###과정
각각의 기능이 있는 페이지 구분하여 코드 작성
에뮬레이터 작동 시 UnImplementedError 다수 발생
위젯 관련 코드 수정 후 해결
UI명세에 맞춰 레이아웃 및 수치 상세 조정
###진행중
SeatPage 좌석 배치도 코드에서 오류 발견되지 않음에도 UI상 나타나지 않는 문제 발생 중
전 좌석이 '객체 찾을 수 없음'오류로 인해 빨간 박스로 나타남
위젯 코드 전체 주석처리 후 문제 해결 방법 찾는 중
###결과물
HomePage, StationListPage 정상 작동 확인 및 UI 명세와 일치
좌석 배치도 제외하고 SeatPage UI 명세 일치