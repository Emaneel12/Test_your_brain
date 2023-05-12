// class UserScore that has each user's score and stores it in the database

class UserScore {
  final int id;
  final String username;
  final int score;

  UserScore({required this.id, required this.username, required this.score});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'score': score,
    };
  }
}
