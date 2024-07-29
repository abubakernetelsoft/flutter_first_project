

class QuizModel {

  String? number;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    number: json["number"],
    question: json["question"],
    option1: json["option1"],
    option2: json["option2"],
    option3: json["option3"],
    option4: json["option4"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "question": question,
    "option1": option1,
    "option2": option2,
    "option3": option3,
    "option4": option4,
  };

  QuizModel({required this.number,required this.question,required this.option1,required this.option2,required this.option3,required this.option4});
}
