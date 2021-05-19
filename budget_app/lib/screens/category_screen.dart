import 'package:budget_app/helpers/color_helper.dart';
import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/models/expense_model.dart';
import 'package:budget_app/widgets/radial_paint.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({@required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpense() {
    List<Widget> expenselist = [];
    widget.category.expenses.forEach((Expense expense) {
      expenselist.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                expense.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '-\$ ${expense.cost.toStringAsFixed(2)} ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ));
    });

    return Column(
      children: expenselist,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmount += expense.cost;
    });

    final double amountLeft = widget.category.maxAmount - totalAmount;

    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category.name,
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.2)
                    ]),
                child: CustomPaint(
                  foregroundPainter: RadialPainter(
                      bgColor: Colors.grey[200],
                      lineColor: getColor(context, percent),
                      width: 15.0,
                      percent: percent),
                  child: Center(
                    child: Text(
                      "\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount} ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
            _buildExpense()
          ],
        ),
      ),
    );
  }
}
