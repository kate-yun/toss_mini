import 'package:chang_mini/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BankService extends ChangeNotifier {
  var f = NumberFormat('###,###,###,###'); // 숫자 입력 시 적용할 포멧.

  List<Bank> myBankList = []; // bank를 담아 둘 리스트.

  // 은행을 생성하기 위한 메서드
  createdBank(Bank bank) async {
    myBankList.add(bank); // bank를 받아 myBankList에 추가하는 함수.

    notifyListeners(); // 새로고침.
  }
}
