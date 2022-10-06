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
  TextEditingController nameController = TextEditingController();
  // 텍스트필드에서 입력한 은행명 Text를 가져다 쓰기 위한 컨트롤러.
  TextEditingController balanceController = TextEditingController();
  // 텍스트필드에서 입력한 잔액 Text를 가져다 쓰기 위한 컨트롤러.

  FocusNode nameNode = FocusNode();
  FocusNode balanceNode = FocusNode();
  // 이벤트 시 특정 텍스트필드로 포커싱하기위해 텍스트필드 별로 고유의 FocusNode를 지정.

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(microseconds: 240));
      nameNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    balanceController.dispose();
    nameNode.dispose();
    balanceNode.dispose();

    super.dispose();
  }
  // TextEditingController 사용 시 반드시 dispose에서 리소스를 해재해야 한다.
  // 생명주기 메서드 - initState(), dispose()
  // initState() : 위젯이 생성될 때 호출
  // dispose() : 위젯이 완전히 종료될 때 호출(컨트롤러 객체가 제거될 때 변수에 할당된 메모리를 해제하기 위해)

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
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
                        builder: (context) =>
                            SendPage(), // SendPage 작업을 위한 임시이동
                      ),
                    );
                  },
                  child: Text("확인"),
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
                      "은행 추가하기",
                      style: TextStyle(
                        color: TossColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('은행명'),
                        SizedBox(width: 8),
                        Expanded(
                          child: CupertinoTextField.borderless(
                            textAlign: TextAlign.end,
                            controller: nameController,
                            focusNode: nameNode,
                            onSubmitted: (value) {},
                            suffix: Text("은행"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('잔액'),
                        SizedBox(width: 8),
                        Expanded(
                          child: CupertinoTextField.borderless(
                            textAlign: TextAlign.end,
                            controller: balanceController,
                            focusNode: balanceNode,
                            keyboardType: TextInputType.number, // 키보드타입 숫자 입력모드
                            suffix: Text("원"),
                            onChanged:
                                (value) {}, // onSubmitted, onChanged 차이??
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      //color: TossColor.white, BoxDecoration과 같이 사용 시 에러.
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: TossColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/toss_bank.png'),
                          Text(
                            "토스 은행",
                            style: TextStyle(
                              color: TossColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "비대면으로 통장을 개설할 수 있어요",
                            style: TextStyle(
                              color: TossColor.bluegrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              onPrimary: TossColor.white,
                              primary: TossColor.blue,
                            ),
                            child: Text("지금 바로 만들기"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 52),
                        onPrimary: TossColor.white,
                        primary: TossColor.blue,
                      ),
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
