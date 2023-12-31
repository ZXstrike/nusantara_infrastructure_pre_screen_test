class LoggedOut {
  String message;

  LoggedOut({
    required this.message,
  });

  factory LoggedOut.fromJson(Map<String, dynamic> json) => LoggedOut(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
