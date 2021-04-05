import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:intl/date_symbol_data_local.dart';

class MonthPickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MonthPickerPageState();
}

class _MonthPickerPageState extends State<MonthPickerPage> {
  DateTime _firstDate;
  DateTime _lastDate;
  DateTime _selectedDate;
  dp.DatePickerStyles _styles;
  Color selectedDateStyleColor;
  Color selectedSingleDateDecorationColor;

  @override
  void initState() {
    initializeDateFormatting();
    _firstDate = DateTime.now().subtract(Duration(days: 3500));
    _lastDate = DateTime.now().add(Duration(days: 1));
    _selectedDate = DateTime.now();
    _styles = dp.DatePickerStyles(
        selectedDateStyle: Theme.of(context)
            .accentTextTheme
            .bodyText1
            ?.copyWith(color: selectedDateStyleColor),
        selectedSingleDateDecoration: BoxDecoration(
            color: selectedSingleDateDecorationColor, shape: BoxShape.circle));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return bodyData();
    /* return Scaffold(
        appBar: AppBar(title: Text("Pick a Month")), body: bodyData());*/
  }

  Widget bodyData() {
    return Center(
      child: Expanded(
        child: dp.MonthPicker(
          selectedDate: _selectedDate,
          onChanged: _onSelectedDateChanged,
          firstDate: _firstDate,
          lastDate: _lastDate,
          datePickerStyles: _styles,
        ),
      ),
    );
  }

  void _onSelectedDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}
