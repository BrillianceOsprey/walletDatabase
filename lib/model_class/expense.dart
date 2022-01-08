import 'dart:convert';

import 'package:flutter/material.dart';

class Expense {
  Icon? itemIcon;
  String? itemName;
  bool? check;
  int? itemId;
  Expense({
    this.itemIcon,
    this.itemName,
    this.check,
    this.itemId,
  });

  Expense copyWith({
    Icon? itemIcon,
    String? itemName,
    bool? check,
    int? itemId,
  }) {
    return Expense(
      itemIcon: itemIcon ?? this.itemIcon,
      itemName: itemName ?? this.itemName,
      check: check ?? this.check,
      itemId: itemId ?? this.itemId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemIcon': itemIcon,
      'itemName': itemName,
      'check': check,
      'itemId': itemId,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      itemName: map['itemName'],
      check: map['check'],
      itemId: map['itemId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Expense(itemIcon: $itemIcon, itemName: $itemName, check: $check, itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.itemIcon == itemIcon &&
        other.itemName == itemName &&
        other.check == check &&
        other.itemId == itemId;
  }

  @override
  int get hashCode {
    return itemIcon.hashCode ^
        itemName.hashCode ^
        check.hashCode ^
        itemId.hashCode;
  }
}
