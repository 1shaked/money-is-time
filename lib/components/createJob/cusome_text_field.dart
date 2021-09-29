import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';

class CusomeTextField extends StatelessWidget {
  const CusomeTextField({
    Key? key,
  }) : super(key: key);

  List<Widget> _buildField(BuildContext context) {
    const String text = 'text';
    const String number = 'int';
    const String select = 'select';
    const String boolean = 'bool';
    List<Map<String, dynamic>> fields = [
      {'name': 'name', 'placeholder': 'name', 'type': text},
      {
        'name': 'curreny',
        'placeholder': 'curreny',
        'type': select,
        'options': ['₪', '\$']
      },
      {'name': 'rate', 'placeholder': 'hourly rate', 'type': number},
      {'name': 'paidBreaks', 'placeholder': 'paid breaks', 'type': boolean},
      {
        'name': 'presentBreaks',
        'placeholder': 'present breaks',
        'type': boolean
      },
      {'name': 'location', 'placeholder': 'Jon location', 'type': text},
    ];
    return fields.map((Map<String, dynamic> item) {
      String type = item['type'];
      switch (type) {
        case text:
        case number:
          return CupertinoTextField(
            keyboardType:
                type == number ? TextInputType.number : TextInputType.text,
            onChanged: (v) => {
              Provider.of<JobService>(context, listen: false)
                  .setByName(item['name'], type == number ? int.parse(v) : v)
            },
            placeholder: 'name',
            placeholderStyle: Provider.of<ThemeNotifier>(context).inputStyle,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: 3,
                ),
              ),
            ),
          );
        case 'select':
          return DropdownButton(
            items: enumerate(item['options']).map((indexedValue) {
              final index = indexedValue.index;
              final item = indexedValue.value;
              return DropdownMenuItem<int>(
                child: Text('Log $item  index -- $index'),
                value: index,
              );
            }).toList(),
            value: 1,
            onChanged: (value) {
              print(value);
            },
            hint: Text("Select item"),
            disabledHint: Text("Disabled"),
            elevation: 8,
            style: TextStyle(color: Colors.green, fontSize: 16),
            icon: Icon(Icons.arrow_drop_down_circle),
          );
        case boolean:
          return CupertinoSwitch(
            value: Provider.of<JobService>(context).valueJson[item['name']],
            onChanged: (v) => {
              Provider.of<JobService>(context, listen: false)
                  .setByName(item['name'], v)
            },
          );
        default:
          return Text('ss');
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      color: Colors.white,
    );
    const TextStyle labelStyle = TextStyle(
      color: Colors.black,
      fontSize: 18,
    );
    BoxDecoration rowContainerDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: Theme.of(context).secondaryHeaderColor,
          width: 3,
        ),
      ),
    );
    const EdgeInsets insidePaddingLabel = EdgeInsets.fromLTRB(10, 0, 15, 0);
    const EdgeInsets containerMargin = EdgeInsets.only(top: 10);
    const List<String> currency = ['₪', '\$', '€'];
    return Container(
      padding: EdgeInsets.only(
        bottom: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          JobName(
              rowContainerDecoration: rowContainerDecoration,
              insidePaddingLabel: insidePaddingLabel,
              decoration: decoration,
              labelStyle: labelStyle),
          JobRate(
              containerMargin: containerMargin,
              rowContainerDecoration: rowContainerDecoration,
              insidePaddingLabel: insidePaddingLabel,
              labelStyle: labelStyle,
              decoration: decoration),
          JobCurrency(
              containerMargin: containerMargin,
              rowContainerDecoration: rowContainerDecoration,
              insidePaddingLabel: insidePaddingLabel,
              labelStyle: labelStyle,
              currency: currency),
          JobPaidBreaks(
              containerMargin: containerMargin,
              rowContainerDecoration: rowContainerDecoration,
              insidePaddingLabel: insidePaddingLabel,
              labelStyle: labelStyle),
          JobPresentBreaks(
              containerMargin: containerMargin,
              rowContainerDecoration: rowContainerDecoration,
              insidePaddingLabel: insidePaddingLabel,
              labelStyle: labelStyle),
          JobLocation(
              containerMargin: containerMargin,
              rowContainerDecoration: rowContainerDecoration,
              insidePaddingLabel: insidePaddingLabel,
              labelStyle: labelStyle,
              decoration: decoration),
        ],
      ),
    );
  }
}

class JobLocation extends StatelessWidget {
  const JobLocation({
    Key? key,
    required this.containerMargin,
    required this.rowContainerDecoration,
    required this.insidePaddingLabel,
    required this.labelStyle,
    required this.decoration,
  }) : super(key: key);

  final EdgeInsets containerMargin;
  final BoxDecoration rowContainerDecoration;
  final EdgeInsets insidePaddingLabel;
  final TextStyle labelStyle;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin,
      decoration: rowContainerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: insidePaddingLabel,
            child: Text(
              'Location',
              style: labelStyle,
            ),
          ),
          Expanded(
            child: CupertinoTextField(
              onChanged: (v) => {
                Provider.of<JobService>(context, listen: false)
                    .setByName('location', v)
              },
              placeholder: 'Tel Aviv office',
              placeholderStyle: Provider.of<ThemeNotifier>(context).inputStyle,
              decoration: decoration,
            ),
          ),
        ],
      ),
    );
  }
}

class JobCurrency extends StatelessWidget {
  const JobCurrency({
    Key? key,
    required this.containerMargin,
    required this.rowContainerDecoration,
    required this.insidePaddingLabel,
    required this.labelStyle,
    required this.currency,
  }) : super(key: key);

  final EdgeInsets containerMargin;
  final BoxDecoration rowContainerDecoration;
  final EdgeInsets insidePaddingLabel;
  final TextStyle labelStyle;
  final List<String> currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin,
      decoration: rowContainerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: insidePaddingLabel,
            child: Text(
              'Currency',
              style: labelStyle,
            ),
          ),
          DropdownButton(
            value: Provider.of<JobService>(context).currency,
            items: currency.map((String item) {
              return DropdownMenuItem<String>(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (String? value) {
              // String currencyValue = currency[index ?? 0];
              Provider.of<JobService>(context, listen: false)
                  .setByName('currency', value);
            },
            elevation: 8,
            style: TextStyle(
              color: Theme.of(context).toggleableActiveColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            icon: Icon(Icons.arrow_drop_down_circle),
          ),
        ],
      ),
    );
  }
}

class JobPresentBreaks extends StatelessWidget {
  const JobPresentBreaks({
    Key? key,
    required this.containerMargin,
    required this.rowContainerDecoration,
    required this.insidePaddingLabel,
    required this.labelStyle,
  }) : super(key: key);

  final EdgeInsets containerMargin;
  final BoxDecoration rowContainerDecoration;
  final EdgeInsets insidePaddingLabel;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin,
      decoration: rowContainerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: insidePaddingLabel,
            child: Text(
              'Present breaks',
              style: labelStyle,
            ),
          ),
          CupertinoSwitch(
              value: Provider.of<JobService>(context).presentBreaks,
              onChanged: (bool v) => {
                    Provider.of<JobService>(context, listen: false)
                        .presentBreaks = v
                  }),
        ],
      ),
    );
  }
}

class JobPaidBreaks extends StatelessWidget {
  const JobPaidBreaks({
    Key? key,
    required this.containerMargin,
    required this.rowContainerDecoration,
    required this.insidePaddingLabel,
    required this.labelStyle,
  }) : super(key: key);

  final EdgeInsets containerMargin;
  final BoxDecoration rowContainerDecoration;
  final EdgeInsets insidePaddingLabel;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin,
      decoration: rowContainerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: insidePaddingLabel,
            child: Text(
              'Paid breaks',
              style: labelStyle,
            ),
          ),
          CupertinoSwitch(
              value: Provider.of<JobService>(context).paidBreaks,
              onChanged: (bool v) => {
                    Provider.of<JobService>(context, listen: false).paidBreaks =
                        v
                  }),
        ],
      ),
    );
  }
}

class JobRate extends StatelessWidget {
  const JobRate({
    Key? key,
    required this.containerMargin,
    required this.rowContainerDecoration,
    required this.insidePaddingLabel,
    required this.labelStyle,
    required this.decoration,
  }) : super(key: key);

  final EdgeInsets containerMargin;
  final BoxDecoration rowContainerDecoration;
  final EdgeInsets insidePaddingLabel;
  final TextStyle labelStyle;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin,
      decoration: rowContainerDecoration,
      child: Row(children: [
        Container(
          padding: insidePaddingLabel,
          child: Text(
            'Rate',
            style: labelStyle,
          ),
        ),
        Expanded(
          child: CupertinoTextField(
            onChanged: (v) {
              try {
                int value = int.parse(v);
                Provider.of<JobService>(context, listen: false)
                    .setByName('rate', value);
              } catch (e) {
                print(e);
                String errorMessage = v.length == 0
                    ? 'no input was given'
                    : 'Plase use a valid number like 150';
                showCupertinoDialog<void>(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Input Error'),
                    content: Text(errorMessage),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }
            },
            placeholder: '100',
            keyboardType: TextInputType.number,
            placeholderStyle: Provider.of<ThemeNotifier>(context).inputStyle,
            decoration: decoration,
          ),
        ),
      ]),
    );
  }
}

class JobName extends StatelessWidget {
  const JobName({
    Key? key,
    required this.rowContainerDecoration,
    required this.insidePaddingLabel,
    required this.decoration,
    required this.labelStyle,
  }) : super(key: key);

  final BoxDecoration rowContainerDecoration;
  final EdgeInsets insidePaddingLabel;
  final BoxDecoration decoration;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: rowContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: insidePaddingLabel,
            decoration: decoration,
            child: Text(
              'Job Name',
              style: labelStyle,
            ),
          ),
          Expanded(
            child: CupertinoTextField(
              onChanged: (v) {
                print('line 499');
                Provider.of<JobService>(context, listen: false).name = v;
              },
              placeholder: 'name',
              placeholderStyle: Provider.of<ThemeNotifier>(context).inputStyle,
              decoration: decoration,
            ),
          ),
        ],
      ),
    );
  }
}
