// An Interceptor Class to add credentials to the request
class Credentials {
  final List<String> credentials;

  Credentials(this.credentials);

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      List<String>.from(json['credentials']),
    );
  }
}
