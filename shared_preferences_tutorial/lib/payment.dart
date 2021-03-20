class Payment {
  final int accountNumber;
  final String accountName;

  Payment({required this.accountNumber,required this.accountName});

    factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      accountName: json['accountName'],
      accountNumber: json['accountNumber'],
    );
  }

   Map<String, dynamic> toJson() =>
    {
      'accountName': accountName,
      'accountNumber': accountNumber,
    };
}