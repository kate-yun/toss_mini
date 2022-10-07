import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/pages/send_page.dart';
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
            child: Text(
              bank.name ?? "땡땡은행 계좌",
              style: TextStyle(
                color: TossColor.bluegrey,
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          subtitle: Text(
            "${service.f.format(bank.balance)} 원",
            style: TextStyle(
              color: TossColor.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          contentPadding: EdgeInsets.zero, // ListTile의 외곽 padding값.
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendPage(fromBank: bank),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              onPrimary: TossColor.bluegrey,
              primary: TossColor.grey2,
            ),
            child: Text("송금"),
          ),
        );
      },
    );
  }
}
