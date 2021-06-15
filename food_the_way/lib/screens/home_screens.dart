import 'package:flutter/material.dart';
import 'package:food_the_way/data/data.dart';
import 'package:food_the_way/screens/cart_screen.dart';
import 'package:food_the_way/screens/nearby_restaurants.dart';
import 'package:food_the_way/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cartItemCount = currentUser.cart.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Food The Way"),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              child: Text(
                "Cart (${cartItemCount})",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.blue,
                  filled: false,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.7, color: Theme.of(context).primaryColor)),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                  hintText: "Search Food or Resturants",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.7))),
            ),
          ),
          RecentOrders(),
          Nearby_Restaurants(),
        ],
      ),
    );
  }
}
