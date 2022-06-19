import 'package:bytebank/components/editor.dart';
import 'package:bytebank/constants.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();

  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE_TRANSFER_FORM_APP_BAR),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerFieldAccountNumber,
              label: LABEL_ACCOUNT_NUMBER,
              hint: HINT_ACCOUNT_NUMBER,
            ),
            Editor(
              controller: _controllerFieldValue,
              label: LABEL_VALUE,
              hint: HINT_VALUE,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(BUTTON_CONFIRM),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double value = double.tryParse(_controllerFieldValue.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }
}
