import 'package:design_app19/content_scroll.dart';
import 'package:design_app19/move_model.dart';
import 'package:design_app19/movies_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.05).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MovieScreen(
                      movie: movies[index],
                    ))),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10)
                    ]),
                child: Center(
                  child: Hero(
                      tag: movies[index].imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(movies[index].imageUrl),
                          height: 220.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
            ),
            Positioned(
                left: 30,
                bottom: 30,
                child: Container(
                  width: 250,
                  child: Text(
                    movies[index].title.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage('assets/images/netflix_logo.png'),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(left: 30),
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.horizontal,
                itemCount: labels.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFD45253), Color(0xFF9E1E28)]),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF9E1F28),
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        labels[index].toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.8),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          ContentScroll(
            images: myList,
            title: 'My list',
            imageHeight: 250,
            imageWidth: 150,
          ),
          SizedBox(
            height: 10,
          ),
          ContentScroll(
            images: popular,
            title: 'Popular',
            imageHeight: 250,
            imageWidth: 150,
          ),
        ],
      ),
    );
  }
}
