import 'dart:convert';

import 'package:chang_mini/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BankService extends ChangeNotifier {
  var f = NumberFormat('###,###,###,###'); // 숫자 입력 시 적용할 포멧.

  SharedPreferences? prefs;
  List<Bank> myBankList = []; // bank를 담아 둘 리스트.

  BankService(SharedPreferences preferences) {
    prefs = preferences;

    getPrefsData();
  }

  // 은행을 생성하기 위한 메서드
  createdBank(Bank bank) async {
    myBankList.add(bank); // bank를 받아 myBankList에 추가하는 함수.
    await saveData();

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
    await saveData();

    notifyListeners();
    return true;
  }

  getPrefsData() {
    String? savedString = prefs?.getString('banks');
    if (savedString != null) {
      myBankList = [];
      jsonDecode(// import 'dart:convert' 필요
          savedString).forEach((e) {
        myBankList.add(Bank.fromJson(e));
      });
    }
  }

  // DATA를 banks라는 이름의 Json포멧으로 저장하기
  saveData() async {
    await prefs?.setString(
      'banks',
      jsonEncode(
        // import 'dart:convert' 필요
        myBankList.map((e) => e.toJson()).toList(),
      ),
    );
  }
}
