import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  bool _animate = false;
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    double _maxWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeIn,
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.only(left: 8.0),
              height: 40.0,
              width: _animate ? _maxWidth * 0.75: _maxWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0)
                  ]
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Item ou loja",
                    hintStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.grey[500]),
                    contentPadding: EdgeInsets.only(bottom: 10.0),
                    border: InputBorder.none,
                  ),
                  controller: _controller,
                  onSubmitted: (text){
                    setState(() {
                      if(text != null){
                        _animate = !_animate;
                      }
                    });
                  },
                ),
              )
          )
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _animate = !_animate;
            });
          },
          child: AnimatedOpacity(
            opacity: _animate ? 1.0 : 0.0,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: _animate ? 1000 : 0),
            child: AnimatedContainer(
              padding: EdgeInsets.only(top: 5.0),
              duration: Duration(milliseconds: 300),
              width:
              _animate ? _maxWidth * .2 : 0,
              child: Container(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  color: Colors.transparent,
                  child: Text("Cancel", style: TextStyle(fontSize: 16.0),)
              ),
            ),
          ),
        )
      ],
    );
  }
}
