import 'package:design_app19/circular_clipper.dart';
import 'package:design_app19/content_scroll.dart';
import 'package:design_app19/move_model.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({Key key, this.movie}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                    tag: widget.movie.imageUrl,
                    child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(blurRadius: 20),
                      child: Image(
                          height: 400.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(widget.movie.imageUrl)),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30),
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.black,
                    iconSize: 30,
                  ),
                  Image(
                    image: AssetImage('assets/images/netflix_logo.png'),
                    height: 60,
                    width: 150,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(right: 30),
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 30,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    elevation: 12.0,
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  color: Colors.black,
                  iconSize: 40,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  color: Colors.black,
                  iconSize: 35,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Country',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie.country.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          '${widget.movie.length} min',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 120,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Screenshots',
            imageHeight: 200,
            imageWidth: 250,
          )
        ],
      ),
    );
  }
}
