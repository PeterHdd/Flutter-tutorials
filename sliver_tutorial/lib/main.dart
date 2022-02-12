import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_tutorial/app_bar_row.dart';
import 'package:sliver_tutorial/constants.dart';
import 'package:sliver_tutorial/flexible_bar.dart';
import 'package:sliver_tutorial/transaction_response.dart';
import 'package:sliver_tutorial/transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sliver Tutorial",
      home: SliverTutorial(),
    );
  }
}

class SliverTutorial extends StatefulWidget {
  const SliverTutorial({Key? key}) : super(key: key);

  @override
  State<SliverTutorial> createState() => _SliverTutorialState();
}

class _SliverTutorialState extends State<SliverTutorial> {
  Future<TransactionResponse>? response;

  @override
  void initState() {
    super.initState();
    response = fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: AppBarRow(),
            backgroundColor: Constants.appBarBackgroundColor,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: FlexibleBar(),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return FutureBuilder(
                future: response,
                builder: (BuildContext context,
                    AsyncSnapshot<TransactionResponse> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Transactions response =
                        snapshot.data!.transactionsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(
                          response.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text(response.type),
                        trailing: response.amount.isNegative
                            ? Text(
                                "${response.amount.toString()}\$",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            : Text(
                                "${response.amount.toString()}\$",
                                style: const TextStyle(color: Colors.green),
                              ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            }, childCount: 17),
          ),
        ],
      ),
    );
  }

  Future<TransactionResponse> fetchTransactions() async {
    String resultJson = await rootBundle.loadString(Constants.transactionsURL);
    Map<String, dynamic> result = jsonDecode(resultJson);
    TransactionResponse transactionResponse =
        TransactionResponse.fromJson(result);
    return transactionResponse;
  }
}
