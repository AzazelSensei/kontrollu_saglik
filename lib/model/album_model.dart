class Album {
  final String username;
  final String password;

  const Album({this.username, this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      username: json['username'],
      password: json['password'],
    );
  }
}
