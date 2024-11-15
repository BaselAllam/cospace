import 'package:flutter/material.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> images = [
    'https://images.pexels.com/photos/29101851/pexels-photo-29101851/free-photo-of-scenic-autumn-road-through-a-forest.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/17798437/pexels-photo-17798437/free-photo-of-house-between-forest-and-lake.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/28865271/pexels-photo-28865271/free-photo-of-cozy-armchair-in-lush-indoor-greenhouse-setting.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/27019303/pexels-photo-27019303.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/29187003/pexels-photo-29187003/free-photo-of-couple-strolling-through-a-vibrant-autumn-forest.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.notifications, color: Colors.white,)
        ],
        title: Text('Location', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            sectonTitle('#Offers for you'),
            buildOffersSection(),
            sectonTitle('Category'),
            buildCategoriesSection(),
            sectonTitle('Popular Spaces'),
            buildPopularSection(),
          ],
        )
      ),
    );
  }

  sectonTitle(String title) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 20.0),),
      trailing: Text('See all', style: TextStyle(color: Colors.green),),
      onTap: () {},
    );
  }

  buildOffersSection() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < images.length; i++)
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(images[i]),
                fit: BoxFit.fill
              )
            ),
          ),
        ],
      ),
    );
  }

  buildCategoriesSection() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 5; i ++)
          Container(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Icon(Icons.people, color: Colors.green, size: 50.0),
                ),
                Text('Shared Space', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15.0)),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildPopularSection() {
    return Container(
      height: 320,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 5; i++)
          CospaceWidget()
        ],
      ),
    );
  }
}