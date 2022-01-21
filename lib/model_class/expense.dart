import 'dart:convert';

import 'package:flutter/material.dart';

class ExpenseFields {
  static final List<String> values = [
    id,
    title,
    description,
    time,
    // walDescription
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
  // static const String walDescription = 'walDescription';
}

class Expense {
  Icon? itemIcon;
  String? itemName;
  bool? check;
  int? itemId;
  String? remark;
  Expense({this.itemIcon, this.itemName, this.check, this.itemId, this.remark});

  Expense copyWith({
    Icon? itemIcon,
    String? itemName,
    bool? check,
    int? itemId,
    String? remark,
  }) {
    return Expense(
        itemIcon: itemIcon ?? this.itemIcon,
        itemName: itemName ?? this.itemName,
        check: check ?? this.check,
        itemId: itemId ?? this.itemId,
        remark: remark ?? this.remark);
  }

  Map<String, dynamic> toMap() {
    return {
      'itemIcon': itemIcon,
      'itemName': itemName,
      'check': check,
      'itemId': itemId,
      'remark': remark,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
        itemName: map['itemName'],
        check: map['check'],
        itemId: map['itemId']?.toInt(),
        remark: map['remark']);
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Expense(itemIcon: $itemIcon, itemName: $itemName, check: $check, itemId: $itemId, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.itemIcon == itemIcon &&
        other.itemName == itemName &&
        other.check == check &&
        other.itemId == itemId &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return itemIcon.hashCode ^
        itemName.hashCode ^
        check.hashCode ^
        itemId.hashCode ^
        remark.hashCode;
  }
}
