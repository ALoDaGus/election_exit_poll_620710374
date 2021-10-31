class ElectorItemWithScore {
  final number;
  final displayName;
  final score;

  ElectorItemWithScore({
    required this.number,
    required this.displayName,
    required this.score
  });

  factory ElectorItemWithScore.fromJson(Map<String, dynamic> json) {
    return ElectorItemWithScore(
      number: json['number'],
      displayName: json['displayName'],
      score: json['score'],
    );
  }
}