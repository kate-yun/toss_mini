import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendPage extends StatefulWidget {
  const SendPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return GestureDetector(
          onTap: () {},
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: TossColor.grey1,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TossColor.bluegrey,
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("송금하기"),
                    SizedBox(height: 16),
                    Text("어디로 보낼까요?"),
                    SizedBox(height: 8),
                    //DropdownButton(value: value, items: items, onChanged: (){}),
                    SizedBox(height: 32),
                    TextFormField(),
                    SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("현재 잔액: 원"),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("보내기"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
