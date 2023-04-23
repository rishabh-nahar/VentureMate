import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';

class DropdownGlobal extends StatefulWidget {
  DropdownGlobal({Key? key, required this.selectedValue, required this.options}) : super(key: key);
  String selectedValue = '';
  List<String> options = [];
  
  @override
  State<DropdownGlobal> createState() => _DropdownGlobalState();
}

class _DropdownGlobalState extends State<DropdownGlobal> {
  static String selectedValue = '';
  
  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          value: selectedValue,
          underline: const SizedBox(),
          isExpanded: true,
          items: widget.options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
      );
  }
}