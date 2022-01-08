import 'package:assist_queen/components/wallet/itemWidget.dart';
import 'package:assist_queen/model_class/income.dart';
import 'package:flutter/material.dart';

class IncomeWidget extends StatefulWidget {
  const IncomeWidget({Key? key}) : super(key: key);

  @override
  _IncomeWidgetState createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  var incomeIconList = <Income>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incomeIconList.add(Income(
        itemName: "App Development",
        itemIcon: const Icon(Icons.shopping_bag),
        check: false,
        itemId: 1));
    incomeIconList.add(Income(
        itemName: "Rental",
        itemIcon: const Icon(Icons.car_rental),
        check: true,
        itemId: 2));
    incomeIconList.add(Income(
        itemName: "Grants",
        itemIcon: const Icon(Icons.gradient_sharp),
        check: false,
        itemId: 3));
    incomeIconList.add(Income(
        itemName: "Refunds",
        itemIcon: const Icon(Icons.money),
        check: false,
        itemId: 4));
    incomeIconList.add(Income(
        itemName: "Salary",
        itemIcon: const Icon(Icons.money_sharp),
        check: false,
        itemId: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: incomeIconList.length,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  onTap: () {
                    print("Clicked ${incomeIconList[index].check}");
                  },
                  child: ItemWidget(
                    itemName: incomeIconList[index].itemName,
                    itemId: incomeIconList[index].itemId,
                    check: incomeIconList[index].check,
                    itemIcon: incomeIconList[index].itemIcon,
                  ),
                ),
              );
            }));
  }
}
