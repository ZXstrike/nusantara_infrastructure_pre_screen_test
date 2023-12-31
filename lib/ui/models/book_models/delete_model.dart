class Deleted {
  String message;

  Deleted({
    required this.message,
  });

  factory Deleted.fromJson(Map<String, dynamic> json) => Deleted(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
