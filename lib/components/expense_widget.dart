import 'package:assist_queen/components/wallet/itemWidget.dart';
import 'package:assist_queen/model_class/expense.dart';
import 'package:flutter/material.dart';

class ExpenseWidget extends StatefulWidget {
  const ExpenseWidget({Key? key}) : super(key: key);

  @override
  _ExpenseWidgetState createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends State<ExpenseWidget> {
  var expenseIconList = <Expense>[];

  @override
  void initState() {
    super.initState();
    expenseIconList.add(Expense(
        itemName: "Food",
        itemIcon: const Icon(Icons.food_bank),
        check: true,
        itemId: 1));
    expenseIconList.add(Expense(
        itemName: "Clothing",
        itemIcon: const Icon(Icons.manage_accounts),
        check: false,
        itemId: 2));
    expenseIconList.add(Expense(
        itemName: "Fruit",
        itemIcon: const Icon(Icons.balcony),
        check: false,
        itemId: 3));
    expenseIconList.add(Expense(
        itemName: "Shopping",
        itemIcon: const Icon(Icons.shopping_bag),
        check: false,
        itemId: 4));
    expenseIconList.add(Expense(
        itemName: "Transportation",
        itemIcon: const Icon(Icons.shopping_bag),
        check: false,
        itemId: 5));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expenseIconList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("Clicked ${expenseIconList[index].check}");
            },
            child: ItemWidget(
              itemName: expenseIconList[index].itemName,
              itemId: expenseIconList[index].itemId,
              check: expenseIconList[index].check,
              itemIcon: expenseIconList[index].itemIcon,
            ),
          );
        });
  }
}
