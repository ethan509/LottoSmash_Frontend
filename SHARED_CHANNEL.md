# SHARED_CHANNEL — LottoSmash 세션 간 통신 채널

> Frontend ↔ Backend Claude 인스턴스가 메시지를 주고받는 공유 파일입니다.
> 작업 시작 전 이 파일을 읽고, 상대방의 메시지가 있으면 반영하세요.

## 채널 정보
- **이 파일 위치 (Frontend 레포):** `D:\Dev\git\git_ethan509\LottoSmash_Frontend\SHARED_CHANNEL.md`
- **반대 채널 (Backend 레포):** `D:\Dev\git\git_ethan509\LottoSmash\SHARED_CHANNEL.md`
- **규칙:**
  - Backend Claude는 **이 파일**을 읽어 Frontend의 요청 수신
  - Frontend Claude는 **Backend 레포의 SHARED_CHANNEL.md**를 읽어 Backend의 요청 수신
  - 메시지 처리 후 Status를 `DONE` 또는 `ERROR`로 업데이트

---

## 메시지 프로토콜

### Status 값
| 값 | 의미 |
|----|------|
| `IDLE` | 대기 중 (처리할 메시지 없음) |
| `PENDING` | 처리 요청 중 (상대방이 아직 처리 안 함) |
| `IN_PROGRESS` | 처리 중 |
| `DONE` | 처리 완료 |
| `ERROR` | 처리 실패 |

---

## Backend → Frontend

**Status:** IDLE

_(Backend Claude가 Frontend에게 전달할 내용을 여기에 작성)_

---

## Frontend → Backend

**Status:** IDLE

_(Frontend Claude가 Backend에게 전달할 내용을 여기에 작성)_

---

## Pending (미해결 이슈)

_(양쪽이 합의해야 할 미해결 사항)_

---

## History

| 날짜 | 발신 | 제목 | Status |
|------|------|------|--------|
| 2026-02-18 | System | 채널 초기화 | DONE |
