## 파일 구조
lib/
 ├── main.dart                // 앱 진입점
 ├── app.dart                 // MaterialApp, 라우팅 등 전체 앱 설정
 │
 ├── core/                    // 전역에서 쓰이는 공통 리소스
 │   ├── theme/               // 색상, 폰트, 라이트/다크 모드
 │   ├── utils/               // 헬퍼 함수, 상수, 공용 클래스
 │   └── widgets/             // 전역 공용 위젯 (e.g. CustomButton)
 │
 ├── features/                // 기능(도메인) 단위로 폴더 분리
 │   ├── home/
 │   │   ├── view/            // UI (화면, 위젯)
 │   │   ├── model/           // 데이터 클래스, 상태
 │   │   └── controller/      // 상태 관리 (Cubit, Provider, Riverpod 등)
 │   │
 │   ├── search/
 │   │   ├── view/
 │   │   ├── model/
 │   │   └── controller/
 │   │
 │   └── settings/
 │       ├── view/
 │       ├── model/
 │       └── controller/
 │
 ├── routes/                  // 전역 라우팅 정의
 │   └── app_routes.dart
 │
 └── navigation/              // 하단 네비게이션, 탭 네비게이션 등
     └── bottom_nav.dart
