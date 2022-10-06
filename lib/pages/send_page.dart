import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/model/bank.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendPage extends StatefulWidget {
  const SendPage({
    Key? key,
    //required this.fromBank, // ?? 로직 확인 필요.
  }) : super(key: key);
  //final Bank fromBank; //송금을 보낼 은행.

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  Bank? toBank; // 받는 은행 (DropDownButton에 사용)

  TextEditingController moneyController = TextEditingController();
  // 텍스트필드의 Text(송금할 금액)을 받아오기 위한 컨트롤러
  FocusNode moneyNode = FocusNode();
  // 송금할 금액의 텍스트필드 FocusNode.

  // @override
  // void initState() {
  //   toBank = Provider.of<BankService>(context, listen: false).myBankList.first;
  //   // ??????
  //   super.initState();
  // }

  @override
  void dispose() {
    moneyController.dispose();
    moneyNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      // provider로 BankService를 받기 위해 최상단에 Consumer로 감싼다.
      builder: (context, service, child) {
        return GestureDetector(
          onTap: () {},
          child: Scaffold(
            backgroundColor: TossColor.grey1,
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
                    Text(
                      "송금하기",
                      style: TextStyle(
                        color: TossColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "어디로 보낼까요?",
                      style: TextStyle(
                        color: TossColor.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 8),

                    // DropdownButton<Bank>(
                    //   value: toBank,
                    //   items: service.myBankList
                    //       .map((e) => DropdownMenuItem(
                    //             value: e,
                    //             child: Text(e.name ?? ''),
                    //           ))
                    //       .toList(),
                    //   onChanged: (value) {},
                    // ),

                    // myBankList의 Bank element만큼 name을 가져와서 드롭메뉴에 적용하고 null이면 빈칸.
                    // ?? value, items, e.name, onChanged
                    SizedBox(height: 32),
                    TextFormField(
                      textAlign: TextAlign.end,
                      controller: moneyController,
                      focusNode: moneyNode,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {}, // onChanged (value) ??
                      decoration: InputDecoration(
                        suffix: Text("원"), // suffix ??
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("현재 잔액: 원"),
                      //"현재 잔액: ${service.f.format(widget.fromBank.balance)} 원"),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 52),
                        onPrimary: TossColor.white,
                        primary: TossColor.blue,
                      ),
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
