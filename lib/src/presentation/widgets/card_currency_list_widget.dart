import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/const/cons.dart';
import 'package:news_currency_converter_bloc/src/data/models/currency_details.dart';

class CardCurrencyListWidget extends StatelessWidget {
  final CurrencyDetails currency;

  CardCurrencyListWidget({this.currency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
      child: Card(
        color: k_TextFieldBackGroundColor,
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                onTap: (){

                  Navigator.pop(context,currency);
                },
                title: Center(child: Text("${currency.namePlural}" ?? "")),
                subtitle: Center(child: Text("${currency.code}" ?? "")),
                leading: Image.network('https://flagcdn.com/120x90/${currency.isoCode2?.toLowerCase()}.webp'
                ?? ""),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//'https:${currencyKey.flag_url}'
