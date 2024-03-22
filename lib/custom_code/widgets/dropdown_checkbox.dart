// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class DropdownCheckbox extends StatefulWidget {
  const DropdownCheckbox({
    super.key,
    this.width,
    this.height,
    this.listSelectedInitialize,
    required this.options,
  });

  final double? width;
  final double? height;
  final List<String> options;
  final List<String>? listSelectedInitialize;

  @override
  State<DropdownCheckbox> createState() => _DropdownCheckboxState();
}

class _DropdownCheckboxState extends State<DropdownCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            MultiSelectDropdown.simpleList(
              list: widget.options,
              initiallySelected: widget.listSelectedInitialize ?? const [],
              onChange: (newList) {
                setState(() {
                  FFAppState().studentIds = newList.cast<String>();
                });
              },
              numberOfItemsLabelToShow: 2,
              includeSearch: true,
              includeSelectAll: true,
              isLarge: false,
              width: widget.width,
              checkboxFillColor: Color.fromRGBO(36, 150, 137, 1),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(36, 150, 137, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
