import 'package:bloc_news/cubits/news_bloc.dart';
import 'package:bloc_news/news_state/news_state.dart';
import 'package:bloc_news/utils/service_constants.dart';
import 'package:bloc_news/widgets/state_body_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().getNewsCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildSafeArea(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  SafeArea buildSafeArea() {
    return SafeArea(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'News',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Divider(
            height: 40,
            color: Color(0xffFF8A30),
            thickness: 10,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
            child: Text(
              'Headline',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<NewsBloc, NewsState>(
              listener: (context, state) {
                if (state is StateError) {
                  print(state.massage);
                }
              },
              builder: (context, state) {
                if (state is StateInit) {
                  return InitStateBody();
                } else if (state is StateLoading) {
                  return LoadingBody();
                } else if (state is StateSuccess) {
                  return  NewsCard(newsModels: state.response);
                } else if (state is StateError) {
                  return ErrorBody(massage: state.massage);
                } else {
                  return NowBody();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (value) {
            final String? country = ServiceConstants.countries[value];
            context.read<NewsBloc>().getNewsBuCountryCubit(country.toString());
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) {
            return ServiceConstants.countries.keys
                .map((v) => PopupMenuItem(
                      value: v,
                      child: Text(v),
                    ))
                .toList();
          },
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<NewsBloc>().getNewsCubit();
      },
      child: Icon(Icons.refresh),
    );
  }

}
