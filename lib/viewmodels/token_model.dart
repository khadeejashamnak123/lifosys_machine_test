
class Token {
  final int id;
  final String time;
  final bool booked;

  Token({required this.id, required this.time, required this.booked});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(id: json['id'], time: json['time'], booked: json['booked']);
  }
}