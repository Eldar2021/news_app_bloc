import 'package:bloc_news/cubits/news_bloc.dart';
import 'package:bloc_news/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xffFFFFFF),
        ),
        home: HomeScreen()
      ),
    );
  }
}
