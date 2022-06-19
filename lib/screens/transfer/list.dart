import 'package:bytebank/constants.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  _TransfersListState createState() => _TransfersListState();
}

class _TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE_TRANSFER_LIST_APP_BAR),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, int index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then(
            (transfer) => _update(transfer),
          );
        },
      ),
    );
  }

  void _update(Transfer transfer) {
    if (transfer != null) {
      setState(() {
        widget._transfers.add(transfer);
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
