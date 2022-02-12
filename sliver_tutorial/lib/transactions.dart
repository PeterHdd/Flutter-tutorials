import 'package:json_annotation/json_annotation.dart';

part 'transactions.g.dart';


@JsonSerializable()
class Transactions {
  String name;
  String type;
  double amount;
  Transactions({required this.name,required this.type,required this.amount});

    factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}