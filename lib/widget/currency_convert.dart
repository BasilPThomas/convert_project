import 'package:convert_project/functions/fetching_data.dart';
import 'package:flutter/material.dart';

import '../screen_two.dart';

class CurrencyConvert extends StatefulWidget {
  final rates;
  final Map currencies;
  const CurrencyConvert({Key? key, @required this.rates, required this.currencies})
      : super(key: key);

  @override
  _CurrencyConvertState createState() => _CurrencyConvertState();
}

class _CurrencyConvertState extends State<CurrencyConvert> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency will be shown here :)';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //TextFields for Entering USD
        TextFormField(
          key: const ValueKey('amount'),
          controller: amountController,
          decoration: const InputDecoration(hintText: 'Enter Amount'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: dropdownValue1,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.grey.shade400,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue1 = newValue!;
                  });
                },
                items: widget.currencies.keys
                    .toSet()
                    .toList()
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text('To')),
            Expanded(
              child: DropdownButton<String>(
                value: dropdownValue2,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.grey.shade400,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue2 = newValue!;
                  });
                },
                items: widget.currencies.keys
                    .toSet()
                    .toList()
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              answer = amountController.text +
                  ' ' +
                  dropdownValue1 +
                  ' ' +
                  convertany(widget.rates, amountController.text,
                      dropdownValue1, dropdownValue2) +
                  ' ' +
                  dropdownValue2;
            });
          },
          child: const Text('Convert'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor)),
        ),
        const SizedBox(width: 10,),
        Text(answer),
        ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenTwo()),
            );
          },
          child: const Text(
            "Next",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF06D6A0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 10)
          ),
        ),
      ],
    );
  }
}
