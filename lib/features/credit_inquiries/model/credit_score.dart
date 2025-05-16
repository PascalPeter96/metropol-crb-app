class CreditScore {
  final int score;
  final String status;
  final List<Map<String, dynamic>> history;

  CreditScore({
    required this.score,
    required this.status,
    required this.history,
  });

  factory CreditScore.fromJson(Map<String, dynamic> json) {
    return CreditScore(
      score: json['score'] ?? 0,
      status: json['status'],
      history: List<Map<String, dynamic>>.from(json['history'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'status': status,
      'history': history,
    };
  }
}
