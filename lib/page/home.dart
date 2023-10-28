import 'package:flutter/material.dart';
import 'package:flutter_application_3/config/approute.dart';
import 'package:flutter_application_3/config/service_network.dart';
import 'package:flutter_application_3/model/popular_model.dart';
import 'package:flutter_application_3/model/toprate_mode.dart';
import 'package:flutter_application_3/model/upcoming_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PoppularModel>? _popModel;
  Future<UpcomingModel>? _upModel;
  Future<ToprateModel>? _topModel;
  @override
  void initState() {
    _popModel = ServiceNetwork().getPopDio();
    _upModel = ServiceNetwork().getUpDio();
    _topModel = ServiceNetwork().getTopDio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: CommonDrawer(),
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Container(
              height: 45,
              child: TabBar(tabs: [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'TopRate',
                ),
                Tab(
                  text: 'Upcoming',
                ),
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                FutureBuilder(
                  future: _popModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data?.results?.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data!.results?[index];
                          return Container(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.detailRoute,
                                    arguments: movie);
                              },
                              title: Text(movie?.title ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              leading: Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    (movie?.posterPath ?? ''),
                                fit: BoxFit.fill,
                                height: double.maxFinite,
                              ),
                              subtitle: Text(
                                movie?.overview ?? '',
                                maxLines: 3,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                FutureBuilder(
                  future: _topModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data?.results?.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data!.results?[index];
                          return Container(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.detailTopRoute,
                                    arguments: movie);
                              },
                              title: Text(movie?.title ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              leading: Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    (movie?.posterPath ?? ''),
                                fit: BoxFit.fill,
                                height: double.maxFinite,
                              ),
                              subtitle: Text(
                                movie?.overview ?? '',
                                maxLines: 3,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                FutureBuilder(
                  future: _upModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data?.results?.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data!.results?[index];
                          return Container(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.detailUpRoute,
                                    arguments: movie);
                              },
                              title: Text(movie?.title ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              leading: Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    (movie?.posterPath ?? ''),
                                fit: BoxFit.fill,
                                height: double.maxFinite,
                              ),
                              subtitle: Text(
                                movie?.overview ?? '',
                                maxLines: 3,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text('Muftaree'),
              accountEmail: Text('')),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.deepOrange,
            ),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.movie,
              color: Colors.deepOrange,
            ),
            title: Text('Poppular movie'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.movie,
              color: Colors.deepOrange,
            ),
            title: Text('Upcoming movie'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.movie,
              color: Colors.deepOrange,
            ),
            title: Text('Top Rate movie'),
            onTap: () {},
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.deepOrange,
            ),
            title: Text('Logout'),
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
