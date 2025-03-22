import 'package:flutter/material.dart';
import 'package:my_first_app/themes/global_style.dart';

class FilterByTimeBtn extends StatefulWidget{
  final String label1;
  final String label2;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const FilterByTimeBtn({
    super.key,
    required this.label1,
    required this.label2,
    required this.onPressed1,
    required this.onPressed2,
  });
  @override
  _FilterByTimeBtnState createState() => _FilterByTimeBtnState();
}

class _FilterByTimeBtnState extends State<FilterByTimeBtn>{
  bool isFirstSelect = true;
  bool isSecondSelect = false;

  void toggleButton(){
    setState(() {
      isFirstSelect = !isFirstSelect;
      isSecondSelect = !isSecondSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: GlobalStyle.globalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: (){
              if(isSecondSelect) toggleButton();
              widget.onPressed1();
            },
            child: Text(
              widget.label1,
              style: TextStyle(
                fontSize: GlobalStyle.fontSizeSmall,
                fontWeight: isFirstSelect ? FontWeight.bold : FontWeight.normal,
                color: isFirstSelect ? GlobalStyle.textColorBlack : GlobalStyle.textColorBlackGray,
                fontFamily: 'Poppins'
              ),
            ),
          ),TextButton(
            onPressed: (){
              if(isFirstSelect) toggleButton();
              widget.onPressed2();
            },
            child: Text(
              widget.label2,
              style: TextStyle(
                fontSize: GlobalStyle.fontSizeSmall,
                fontWeight: isSecondSelect ? FontWeight.bold : FontWeight.normal,
                color: isSecondSelect ? GlobalStyle.textColorBlack : GlobalStyle.textColorBlackGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}