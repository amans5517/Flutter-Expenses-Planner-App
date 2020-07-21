import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _usertransactions;
  final Function _deleteTx;

  TransactionList(this._usertransactions, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return _usertransactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/nodatafound.png')),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Please Enter Data!',
                    style: Theme.of(context).textTheme.title,
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: _usertransactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    //backgroundColor: Theme.of(context).accentColor,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text('₹${_usertransactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    _usertransactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_usertransactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () {
                            _deleteTx(_usertransactions[index].id);
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).accentColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            _deleteTx(_usertransactions[index].id);
                          }),
                ),
              );
            });
  }
}
