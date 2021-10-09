import 'package:bloc_news/models/news_model.dart';

abstract class NewsState {
  const NewsState();
}

class StateInit extends NewsState {
  const StateInit();
}

class StateLoading extends NewsState {
  const StateLoading();
}

class StateSuccess extends NewsState {
  final List<dynamic> response;
  const StateSuccess(this.response);
}

class StateError extends NewsState {
  final String massage;
  const StateError(this.massage);
}
