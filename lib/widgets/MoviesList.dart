import 'package:flutter/material.dart';
import '../providers/MoviesProvider.dart';
import 'MovieDetails.dart';
import 'package:provider/provider.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  ScrollController _controller;
  bool loading, firstRun;
  @override
  void initState() {
    super.initState();
    firstRun = true;
    _controller = ScrollController()
      ..addListener(() async {
        if (_controller.offset >= _controller.position.maxScrollExtent &&
            !_controller.position.outOfRange &&
            !loading) {
          setState(() {
            loading = true;
          });
          await Provider.of<MoviesProvider>(context, listen: false)
              .loadMovies();

          setState(() {
            loading = false;
          });
        }
      });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstRun) {
      setState(() {
        loading = true;
      });
      bool done = await Provider.of<MoviesProvider>(context, listen: false)
          .loadMovies();
      setState(() {
        loading = false;
        firstRun = false;
      });

      if (!done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Can\'t load movies right now.'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return ListView.builder(
      itemCount: moviesProvider.movies.length + (loading ? 1 : 0),
      controller: _controller,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        if (loading && index == moviesProvider.movies.length) {
          return Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.deepPurple[800]),
                )),
          );
        }
        return MovieDetails(movie: moviesProvider.movies[index]);
      },
    );
  }
}
