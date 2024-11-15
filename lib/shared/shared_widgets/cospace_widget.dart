import 'package:flutter/material.dart';


class CospaceWidget extends StatefulWidget {
  const CospaceWidget({super.key});

  @override
  State<CospaceWidget> createState() => _CospaceWidgetState();
}

class _CospaceWidgetState extends State<CospaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
                fit: BoxFit.fill
              ),
            ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Text(
                    '⭐ 4.9',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Icon(Icons.favorite_border, color: Colors.red, size: 20.0)
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Shared Space', style: TextStyle(color: Colors.green, fontSize: 15.0)),
            subtitle: Text('Workhub Connect', style: TextStyle(color: Colors.black, fontSize: 20.0)),
            trailing: Text('80EGP/H', style: TextStyle(color: Colors.green, fontSize: 15.0)),
          ),
          Divider(endIndent: 10.0, indent: 10.0, thickness: 0.5, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.directions_walk_rounded, color: Colors.green),
                  Text(' 5 ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  Text('MIN', style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  Text(' 2.3 ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  Text('KM', style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.watch_later, color: Colors.green),
                  Text(' open', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}