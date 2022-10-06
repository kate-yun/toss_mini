import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/pages/send_page.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return GestureDetector(
          onTap: () {},
          child: Scaffold(
            backgroundColor: TossColor.white,
            appBar: AppBar(
              backgroundColor: TossColor.grey1,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context); // 작업을 위한 임시 뒤로가기
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TossColor.bluegrey,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendPage(),
                      ),
                    );
                  },
                  child: Text('확인'),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '은행 추가하기',
                      style: TextStyle(
                        color: TossColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('은행명'),
                        Expanded(child: CupertinoTextField.borderless()),
                        Text('은행'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('잔액'),
                        Expanded(child: CupertinoTextField.borderless()),
                        Text('원'),
                      ],
                    ),
                    Spacer(),
                    Container(
                      color: TossColor.white,
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/toss_bank.png'),
                          Text("토스 은행"),
                          Text("비대면으로 통장을 개설할 수 있어요"),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("지금 바로 만들기"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('확인'),
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
