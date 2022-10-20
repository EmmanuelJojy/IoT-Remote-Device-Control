class SharedData {
  static String ip = '';
  static Status status = const Status(led1: 0);
}

class Status {
  final int led1;
  const Status({
    required this.led1,
  });
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      led1: int.parse(json['LED1']),
    );
  }
}
