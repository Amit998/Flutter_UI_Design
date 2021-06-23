import 'package:flutter/material.dart';
import 'package:food_the_way/data/data.dart';
import 'package:food_the_way/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                            order.food.imageUrl,
                          ),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          order.restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          // height: 30,
                          width: 100.0,

                          decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 0.08,
                                  color: Theme.of(context).primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  order.quantity.toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "+",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "\$ ${order.quantity * order.food.price}",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.food.price;
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.0,
              color: Colors.grey,
            );
          },
          physics: BouncingScrollPhysics(),
          itemCount: currentUser.cart.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCartItem(order);
            }
            return Container(
              margin: EdgeInsets.only(bottom: 100),
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Delivery Time",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "25 min",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$ ${totalPrice.toStringAsFixed(2)} ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, -1), blurRadius: 6.0)
            ]),
        child: Center(
          child: Text(
            "Checkout".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
