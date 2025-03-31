import 'package:flutter/material.dart';

import '../data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double _height;
  final double _width;
  final bool showTitle;

  final List<Game> _gamesData;

  ScrollableGamesWidget(
      this._height, this._width, this.showTitle, this._gamesData);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height * 1.05,
      width: _width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _gamesData.map((_game) {
          return Container(
            height: _height,
            width: _width * 0.30,
            padding: EdgeInsets.only(right: _width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _height * 0.80,
                  width: _width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_game.coverImage.url),
                      )),
                ),
                Text(
                  _game.title,
                  style: TextStyle(
                    fontSize: _height * 0.06,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
