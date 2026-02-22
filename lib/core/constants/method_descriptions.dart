/// 분석 방법 코드별 UI 표시 문안
///
/// Backend SHARED_CHANNEL [2026-02-22] 에서 제공한 4계층 설명 문안.
/// - label: 화면에 표시할 짧은 이름
/// - tagline: 한 줄 요약 (카드 부제목용)
/// - description: 일반 사용자용 설명 (툴팁/팝오버용)
/// - techNote: 수학/통계 심화 설명 (접기/펼치기용)
class MethodDescription {
  final String label;
  final String tagline;
  final String description;
  final String techNote;

  const MethodDescription({
    required this.label,
    required this.tagline,
    required this.description,
    required this.techNote,
  });
}

const Map<String, MethodDescription> kMethodDescriptions = {
  'NUMBER_FREQUENCY': MethodDescription(
    label: '출현 빈도',
    tagline: '역대 로또에서 가장 많이 나온 번호를 골라드려요',
    description:
        '수십 년치 로또 당첨 기록을 모두 모아, 번호마다 "지금까지 몇 번 나왔는지"를 세어봤어요. '
        '많이 나온 번호일수록 높은 점수를 받아 추천 순위에 오르게 됩니다. '
        '가장 직관적이고 기본에 충실한 방법이에요.',
    techNote:
        '각 번호 n의 경험적 출현확률 p(n) = count(n) / (총 추첨 횟수 × 6)을 기반으로 번호 가중치를 산정. '
        '최대우도추정(MLE)의 가장 단순한 형태.',
  ),
  'REAPPEAR_PROB': MethodDescription(
    label: '재등장 확률',
    tagline: '지난 주에 나왔던 번호가 이번 주에도 나올 확률을 계산해요',
    description:
        '지난 회차 당첨번호 중 일부가 다음 회차에 다시 나오는 경우가 꽤 있어요. '
        '이 방법은 "어떤 번호가 한 번 나온 뒤 얼마나 빨리 다시 나오는가"를 역대 데이터로 계산해 추천에 활용합니다.',
    techNote:
        '회차 t의 당첨번호 집합 S(t)에서 번호 n ∈ S(t)가 S(t+1)에 재등장하는 '
        '조건부 확률 P(n ∈ S(t+1) | n ∈ S(t))를 누적 집계.',
  ),
  'FIRST_POSITION': MethodDescription(
    label: '첫 번째 자리',
    tagline: '6개 번호 중 가장 작은 번호 자리에 자주 등장하는 번호를 분석해요',
    description:
        '로또는 6개 번호를 작은 순서로 나열했을 때 "첫 번째 자리"에 자주 나오는 번호가 따로 있어요. '
        '예를 들어 1, 2, 3이 1번 자리를 가장 많이 차지해요. 이 방법은 그 패턴을 활용합니다.',
    techNote:
        '정렬된 당첨번호 벡터 (n₁ < n₂ < … < n₆)에서 n₁(최솟값) 위치의 역대 분포 P(n₁ = k)를 가중치로 사용.',
  ),
  'LAST_POSITION': MethodDescription(
    label: '마지막 자리',
    tagline: '6개 번호 중 가장 큰 번호 자리에 자주 등장하는 번호를 분석해요',
    description:
        '반대로 6개 번호 중 "마지막(가장 큰) 자리"에 자주 오는 번호도 따로 있어요. '
        '40번대 번호들이 주로 이 자리를 차지하는데, 어떤 번호가 얼마나 자주 그 자리에 왔는지를 분석해 추천합니다.',
    techNote:
        '정렬된 당첨번호 벡터에서 n₆(최댓값) 위치의 역대 분포 P(n₆ = k)를 가중치로 사용.',
  ),
  'PAIR_FREQUENCY': MethodDescription(
    label: '쌍 빈도',
    tagline: '항상 같이 나오는 번호 짝꿍을 찾아드려요',
    description:
        '번호들 사이에는 유독 "같이 나오는 사이"가 있어요. 예를 들어 7번이 나올 때마다 23번도 자주 따라온다면, '
        '두 번호는 좋은 짝꿍이에요. 이 방법은 모든 번호 쌍의 동반 출현 기록을 분석해, '
        '다른 번호들과 가장 친한 번호를 추천합니다.',
    techNote:
        '모든 C(45,2) = 990쌍의 동시출현 확률 P(n,m)을 집계. '
        '번호 n의 점수 = Σ P(n,m) for m≠n (쌍 확률 합산), 전체 합으로 정규화.',
  ),
  'CONSECUTIVE': MethodDescription(
    label: '연번 패턴',
    tagline: '1·2·3처럼 연속된 번호가 몇 개 들어갈지 예측해서 추천해요',
    description:
        '로또 당첨번호를 보면 14, 15, 16처럼 연달아 붙은 번호가 꼭 하나 이상 들어있는 경우가 많아요. '
        '이 방법은 역대 데이터에서 "연속번호가 몇 개나 나왔는지" 분포를 계산하고, '
        '그 패턴에 맞게 연속번호 근처의 번호들을 우선 추천합니다.',
    techNote:
        '역대 회차 연번 클러스터 개수 분포 dist[k]에서 기대 연번 비율 '
        'pConsec = Σ(k·dist[k]) / (총 추첨×6) 계산. '
        '번호 n의 가중치 = pConsec × adjacentCount(n) / Σ adjacentCount.',
  ),
  'ODD_EVEN_RATIO': MethodDescription(
    label: '홀짝 비율',
    tagline: '홀수 3개·짝수 3개, 역대 황금 비율로 맞춰드려요',
    description:
        '로또 6개 번호 중 홀수와 짝수가 몇 개씩 들어가는지에도 패턴이 있어요. '
        '역대 통계를 보면 홀수 3개·짝수 3개(3:3)가 가장 자주 나와요. '
        '이 방법은 역대 분포를 기반으로 홀수·짝수 번호에 각각 알맞은 가중치를 주어 황금 비율에 맞는 번호를 추천합니다.',
    techNote:
        '역대 회차 홀짝 조합 분포에서 홀수 슬롯의 기대값 pOdd = E[홀수 개수/6] 산출. '
        '홀수 번호 가중치 = pOdd × freq(n)/Σfreq(홀수), '
        '짝수 번호 가중치 = pEven × freq(n)/Σfreq(짝수).',
  ),
  'HIGH_LOW_RATIO': MethodDescription(
    label: '고저 비율',
    tagline: '낮은 번호(1~22)와 높은 번호(23~45)를 황금 비율로 섞어드려요',
    description:
        '번호를 낮은 구간(1~22번)과 높은 구간(23~45번)으로 나눴을 때, 어느 쪽이 몇 개 들어가는지에도 패턴이 있어요. '
        '역대 데이터를 보면 3:3 비율이 가장 자주 나와요. '
        '이 방법은 그 분포를 분석해서 낮은 번호·높은 번호 각각에 적절한 점수를 줍니다.',
    techNote:
        '역대 회차 고저 조합 분포에서 고번호 슬롯 기대값 pHigh = E[고번호 개수/6] 산출. '
        '고번호(23~45) 가중치 = pHigh × freq(n)/Σfreq(고번호), '
        '저번호(1~22) 가중치 = pLow × freq(n)/Σfreq(저번호).',
  ),
  'BAYESIAN': MethodDescription(
    label: '베이지안 분석',
    tagline: '오래된 기록보다 최근 흐름을 더 믿어요',
    description:
        '오래전 기록과 최근 기록을 똑같이 취급하면 안 될 수도 있어요. '
        '베이지안 분석은 오래된 데이터를 "배경 지식"으로 삼고, 최근 수십 회차 결과를 더 강하게 반영해서 '
        '번호의 현재 가능성을 계산합니다. 유행이 바뀌어도 빠르게 적응하는 방법이에요.',
    techNote:
        'Beta-Binomial 켤레 Prior: Beta(α₀, β₀) (균등 사전). '
        '최근 N=50회차 출현 데이터로 사후분포 Beta(α₀+hits, β₀+misses) 갱신. '
        '사후평균 E[p] = (α₀+hits)/(α₀+β₀+N)을 번호 가중치로 사용.',
  ),
  'HOT_COLD': MethodDescription(
    label: 'HOT·COLD 조합',
    tagline: '요즘 잘 나오는 번호와 오래 쉰 번호를 함께 담아요',
    description:
        '"요즘 자주 나오는 뜨거운 번호"와 "한동안 나오지 않아서 슬슬 나올 것 같은 차가운 번호"를 절반씩 섞는 전략이에요. '
        '균형 있는 포트폴리오처럼, 상승세 번호와 반등 기대 번호를 모두 담습니다.',
    techNote:
        '최근 50회차 베이지안 사후확률 기준 상위 HOT 5개 + 하위 COLD 5개 풀에서 최종 번호 선택. '
        '평균 귀환(Mean-Reversion) 가설과 모멘텀 효과를 동시에 반영.',
  ),
  'ROW_COL_DIST': MethodDescription(
    label: '행·열 분포',
    tagline: '로또 용지를 격자로 나눠서 자주 당첨되는 칸을 찾아드려요',
    description:
        '로또 번호표(1~45)를 7열짜리 격자로 펼치면 7×7 칸이 만들어져요. '
        '역대 당첨번호를 이 격자에 올려보면 "자주 터지는 행"과 "자주 터지는 열"이 눈에 보여요. '
        '이 방법은 잘 나오는 행과 잘 나오는 열이 겹치는 자리의 번호를 우선 추천합니다.',
    techNote:
        '7×7 격자 좌표: row = ⌈n/7⌉, col = ((n−1) mod 7)+1. '
        'P(n) = P(row) × P(col) 독립 분해 후 번호별 결합확률 산정. '
        '시각화 API: GET /api/lotto/grid-pattern',
  ),
  'GRID_ENTROPY': MethodDescription(
    label: '격자 엔트로피',
    tagline: '당첨번호가 격자에 골고루 퍼졌는지, 몰렸는지 패턴을 읽어요',
    description:
        '당첨번호 6개가 격자 전체에 고루 퍼진 "산개형" 회차도 있고, 한쪽에 몰린 "밀집형" 회차도 있어요. '
        '이 방법은 최근 흐름이 산개형인지 밀집형인지를 분석해서, 그 패턴에 맞는 번호들을 추천합니다. '
        '물리학의 엔트로피(무질서도) 개념을 로또에 접목한 방법이에요.',
    techNote:
        '회차별 행 분포 {r₁…r₇}에서 Shannon 엔트로피 H = −Σ pᵢ log₂pᵢ 계산 (최대 log₂7 ≈ 2.807 bit). '
        '최근 10회차 평균 H̄_recent vs 전체 평균 H̄_all 비교로 산개/밀집 트렌드 판별. '
        '번호별 엔트로피 친화도로 가중치 산정. 시각화 API: GET /api/lotto/grid-entropy-pattern',
  ),
};
