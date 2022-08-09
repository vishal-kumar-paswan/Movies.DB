import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants.dart';
import '../services/api_manager.dart';
import '../models/movie_list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.token, required this.firstName})
      : super(key: key);

  final String token;
  final String firstName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MovieListModel> movieListData;
  @override
  void initState() {
    // Calling movie list API when when the screen is initailised
    movieListData = APIManager.fetchMovieList(widget.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Movies.DB',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Welcome ${widget.firstName}.',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        decoration: Constants.backgroundColor,
        child: FutureBuilder<MovieListModel>(
          future: movieListData,
          builder: (context, snapshot) {
            // Displays data in Grid view if available
            if (snapshot.hasData) {
              return AlignedGridView.count(
                itemCount: snapshot.data!.data.length,
                crossAxisCount: 2,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 54, 54, 54),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              snapshot.data!.data[index].image,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                    'assets/image_not_available.png');
                              },
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              snapshot.data!.data[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Year: ${snapshot.data!.data[index].year}',
                              style: Constants.cardTextStyle(context),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'imDB Rating : ${snapshot.data!.data[index].ratings.imDb}',
                              style: Constants.cardTextStyle(context),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Director: ${snapshot.data!.data[index].directors}',
                              style: Constants.cardTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            }

            // Displays error message
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Failed to load data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              );
            }

            // Displays circular progress indicator while loading data
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
