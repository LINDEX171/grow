import 'package:flutter/material.dart';
import 'package:grow/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight ;
  var _deviceWidth;


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(


      body: Stack(
        children: <Widget>[
          _widgetPicture(),
          _gradientWidget(),
          _containWidget(),
        ] ,
      ),
    );
  }

  Widget _widgetPicture(){
    return Container(
      height: _deviceHeight * 0.50,
      width: _deviceHeight,
      child: PageView(
        children: featuredGames.map((e){
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(e.coverImage.url))
            ),
          );
        }).toList(),
      ),

    );
  }


  Widget _gradientWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight*0.80,
        width: _deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(26, 45, 83, 1.0),
              Colors.transparent,
            ],
            stops: [
              0.70,
              1,
            ] ,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _containWidget(){
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: _deviceWidth * 0.05, horizontal: _deviceHeight * 0.025),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBar(),
        ],
      ),
    );
  }

  Widget _topBar(){
    return SizedBox(
      width: _deviceWidth,
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.menu,color: Colors.white, size: 30),
          SizedBox(height: _deviceHeight * 0.1),
          Row(
            children: [
              Icon(Icons.notifications_none,color: Colors.white, size: 30),
              SizedBox(
                width: _deviceWidth * 0.02,
              ),
              Icon(Icons.search,color: Colors.white, size: 30),
            ],
          ),
        ],
      ),
    );
  }
}
