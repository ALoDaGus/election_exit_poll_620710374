class ElectorItem {
  final number;
  final displayName;

  ElectorItem({
    required this.number,
    required this.displayName,
  });

  factory ElectorItem.fromJson(Map<String, dynamic> json) {
    return ElectorItem(
      number: json['number'],
      displayName: json['displayName'],
    );
  }
}