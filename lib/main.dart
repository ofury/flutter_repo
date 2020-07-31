import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repo/index.dart';

void main() {
  final GithubRepository _githubRepository = GithubRepository(
    GithubClient(),
  );

  runApp(App(githubRepository: _githubRepository));
}

class App extends StatelessWidget {
  final GithubRepository githubRepository;

  const App({
    Key key,
    @required this.githubRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'Github Commits',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Last 20 Flutter Repo Commits'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => CommitsBloc(githubRepository: githubRepository),
          child: HomePage(),
        ),
      ),
    );
  }
}
