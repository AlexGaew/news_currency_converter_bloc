import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/const/cons.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;

  SearchField({@required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: k_SearchFieldBackGroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Colors.black54,
                size: 25,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ),
        ),
      ]),
    );
  }
}
