class SignUpDTO {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String deviceName;

  SignUpDTO({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.deviceName,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'device_name': deviceName,
    };
  }
}