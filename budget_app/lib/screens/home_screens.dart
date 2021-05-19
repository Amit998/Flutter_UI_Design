import 'package:budget_app/data/data.dart';
import 'package:budget_app/helpers/color_helper.dart';
import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/models/expense_model.dart';
import 'package:budget_app/screens/category_screen.dart';
import 'package:budget_app/widgets/bar_chart.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category, double totalAmout) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                      category: category,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.all(20),
        height: 100,
        width: double.infinity,
        // color: Colors.red,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, blurRadius: 0.2, offset: Offset(0, 2))
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$ ${(category.maxAmount - totalAmout).toStringAsFixed(2)} / \$ ${category.maxAmount}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percent =
                  (category.maxAmount - totalAmout) / category.maxAmount;

              double barWidth = percent * maxBarWidth;

              // print(constraints.maxHeight);
              // print(constraints.maxWidth);

              if (barWidth < 0) {
                barWidth = 0;
              }

              return Stack(
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    height: 20,
                    width: barWidth,
                    decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(15)),
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            expandedHeight: 100,
            floating: true,
            // pinned: true,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 30,
                )),
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Simple Budget",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                // height: 100.0,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Bar_Chart(
                  expense: weeklySpending,
                ),
              );
            } else {
              Category category = categories[index - 1];
              double totaleAmountSpent = 0;
              category.expenses.forEach((Expense expense) {
                totaleAmountSpent += expense.cost;
              });

              return _buildCategory(category, totaleAmountSpent);
            }
          }, childCount: 1 + categories.length))
        ],
      ),
    );
  }
}
