import 'package:assist_queen/components/expense_widget.dart';
import 'package:assist_queen/components/income_widget.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  var tabIndex = 0;
  var tabWidget = [const ExpenseWidget(), const IncomeWidget()];
  var fullHeight;
  @override
  Widget build(BuildContext context) {
    fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: fullHeight / 2,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        tabIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("EXPENSE"),
                          ),
                        ),
                        Container(
                          color: Colors.blueAccent,
                          width: tabIndex == 0 ? 80 : 0,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tabIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("INCOME"),
                          ),
                        ),
                        Container(
                          color: Colors.blueAccent,
                          width: tabIndex == 1 ? 80 : 0,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: const Icon(Icons.settings),
                  )
                ],
              ),
              Container(
                child: tabWidget[tabIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}
