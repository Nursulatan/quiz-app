class QuizModel {
  QuizModel(this.question, this.answer);
  final String question;
  final bool answer;
}

final q1 = QuizModel('Кыргызстандa 7 облус бар', true);
final q2 = QuizModel('Дүйнөдө 5 океан бар', false);
final q3 = QuizModel('Кыргызстандын борбору Бишкек', true);
final q4 = QuizModel('Акжол Махмудов футболист', false);
final q5 = QuizModel('Бир жылда 365 күн бар', true);
final q6 = QuizModel('Машинанын 3 дөңгөлөгү бар', false);
final q7 = QuizModel('Ысык-Көл кышында тоңбойт', true);
final q8 = QuizModel('Кыргызстан европада жайгашкан', false);
List<QuizModel> quizzes = [
  q1,
  q2,
  q3,
  q4,
  q5,
  q6,
  q7,
  q8,
];
