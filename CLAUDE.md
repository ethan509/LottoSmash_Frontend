## 프롬프트 시작

너는 지금부터 **LottoSmash** 서비스의 Flutter 프론트엔드를 처음부터 개발할 거야. 백엔드는 Go(Chi router + PostgreSQL)로 이미 완성되어 있고, 모든 API가 동작 중이야. 아래 명세를 기반으로 Flutter 앱을 완성해줘.

---

## 1. 프로젝트 초기 설정

### 기본 정보
- **프로젝트 이름:** LottoSmash (패키지: `com.lottosmash.app`)
- **Flutter 버전:** 최신 stable
- **타겟 플랫폼:** Android, iOS (Web은 나중에)
- **언어:** Dart (null safety)
- **상태관리:** Riverpod (flutter_riverpod + riverpod_annotation)
- **라우팅:** GoRouter
- **HTTP 클라이언트:** Dio
- **로컬 저장소:** flutter_secure_storage (토큰), shared_preferences (설정)
- **UI 프레임워크:** Material 3 (다크모드 지원)

### 필수 패키지
```yaml
dependencies:
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  go_router: ^14.0.0
  dio: ^5.4.0
  flutter_secure_storage: ^9.0.0
  shared_preferences: ^2.2.0
  json_annotation: ^4.8.0
  freezed_annotation: ^2.4.0
  intl: ^0.19.0
  fl_chart: ^0.68.0
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.0
  shimmer: ^3.0.0
  pull_to_refresh_flutter3: ^2.0.0
  firebase_messaging: ^15.0.0
  firebase_core: ^3.0.0
  lottie: ^3.0.0

dev_dependencies:
  build_runner: ^2.4.0
  freezed: ^2.4.0
  json_serializable: ^6.7.0
  riverpod_generator: ^2.3.0
  flutter_lints: ^3.0.0
```

### 프로젝트 구조
```
lib/
├── main.dart
├── app.dart                          # MaterialApp + GoRouter + ProviderScope
├── core/
│   ├── config/
│   │   └── app_config.dart           # API base URL, 환경 설정
│   ├── constants/
│   │   ├── app_colors.dart           # 로또 공 색상, 테마 색상
│   │   ├── app_strings.dart          # 문자열 상수
│   │   └── api_endpoints.dart        # API 경로 상수
│   ├── network/
│   │   ├── dio_client.dart           # Dio 인스턴스 + 인터셉터
│   │   ├── auth_interceptor.dart     # JWT 자동 주입 + 401 시 refresh
│   │   └── api_exception.dart        # 에러 처리
│   ├── router/
│   │   └── app_router.dart           # GoRouter 설정
│   ├── theme/
│   │   ├── app_theme.dart            # Light/Dark 테마
│   │   └── lotto_ball_theme.dart     # 로또 공 색상 테마
│   └── utils/
│       ├── date_utils.dart
│       ├── number_format_utils.dart  # 금액 포맷 (억, 만원)
│       └── validators.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/               # AuthResponse, User 등
│   │   │   └── repositories/         # AuthRepository
│   │   ├── providers/                # auth_provider.dart
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── splash_screen.dart
│   │       │   ├── login_screen.dart
│   │       │   ├── register_screen.dart
│   │       │   ├── email_verify_screen.dart
│   │       │   └── profile_screen.dart
│   │       └── widgets/
│   ├── home/
│   │   └── presentation/
│   │       └── screens/
│   │           └── home_screen.dart  # 메인 대시보드
│   ├── draws/
│   │   ├── data/
│   │   │   ├── models/               # LottoDraw
│   │   │   └── repositories/         # DrawRepository
│   │   ├── providers/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── draw_list_screen.dart
│   │       │   └── draw_detail_screen.dart
│   │       └── widgets/
│   │           ├── draw_card.dart
│   │           └── lotto_ball.dart   # 로또 공 위젯
│   ├── stats/
│   │   ├── data/
│   │   │   ├── models/               # 각종 통계 모델
│   │   │   └── repositories/         # StatsRepository
│   │   ├── providers/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── stats_overview_screen.dart
│   │       │   ├── number_frequency_screen.dart
│   │       │   ├── bayesian_screen.dart
│   │       │   ├── pair_stats_screen.dart
│   │       │   ├── ratio_stats_screen.dart
│   │       │   ├── consecutive_screen.dart
│   │       │   ├── color_stats_screen.dart
│   │       │   └── grid_stats_screen.dart
│   │       └── widgets/
│   │           ├── frequency_chart.dart
│   │           ├── probability_bar.dart
│   │           └── hot_cold_indicator.dart
│   ├── recommend/
│   │   ├── data/
│   │   │   ├── models/               # Recommendation, Method
│   │   │   └── repositories/         # RecommendRepository
│   │   ├── providers/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── recommend_screen.dart      # 분석 방법 선택 + 결과
│   │       │   └── recommend_history_screen.dart
│   │       └── widgets/
│   │           ├── method_selector.dart
│   │           ├── combine_method_selector.dart
│   │           ├── weight_slider.dart
│   │           └── recommendation_card.dart
│   ├── notifications/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── providers/
│   │   └── presentation/
│   │       └── screens/
│   │           ├── notification_list_screen.dart
│   │           └── winning_check_screen.dart
│   └── zam/
│       ├── data/
│       │   ├── models/               # ZamTransaction
│       │   └── repositories/
│       ├── providers/
│       └── presentation/
│           └── widgets/
│               └── zam_balance_widget.dart
└── shared/
    └── widgets/
        ├── lotto_ball.dart           # 색상별 로또 공
        ├── loading_indicator.dart
        ├── error_widget.dart
        ├── empty_state_widget.dart
        └── bottom_nav_bar.dart
```

---

## 2. 백엔드 API 전체 명세

### 서버 정보
- **Base URL:** `http://10.0.2.2:8080` (Android 에뮬레이터) / `http://localhost:8080` (iOS 시뮬레이터)
- **Content-Type:** `application/json`
- **인증 헤더:** `Authorization: Bearer {access_token}`

### 2.1 인증 API

#### POST /api/auth/guest - 게스트 로그인
```
Request:  { "device_id": "string" }
Response: { "access_token": "...", "refresh_token": "...", "expires_in": 900, "token_type": "Bearer" }
```

#### POST /api/auth/send-code - 인증코드 발송
```
Request:  { "email": "string" }
Response: { "message": "verification code sent" }
```

#### POST /api/auth/register - 이메일 회원가입
```
Request: {
  "email": "string",
  "password": "string",
  "code": "string",           // 인증코드
  "gender": "M|F|O",          // 필수
  "birth_date": "YYYY-MM-DD", // 필수
  "region": "string",         // 선택
  "nickname": "string",       // 선택, max 20자
  "purchase_frequency": "WEEKLY|MONTHLY|BIMONTHLY|IRREGULAR"  // 선택
}
Response: { "access_token": "...", "refresh_token": "...", "expires_in": 900, "token_type": "Bearer" }
Errors: 400(유효성), 409(이메일 중복)
```

#### POST /api/auth/login - 이메일 로그인
```
Request:  { "email": "string", "password": "string" }
Response: { "access_token": "...", "refresh_token": "...", "expires_in": 900, "token_type": "Bearer" }
Errors: 401(인증 실패)
```

#### POST /api/auth/refresh - 토큰 갱신
```
Request:  { "refresh_token": "string" }
Response: { "access_token": "...", "refresh_token": "...", "expires_in": 900, "token_type": "Bearer" }
Errors: 401(유효하지 않은 토큰)
```

#### POST /api/auth/logout - 로그아웃
```
Request:  { "refresh_token": "string" }
Response: { "message": "logged out successfully" }
```

#### GET /api/auth/me - 내 정보 조회 (인증 필요)
```
Response: {
  "id": 123,
  "email": "user@example.com",
  "device_id": null,
  "lotto_tier": 1,
  "tier": {
    "id": 1, "code": "MEMBER", "name": "정회원",
    "level": 1, "is_active": true
  },
  "zam_balance": 200,
  "gender": "M",
  "birth_date": "1990-01-15T00:00:00Z",
  "region": "Seoul",
  "nickname": "tester",
  "purchase_frequency": "WEEKLY",
  "created_at": "...", "updated_at": "..."
}
```

#### POST /api/auth/link-email - 게스트→이메일 연동 (인증 필요)
```
Request: { "email": "string", "password": "string", "code": "string" }
Response: { "message": "email linked successfully" }
```

#### POST /api/auth/change-password - 비밀번호 변경 (인증 필요)
```
Request: { "old_password": "string", "new_password": "string" }
Response: { "message": "password changed successfully" }
```

### 2.2 로또 당첨 회차 API

#### GET /api/lotto/draws - 당첨번호 목록
```
Query: limit(1-100, 기본20), offset(기본0)
Response: {
  "draws": [{
    "draw_no": 1100, "draw_date": "2024.02.10",
    "num1": 3, "num2": 7, "num3": 11, "num4": 15, "num5": 23, "num6": 42,
    "bonus_num": 45,
    "first_prize": 2500000000, "first_winners": 3, "first_per_game": 833333333,
    "second_prize": ..., "second_winners": ..., "second_per_game": ...,
    "third_prize": ..., "fourth_prize": ..., "fifth_prize": ...
  }],
  "total_count": 1234,
  "latest_draw": 1234
}
```

#### GET /api/lotto/draws/{drawNo} - 특정 회차 조회
```
Response: (단일 LottoDraw 객체)
Errors: 404(없음)
```

### 2.3 통계 API (모두 Public)

#### GET /api/lotto/stats - 종합 통계
```
Response: {
  "number_stats": [{ "number": 1, "total_count": 234, "bonus_count": 10, "last_draw_no": 1200 }],
  "reappear_stats": [{ "number": 7, "total_appear": 234, "reappear_count": 156, "probability": 0.6667 }],
  "latest_draw_no": 1234
}
```

#### GET /api/lotto/stats/numbers - 번호 출현 빈도
```
Response: { "number_stats": [{ "number": 1, "total_count": 234, "bonus_count": 10, "last_draw_no": 1200 }] }
```

#### GET /api/lotto/stats/reappear - 재출현 확률
```
Response: { "reappear_stats": [{ "number": 7, "total_appear": 234, "reappear_count": 156, "probability": 0.6667 }] }
```

#### GET /api/lotto/stats/first-last - 첫번째/마지막 위치 통계
```
Response: {
  "first_stats": [{ "number": 1, "count": 45, "probability": 0.0364 }],
  "last_stats": [{ "number": 45, "count": 52, "probability": 0.0421 }],
  "total_draws": 1234
}
```

#### GET /api/lotto/stats/pairs - 번호 쌍 동시출현
```
Query: top(1-100, 기본20)
Response: {
  "top_pairs": [{ "number1": 7, "number2": 11, "count": 23, "probability": 0.0186 }],
  "bottom_pairs": [...],
  "total_draws": 1234
}
```

#### GET /api/lotto/stats/consecutive - 연속번호 패턴
```
Response: {
  "count_stats": [{ "consecutive_count": 0, "draw_count": 45, "probability": 0.0364 }],
  "recent_examples": [{ "draw_no": 1234, "numbers": [3,4,7,11,23,42], "consecutive_count": 1 }],
  "total_draws": 1234
}
```

#### GET /api/lotto/stats/ratio - 홀짝/고저 비율
```
Response: {
  "odd_even_stats": [{ "ratio": "3:3", "count": 234, "probability": 0.1894 }],
  "high_low_stats": [{ "ratio": "3:3", "count": 456, "probability": 0.3694 }],
  "total_draws": 1234
}
```

#### GET /api/lotto/stats/colors - 색상 패턴
```
Query: top(1-100, 기본20)
Response: {
  "top_patterns": [{ "pattern": "YBRRGR", "count": 3, "probability": 0.0024 }],
  "color_counts": { "Y": 234, "B": 234, "R": 456, "G": 234, "E": 45 },
  "total_draws": 1234
}
색상: Y(1-10 노랑), B(11-20 파랑), R(21-30 빨강), G(31-40 회색), E(41-45 초록)
```

#### GET /api/lotto/stats/grid - 행열 패턴
```
Query: top(1-100, 기본20)
Response: {
  "row_stats": [{ "line": 1, "count": 234, "probability": 0.1894 }],
  "col_stats": [{ "line": 1, "count": 234, "probability": 0.1894 }],
  "top_row_patterns": [{ "distribution": "2:1:1:1:1:0:0", "count": 10, "probability": 0.0081 }],
  "top_col_patterns": [...]
}
```

#### GET /api/lotto/stats/bayesian - 베이지안 분석
```
Query: window(1-500, 기본50)
Response: {
  "numbers": [{
    "number": 7, "prior": 0.0222, "likelihood": 0.08,
    "posterior": 0.0456, "recent_count": 4, "expected_count": 2.5,
    "deviation": 1.5, "status": "HOT|COLD|NEUTRAL",
    "last_appear_draw": 1234, "gap_since_last": 0
  }],
  "hot_numbers": [...],
  "cold_numbers": [...],
  "window_size": 50, "total_draws": 1234
}
```

#### GET /api/lotto/stats/bayesian/history - 베이지안 이력
```
Query: number(1-45, 필수), limit(1-1000, 기본50)
Response: { "number": 7, "history": [{ "draw_no": 1234, "prior": 0.0222, "posterior": 0.0456, "appeared": true }] }
```

#### GET /api/lotto/stats/bayesian/{drawNo} - 특정 회차 베이지안
```
Response: [{ "draw_no": 1200, "number": 1, "prior": 0.0222, "posterior": 0.0387, "appeared": true }]
```

#### GET /api/lotto/stats/analysis - 통합 분석
```
Response: {
  "stats": [{
    "draw_no": 1234, "number": 7,
    "total_count": 234, "total_prob": 0.0315,
    "bonus_count": 12, "bonus_prob": 0.0097,
    "first_count": 10, "first_prob": 0.0081,
    "last_count": 8, "last_prob": 0.0065,
    "reappear_total": 150, "reappear_count": 100, "reappear_prob": 0.6667,
    "bayesian_prior": 0.0222, "bayesian_post": 0.0456,
    "color_count": 234, "color_prob": 0.0315,
    "row_count": 234, "row_prob": 0.0315,
    "col_count": 234, "col_prob": 0.0315,
    "appeared": true
  }],
  "latest_draw_no": 1234
}
```

#### GET /api/lotto/stats/analysis/{drawNo} - 특정 회차 분석
#### GET /api/lotto/stats/analysis/history - 번호별 분석 이력
```
Query: number(1-45, 필수), limit(1-1000, 기본50)
```

### 2.4 추천 API

#### GET /api/lotto/methods - 분석 방법 목록
```
Response: {
  "methods": [{
    "id": 1, "code": "FREQUENCY", "name": "번호 빈도 분석",
    "description": "...", "category": "statistical", "is_active": true, "sort_order": 1
  }],
  "total_count": 10
}
```

#### GET /api/lotto/combine-methods - 결합 방법 목록
```
Response: {
  "methods": [
    { "code": "SIMPLE_AVG", "name": "단순 평균", "description": "...", "sort_order": 1 },
    { "code": "WEIGHTED_AVG", "name": "가중 평균", "description": "...", "sort_order": 2 },
    { "code": "BAYESIAN_COMBINE", "name": "베이지안 결합", "description": "...", "sort_order": 3 },
    { "code": "GEOMETRIC_MEAN", "name": "기하 평균", "description": "...", "sort_order": 4 },
    { "code": "MIN_MAX", "name": "최대/최소 기반", "description": "...", "sort_order": 5 }
  ]
}
```

#### POST /api/lotto/recommend - 번호 추천 생성
```
Request: {
  "method_codes": ["FREQUENCY", "BAYESIAN"],  // 1~3개
  "combine_code": "SIMPLE_AVG",
  "weights": { "FREQUENCY": 0.6, "BAYESIAN": 0.4 },  // WEIGHTED_AVG일 때만
  "min_max_mode": "MAX",                               // MIN_MAX일 때만 (MAX 또는 MIN)
  "include_bonus": false,
  "count": 5                                            // 1~10세트
}
Response: {
  "recommendations": [{
    "numbers": [7, 11, 23, 35, 42, 44],
    "bonus": 45,
    "methods_used": ["FREQUENCY", "BAYESIAN"],
    "combine_method": "SIMPLE_AVG",
    "confidence": 0.6234,
    "details": {
      "FREQUENCY": { "numbers": [7,11,23,35,42,44], "probability": 0.5623 },
      "BAYESIAN": { "numbers": [3,11,28,35,42,44], "probability": 0.6845 }
    }
  }],
  "generated_at": "2026-02-14T12:00:00Z",
  "latest_draw_no": 1234
}
Errors: 400(방법 없음, 최대 3개 초과, 가중치 오류)
```

### 2.5 알림 API (모두 인증 필요)

#### POST /api/notifications/device-token - 디바이스 토큰 등록
```
Request: { "token": "FCM token", "platform": "android|ios|web" }
```

#### DELETE /api/notifications/device-token - 디바이스 토큰 삭제
```
Request: { "token": "FCM token" }
```

#### GET /api/notifications - 알림 목록
```
Query: limit(1-100, 기본20), offset(기본0)
Response: {
  "notifications": [{ "id": 1, "type": "winning", "title": "...", "body": "...", "status": "sent", "created_at": "..." }],
  "total_count": 5
}
```

#### GET /api/notifications/winnings - 당첨 확인 목록
```
Query: limit(1-100, 기본20), offset(기본0)
Response: {
  "winnings": [{
    "id": 1, "recommendation_id": 456, "draw_no": 1234,
    "matched_numbers": [7,11,23], "matched_count": 3,
    "bonus_matched": false, "prize_rank": 5
  }],
  "total_count": 2
}
```

### 2.6 관리자 API (인증 필요)

#### POST /api/admin/lotto/sync - 수동 데이터 동기화
```
Response: { "message": "sync completed successfully" }
```

---

## 3. 핵심 비즈니스 로직

### 3.1 로또 번호 색상 체계 (매우 중요!)
한국 로또 6/45의 공식 색상:
| 범위 | 색상 | 코드 | Hex |
|------|------|------|-----|
| 1-10 | 노랑 | Y | #FBC400 |
| 11-20 | 파랑 | B | #69C8F2 |
| 21-30 | 빨강 | R | #FF7272 |
| 31-40 | 회색 | G | #AAAAAA |
| 41-45 | 초록 | E | #B0D840 |

로또 공 위젯은 원형에 번호가 표시되며, 해당 범위의 색상으로 표시됨.

### 3.2 멤버십 티어
| 레벨 | 코드 | 이름 | 일일 Zam |
|------|------|------|---------|
| 0 | GUEST | 게스트 | 10 |
| 1 | MEMBER | 정회원 | 20 |
| 2 | GOLD | 골드회원 | 200 |
| 3 | VIP | VIP회원 | 500 |

### 3.3 Zam 가상 화폐
- 회원가입/게스트 로그인 시 보너스 지급
- 일일 로그인 보상
- 추후 기능 사용에 소비 예정

---

## 4. 화면별 상세 요구사항

### 4.1 스플래시 화면 (SplashScreen)
- 앱 로고 + 로딩 애니메이션
- 저장된 토큰 확인 → 유효하면 홈으로, 아니면 로그인으로
- 토큰 만료 시 자동 refresh 시도

### 4.2 로그인 화면 (LoginScreen)
- 게스트 로그인 버튼 (device_id 자동 생성)
- 이메일 로그인 폼 (email + password)
- 회원가입 이동 버튼
- 로그인 성공 시 토큰 저장 후 홈으로

### 4.3 회원가입 화면 (RegisterScreen)
- Step 1: 이메일 입력 → 인증코드 발송
- Step 2: 인증코드 입력 확인
- Step 3: 비밀번호 설정
- Step 4: 프로필 입력 (성별*, 생년월일*, 지역, 닉네임, 구매 빈도)
- 완료 시 자동 로그인

### 4.4 홈 화면 (HomeScreen) - 메인 대시보드
- **상단:** 사용자 닉네임/티어 + Zam 잔액
- **최신 당첨번호:** 가장 최근 회차 번호 (로또 공으로 표시)
- **빠른 추천:** "번호 추천받기" 버튼
- **통계 요약:** 핫/콜드 번호 미리보기 (베이지안 기반)
- **하단 네비게이션바:** 홈 | 당첨번호 | 통계 | 추천 | 내 정보

### 4.5 당첨번호 화면 (DrawListScreen)
- 무한 스크롤 목록 (최신순)
- 각 카드: 회차번호, 날짜, 6개 번호(공) + 보너스, 1등 당첨금
- 탭 시 상세 화면으로

### 4.6 당첨번호 상세 (DrawDetailScreen)
- 6개 번호 + 보너스 번호 (큰 로또 공)
- 1~5등 당첨자 수, 당첨금액
- 금액은 한국 원화 포맷 (예: 25억 3,000만원)

### 4.7 통계 화면 (StatsOverviewScreen)
카드형 메뉴로 각 통계 화면 진입:
- **번호 출현 빈도** → NumberFrequencyScreen (막대 차트)
- **재출현 확률** → 번호별 재출현 확률 표시
- **베이지안 분석** → BayesianScreen (HOT/COLD 표시, 상세 차트)
- **번호 쌍** → PairStatsScreen (Top/Bottom 쌍)
- **연속번호** → ConsecutiveScreen (패턴 분포)
- **홀짝/고저 비율** → RatioStatsScreen (도넛 차트)
- **색상 패턴** → ColorStatsScreen
- **행열 패턴** → GridStatsScreen

### 4.8 번호 추천 화면 (RecommendScreen) ⭐ 핵심 화면
**Step 1 - 분석 방법 선택:**
- GET /api/lotto/methods로 방법 목록 가져오기
- 체크박스로 1~3개 선택
- 각 방법의 설명 표시

**Step 2 - 결합 방법 선택:**
- GET /api/lotto/combine-methods로 결합 방법 목록 가져오기
- 라디오버튼으로 1개 선택
- WEIGHTED_AVG 선택 시 → 각 분석 방법별 가중치 슬라이더 표시 (합계 1.0)
- MIN_MAX 선택 시 → MAX(낙관적) / MIN(보수적) 선택

**Step 3 - 옵션:**
- 보너스 번호 포함 여부 토글
- 추천 세트 수 (1~10) 선택

**Step 4 - 결과:**
- POST /api/lotto/recommend 호출
- 추천 번호를 로또 공으로 표시
- 신뢰도(confidence) 표시
- 각 분석 방법별 개별 결과도 표시 (details)
- 결과 저장/공유 기능

### 4.9 프로필 화면 (ProfileScreen)
- 사용자 정보 표시 및 수정
- 게스트인 경우 이메일 연동 버튼
- 비밀번호 변경
- 멤버십 티어 정보
- Zam 잔액 및 내역
- 알림 설정
- 로그아웃

### 4.10 알림 화면 (NotificationListScreen)
- 알림 목록 (페이지네이션)
- 당첨 확인 결과 별도 탭

---

## 5. 기술 구현 요구사항

### 5.1 인증 흐름 (Auth Interceptor)
```dart
// Dio interceptor에서:
// 1. 모든 요청에 access_token 자동 추가
// 2. 401 응답 시 refresh_token으로 토큰 갱신 시도
// 3. 갱신 성공 → 원래 요청 재시도
// 4. 갱신 실패 → 로그인 화면으로 리다이렉트
// 5. 토큰은 flutter_secure_storage에 저장
```

### 5.2 에러 처리
- 네트워크 에러 → 재시도 가능한 에러 화면
- 401 → 자동 토큰 갱신 또는 로그인 화면
- 404 → "데이터 없음" 화면
- 500 → 일반 에러 화면
- 모든 API 에러는 `{ "error": "message" }` 형식

### 5.3 오프라인 지원
- 최근 당첨번호는 로컬 캐시
- 통계 데이터도 캐시 (TTL: 1시간)
- 오프라인 시 캐시된 데이터 표시

### 5.4 UI/UX 가이드라인
- Material 3 디자인 시스템
- 다크모드 지원 (시스템 설정 따름)
- 한국어 우선 (추후 영어 지원)
- 로또 공은 항상 원형 + 그라데이션 + 그림자
- 숫자 포맷: 금액은 한국식 (예: 25억, 1,500만원)
- 날짜 포맷: YYYY.MM.DD
- 로딩 중 Shimmer 효과
- Pull-to-refresh 지원

### 5.5 FCM 푸시 알림
- Firebase 초기화
- 토큰 자동 등록 (POST /api/notifications/device-token)
- 포그라운드/백그라운드 알림 처리

---

## 6. 개발 순서 (단계별)

### Phase 1: 기반 구축
1. Flutter 프로젝트 초기화 + 패키지 설치
2. 프로젝트 구조 생성
3. 테마 설정 (Material 3, 로또 공 색상)
4. Dio 클라이언트 + Auth Interceptor
5. GoRouter 설정
6. 기본 모델 클래스 (freezed)

### Phase 2: 인증
7. 스플래시 화면
8. 게스트 로그인
9. 이메일 로그인/회원가입
10. 프로필 화면

### Phase 3: 핵심 기능
11. 홈 대시보드
12. 당첨번호 목록/상세
13. 로또 공 위젯

### Phase 4: 통계
14. 통계 개요 화면
15. 각 통계 상세 화면 (8개)
16. 차트/그래프 구현

### Phase 5: 추천
17. 분석 방법 선택 UI
18. 결합 방법 선택 + 가중치
19. 추천 결과 화면

### Phase 6: 부가 기능
20. 알림 UI (FCM 제외)
21. Zam 잔액 위젯
22. 오프라인 캐시 (SharedPreferences + TTL)
23. 다크모드 수동 전환 (시스템/라이트/다크)

### Phase 7: FCM 푸시 알림 연동
**사전 준비 (수동):**
- Firebase Console에서 프로젝트 생성
- `google-services.json` (Android) 다운로드 → `android/app/`에 배치
- `GoogleService-Info.plist` (iOS) 다운로드 → `ios/Runner/`에 배치

**구현 항목:**
24. `pubspec.yaml`에 `firebase_core` + `firebase_messaging` 추가
25. Android `build.gradle`에 google-services 플러그인 추가
26. `main.dart`에서 `Firebase.initializeApp()` 호출
27. FCM 서비스 생성 (`lib/core/services/fcm_service.dart`)
    - FCM 토큰 획득 → `POST /api/notifications/device-token` 자동 등록
    - 토큰 갱신 리스너 (`onTokenRefresh`)
    - 포그라운드 알림 처리 (`FirebaseMessaging.onMessage`)
    - 백그라운드 알림 처리 (`FirebaseMessaging.onBackgroundMessage`)
    - 알림 탭 시 화면 이동 (`onMessageOpenedApp`)
28. 로그아웃 시 `DELETE /api/notifications/device-token` 호출
29. 프로필 화면에 알림 ON/OFF 토글 추가

**이미 준비된 것:**
- `NotificationRepository.registerDeviceToken()` / `deleteDeviceToken()` 구현됨
- `NotificationListScreen` (알림 목록 + 당첨 확인 탭) 구현됨
- API 엔드포인트 정의됨 (`ApiEndpoints.deviceToken`)

---

## 7. 중요 참고사항

- 이 프로젝트는 한국 로또 6/45 분석 서비스임
- 모든 텍스트는 한국어로 작성
- 금액 표시는 반드시 한국식 (원, 만원, 억원)
- 로또 공 색상은 한국 동행복권 공식 색상 사용
- API 서버는 localhost:8080에서 실행 중
- 추천 시스템이 핵심 기능이므로 UX를 가장 신경 써서 만들 것
- Phase 1부터 순서대로 진행하되, 각 Phase 완료 시 빌드 확인
- 각 Phase 시작 전에 해당 Phase에서 구현할 내용을 먼저 설명하고 확인 받은 후 진행

## Git Branch Strategy
**항상 다음 순서로 머지할 것:**

```
feature/* → develop → main
```

- 새 기능 개발 시 `feature/` 브랜치 생성
- 작업 완료 후 `develop`에 먼저 머지
- `develop`에서 `main`으로 머지
- feature 브랜치 삭제금지
- BRANCH_POLICY.md 내용 참조


## Shared Channel (세션 간 통신)

- **내가 쓰는 파일** (Frontend가 읽음): `D:\Dev\git\git_ethan509\LottoSmash\SHARED_CHANNEL.md`
- **내가 읽는 파일** (Frontend가 씀): `D:\Dev\git\git_ethan509\LottoSmash_Frontend\SHARED_CHANNEL.md`
- **작업 시작 시**: Frontend 파일을 읽고 Backend에게 요청/질문이 있으면 반영
- **작업 완료 시**: 내 SHARED_CHANNEL.md에 Frontend가 알아야 할 변경사항 기록
- **규칙**: 내 파일에만 쓰기, Frontend 파일은 읽기만
- 해결된 항목은 삭제
