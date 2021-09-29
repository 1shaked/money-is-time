import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneytime/services/services.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';

class CusomeTextField extends StatelessWidget {
  const CusomeTextField({
    Key? key,
  }) : super(key: key);

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
              onChanged: (String v) => {
                Provider.of<JobsManager>(context, listen: false)
                    .setKey('location', v)
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
            value: Provider.of<JobsManager>(context).currentCurrency,
            items: currency.map((String item) {
              return DropdownMenuItem<String>(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (String? v) {
              Provider.of<JobsManager>(context, listen: false)
                  .setKey('currency', v ?? '');
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
              value:
                  Provider.of<JobsManager>(context).theNewJob['presentBreaks'],
              onChanged: (bool v) => {
                    Provider.of<JobsManager>(context, listen: false)
                        .setKey('presentBreaks', v)
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
              value: Provider.of<JobsManager>(context).theNewJob['paidBreaks'],
              onChanged: (bool v) {
                Provider.of<JobsManager>(context, listen: false)
                    .setKey('paidBreaks', v);
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
                Provider.of<JobsManager>(context, listen: false)
                    .setKey('rate', value);
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
                Provider.of<JobsManager>(context, listen: false)
                    .setKey('name', v);
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
