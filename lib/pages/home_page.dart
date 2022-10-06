import 'package:chang_mini/components/bank_container.dart';
import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/pages/add_page.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      // provider로 BankService를 받기 위해 최상단에 Consumer로 감싼다.
      builder: (context, service, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
            backgroundColor: TossColor.grey1,
            elevation: 0,
            title: Image.asset(
              'assets/toss_logo.png',
              height: 50,
            ),
            centerTitle: false, // title 가운데 정렬 해제
            actions: [
              Image.asset(
                'assets/toss_appbar_icon_1.png',
                height: 48,
                width: 48,
              ),
              SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/toss_appbar_icon_2.png',
                height: 36,
                width: 36,
              ),
              SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/toss_appbar_icon_3.png',
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: TossColor.grey1,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '자산',
                            style: TextStyle(
                              color: TossColor.bluegrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddPage(), // AddPage 작업을 위한 임시 페이지 이동.
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                      ...service.myBankList.map(
                        (e) => BankContainer(bank: e),
                        //myBankList의 bank element만큼 불러와 BankContainer(ListTile)로 적용.
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
