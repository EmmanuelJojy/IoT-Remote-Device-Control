class SharedData {
  static String ip = '';
  static Status status = const Status(led1: 0, led2: 0);
}

class Status {
  final int led1;
  final int led2;
  const Status({
    required this.led1,
    required this.led2,
  });
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      led1: int.parse(json['LED1']),
      led2: int.parse(json['LED2']),
    );
  }
}
