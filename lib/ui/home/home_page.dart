import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repo/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CommitsBloc _commitsBloc;

  @override
  void initState() {
    super.initState();
    _commitsBloc = BlocProvider.of<CommitsBloc>(context);
    _commitsBloc.add(
      RepoChanged(
          owner: Configuration.defaultOwner, repo: Configuration.defaultRepo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommitsBloc, CommitsState>(
      builder: (context, commits) {
        if (commits is CommitsStateLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (commits is CommitsStateError) {
          return Center(child: Text(commits.error));
        }
        if (commits is CommitsStateSuccess) {
          return commits.items.isEmpty
              ? Text('No Results')
              : ListView.builder(
                  itemCount: commits.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final commit = commits.items[index].commit;
                    final author = commits.items[index].author;
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network(author.avatarUrl),
                      ),
                      title: Text(commit.author.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Date: ${commit.author.date}'),
                          ),
                          Text('Message: ${commit.message}'),
                        ],
                      ),
                    );
                  },
                );
        }
        return Text('Unable to load latest commits');
      },
    );
  }
}
