import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class MyAutocompleteTextField extends StatefulWidget {
  List<String> suggestions = [];
  var placeholder = "Type...";
  MyAutocompleteTextField({Key? key, required this.suggestions ,required this.placeholder}) : super(key: key);
  @override
  _MyAutocompleteTextFieldState createState() => _MyAutocompleteTextFieldState();
}

class _MyAutocompleteTextFieldState extends State<MyAutocompleteTextField> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> suggestions = [];
  
  String placeholder = 'Type...';

  @override
    void initState() {
    super.initState();
    suggestions = widget.suggestions;
    placeholder = widget.placeholder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoCompleteTextField<String>(
        key: key,
        clearOnSubmit: false,
        suggestions: suggestions,
        decoration: InputDecoration(
          hintText: placeholder,
          border: OutlineInputBorder(),
        ),
        itemFilter: (item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase());
        },
        itemSorter: (a, b) {
          return a.compareTo(b);
        },
        itemSubmitted: (item) {
          setState(() {
            key.currentState?.textField?.controller?.text = item;

          });
        },
        itemBuilder: (context, item) {
          return ListTile(
            title: Text(item),
          );
        },
      ),
    );
  }
}
