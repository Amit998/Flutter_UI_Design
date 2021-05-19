import 'package:flutter/material.dart';

class Bar_Chart extends StatelessWidget {
  final List<double> expense;

  Bar_Chart({@required this.expense});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expense.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(
            "Weekly Speending",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  iconSize: 30.0,
                  icon: Icon(
                    Icons.arrow_back,
                  )),
              Text(
                "Nov 10, 2019 - Nov 16, 2019",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 18),
              ),
              IconButton(
                  onPressed: () {},
                  iconSize: 30.0,
                  icon: Icon(
                    Icons.arrow_forward,
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: "Su",
                amountSpend: expense[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Mo",
                amountSpend: expense[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Tu",
                amountSpend: expense[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Wed",
                amountSpend: expense[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Th",
                amountSpend: expense[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Fri",
                amountSpend: expense[6],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Sa",
                amountSpend: expense[5],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpend, mostExpensive;

  const Bar({Key key, this.label, this.amountSpend, this.mostExpensive})
      : super(key: key);

  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpend / mostExpensive * _maxBarHeight;
    print(barHeight);
    print(amountSpend);
    print(mostExpensive);

    return Column(
      children: [
        Text(
          "\$${amountSpend.toStringAsFixed(2)}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        )
      ],
    );
  }
}
