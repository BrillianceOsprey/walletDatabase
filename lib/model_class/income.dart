import 'dart:convert';

import 'package:flutter/material.dart';

class Income {
  Icon? itemIcon;
  String? itemName;
  bool? check;
  int? itemId;
  String? remark;
  Income({this.itemIcon, this.itemName, this.check, this.itemId, this.remark});

  Income copyWith({
    Icon? itemIcon,
    String? itemName,
    bool? check,
    int? itemId,
    String? remark,
  }) {
    return Income(
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

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
        itemName: map['itemName'],
        check: map['check'],
        itemId: map['itemId']?.toInt(),
        remark: map['remark']);
  }

  String toJson() => json.encode(toMap());

  factory Income.fromJson(String source) => Income.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Income(itemIcon: $itemIcon, itemName: $itemName, check: $check, itemId: $itemId, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Income &&
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
