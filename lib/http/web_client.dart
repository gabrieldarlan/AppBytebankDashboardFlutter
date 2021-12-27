import 'dart:convert';

import 'package:bytebank_dashboard/models/contact.dart';
import 'package:bytebank_dashboard/models/transaction.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.baseUrl}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  var client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );
  // var response = await client.get('http://172.31.32.1:8080/transaction');
  var response = await client
      .get('http://172.31.32.1:8080/transactions')
      .timeout(Duration(seconds: 5));
  var decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = List();
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    var transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }

  return transactions;
}
