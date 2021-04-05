import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/const/cons.dart';

class ChangeCurrencyCardWidget extends StatefulWidget {
  final Function onTap;
  final Function onChangeTextField;
  final Text title;
  final String hintTextField;
  final Image image;
  final TextEditingController textEditingController;
  final String initialValue;

  ChangeCurrencyCardWidget(
      {@required this.onTap,
      @required this.title,
        this.initialValue,
        this.textEditingController,
      this.hintTextField,
      this.onChangeTextField,
      this.image});

  @override
  _ChangeCurrencyCardWidgetState createState() =>
      _ChangeCurrencyCardWidgetState();
}

class _ChangeCurrencyCardWidgetState extends State<ChangeCurrencyCardWidget> {

  @override
  void dispose() {
    super.dispose();
    widget.textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: k_SearchFieldBackGroundColor,
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              onTap: widget.onTap,
              title: widget.title,
              leading: widget.image,
            ),
          ),
          Expanded(
            child: Form(

              child: TextFormField(
               initialValue: widget.initialValue,
                onChanged: widget.onChangeTextField,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black, fontSize: 25),
                controller: widget.textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: 10),
                  border: InputBorder.none,
                  hintText: widget.hintTextField,
                  hintStyle: TextStyle(color: Color(0xff000000), fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
