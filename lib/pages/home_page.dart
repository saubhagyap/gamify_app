import 'package:flutter/material.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController; // Declare PageController
  late int _selectedGame; // Track the selected game index

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.1);
    _selectedGame = 0; // Initialize controller
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredGameWidget(deviceHeight, deviceWidth),
          _gradientBoxWidget(deviceHeight, deviceWidth),
          _topLayerWidget(deviceHeight, deviceWidth),
        ],
      ),
    );
  }

  Widget _featuredGameWidget(double height, double width) {
    return SizedBox(
      height: height * 0.50,
      width: width,
      child: PageView.builder(
        controller: PageController(
            viewportFraction: 1.0), // Ensures full width without extra space
        onPageChanged: (_index) {
          setState(() {
            _selectedGame = _index;
          });
        },
        itemCount: featuredGames.length,
        clipBehavior: Clip
            .none, // Ensures images are not clipped (helps with unwanted margins)
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment
                .centerLeft, // Ensures first image is fully left-aligned
            child: Container(
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(featuredGames[index].coverImage.url),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _gradientBoxWidget(double height, double width) {
    return IgnorePointer(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: height * 0.80,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(35, 45, 59, 1.0),
                Colors.transparent,
              ],
              stops: [0.65, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget(double height, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.005),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(height, width),
          SizedBox(
            height: height * 0.13,
          ),
          _featuredGamesInfoWidget(height, width),
        ],
      ),
    );
  }

  Widget _topBarWidget(double height, double width) {
    return SizedBox(
      height: height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: width * 0.015,
              ),
              Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget(double height, double width) {
    return SizedBox(
      height: height * 0.12,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: height * 0.040,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((_game) {
              bool _isActive =
                  _game.title == featuredGames[_selectedGame].title;
              double _circleRadius = height * 0.004;
              return Container(
                margin: EdgeInsets.only(right: width * 0.015),
                height: _circleRadius * 2,
                width: _circleRadius * 2,
                decoration: BoxDecoration(
                    color: _isActive ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(100)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
