
import 'package:json_annotation/json_annotation.dart';
import 'package:sliver_tutorial/transactions.dart';


part 'transaction_response.g.dart';


@JsonSerializable()
class TransactionResponse {
  String balance;
  @JsonKey(name: 'transactions')
  List<Transactions> transactionsList;
  TransactionResponse({required this.balance,required this.transactionsList});

      factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}