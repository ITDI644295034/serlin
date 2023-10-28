import 'package:flutter/material.dart';
import 'package:flutter_application_3/config/approute.dart';
import 'package:flutter_application_3/model/toprate_mode.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:share_plus/share_plus.dart';

class DetailToprate extends StatefulWidget {
  const DetailToprate({super.key});

  @override
  State<DetailToprate> createState() => _DetailToprateState();
}

class _DetailToprateState extends State<DetailToprate> {
  Result? _movie;
  @override
  void initState() {
    _movie = Result();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? argumrnts = ModalRoute.of(context)!.settings.arguments;
    if (argumrnts is Result) {
      _movie = argumrnts;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_movie?.title ?? ''),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      (_movie?.posterPath ?? ''),
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.all(20),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RatingStars(
                    valueLabelVisibility: false,
                    maxValue: 10,
                    starSize: 10,
                    starCount: _movie?.voteAverage!.toInt() as int,
                    value: _movie?.voteAverage!.toDouble() as double,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(_movie?.overview ?? ''),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {
                  _share();
                },
                icon: Icon(Icons.share),
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.clipPopRoute,arguments: _movie?.id);
        },
        child: Text('VDO'),
      ),
    );
  }

  void _share() async {
    // await SocialShare.shareTwitter(_movieModel?.id.toString()??'');
    // await SocialShare.shareOptions(_movieModel?.overview ?? '');
    await Share.share(_movie?.title ?? '',
        subject: _movie?.overview.toString() ?? '');
  }
}
