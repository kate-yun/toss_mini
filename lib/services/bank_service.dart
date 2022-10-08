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

  // 송금을 위한 메서드
  Future<bool> sendMoney(Bank fromBank, Bank toBank, int money) async {
    if ((fromBank.balance ?? 0) < money) {
      // 송금 보낼 은행의 잔금이 money입력값보다 작을 경우
      return false;
    }

    fromBank.balance = (fromBank.balance ?? 0) - money;
    toBank.balance = (toBank.balance ?? 0) + money;

    notifyListeners();
    return true;
  }
}
