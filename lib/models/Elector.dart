class Elector {
  final String status;
  final String? message;
  final dynamic data;

  Elector({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Elector.fromJson(Map<String, dynamic> json) {
    return Elector(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}