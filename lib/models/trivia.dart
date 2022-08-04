class Trivia {
  final String correctAnswer;
  final String category;
  final String difficulty;
  final String question;

  Trivia(
      {required this.question,
      required this.difficulty,
      required this.category,
      required this.correctAnswer});

  factory Trivia.fromJson(Map<String, dynamic> json) {
    return Trivia(
      category: json["category"].toString(),
      question: json["question"].toString(),
      difficulty: json["difficulty"].toString(),
      correctAnswer: json["correct_answer"].toString(),
    );
  }
}
