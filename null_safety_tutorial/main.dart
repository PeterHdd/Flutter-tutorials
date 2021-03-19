
///nullable type using ?.
void main() {
  Students? student;
  print(student?.name);
}

class Students {
String name = "peter";
}

///using the postfix operator !
void main() {
  Students? student;
  print(student!.name);
}

class Students {
String name = "peter";
}

///required keyword
class Payment {
  final int accountNumber;
  final String accountName;

  Payment({required this.accountNumber,required this.accountName});
}

///late keyword
class Students {
 late String name;
}

///note this file is just to showcase the different keywords and operators used in the article