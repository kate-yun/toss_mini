import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chang_mini/model/bank.dart';

class BankContainer extends StatelessWidget {
  const BankContainer({
    Key? key,
    required this.bank, // 부모로 부터 bank를 받아오기 위함.
  }) : super(key: key);
  final Bank bank; // bank를 받기 위해 변수 생성.

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      // provider로 BankService를 받기 위해 최상단에 Consumer로 감싼다.
      builder: (context, service, child) {
        return ListTile(
          leading: Image.asset(
            bank.bankImage ?? '',
            width: 40,
          ), //bank.bankImage가 null이면 ''.
          title: Container(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Text(bank.name ?? "땡땡은행 계좌"),
          ),
          subtitle: Text("잔여금액"),
          contentPadding: EdgeInsets.zero, // ListTile의 외곽 padding값.
          trailing: ElevatedButton(
            onPressed: () {},
            child: Text("송금"),
          ),
        );
      },
    );
  }
}
