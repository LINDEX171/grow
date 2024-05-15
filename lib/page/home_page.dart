import 'package:flutter/material.dart';
import 'package:grow/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Stack(
        children :  <Widget>[
          _widgetPhoto(),
          _widgetGradient(),
        ],

      ),
    );
  }

  Widget _widgetPhoto(){
    return Container(
      height: _deviceHeight*0.50,
      width: _deviceWidth,
      child: PageView(
        children:featuredGames.map((e){
            return
              Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(e.coverImage.url),),
                ),
              );
          }).toList(),


      ),
    );
  }

  Widget _widgetGradient(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80,
        decoration: BoxDecoration(

          gradient: LinearGradient(
            colors: [Color.fromRGBO(24, 43, 23, 1), Colors.transparent],
            stops: [0.70,1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),

        ),
      ),
    );
  }


}
