import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hsenid/connections/connection.dart';
import 'package:hsenid/models/Transaction.dart';
import 'package:hsenid/models/testModel.dart';
import 'package:hsenid/widget/newTranscation.dart';
import 'package:hsenid/widget/refreshWidget.dart';
import 'package:hsenid/widget/update.dart';

class BudegetBody extends StatefulWidget {
  @override
  _BudegetBodyState createState() => _BudegetBodyState();
}

class _BudegetBodyState extends State<BudegetBody> {
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
   List<Transaction> _futureTrans;
   final List<Transcations> _transactionss =[];

   void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => NewTransaction.add(),
      isScrollControlled: true,
    );
  }
  Future creatingSetState() async{
    //await DefaultCacheManager().emptyCache();
    _transactionss.clear();
     setState(() {
       fetchTrasnscation().then((value) {
         setState(() {
           _transactionss.addAll(value);
         });
       });
     });
     //await DefaultCacheManager().emptyCache();
  }
  @override
  void initState() {
    fetchTrasnscation().then((value) {
      setState(() {
        _transactionss.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // appBar: _appbar,
    AppBar _appbar = AppBar(
      title: Text('Expense Tracker'),
      actions: [
        IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.search)),
      ],
    );
    return Scaffold(
      appBar: _appbar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFDAC7).withOpacity(0.9), Color(0xFFE4CDA7)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: RefreshWidget(
                keyRefresh: keyRefresh,
                onRefresh: creatingSetState,
                child: ListView.builder(
                    itemCount: _transactionss.length,
                    itemBuilder: (BuildContext context, index){
                      if(_transactionss.isEmpty){
                        return Center(child: CircularProgressIndicator());
                      }else {
                        return Card(
                          margin: EdgeInsets.all(10),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Dismissible(
                            key: Key(_transactionss[index].id),
                            background: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(18)
                              ),
                              padding: EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              delete_Transcation(_transactionss[index].id);
                              print("im in delete section");
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("CONFIRMATION !!!!!!!!"),
                                    content:
                                    Text(
                                        "Are you sure you wish to delete this Transaction ?"),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: Text("DELETE")),
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text("CANCEL"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15.0),
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Updatepages(transaction: _transactionss),
                                //   ),
                                // );
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Text(
                                        'RS ${_transactionss[index].amount}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            _transactionss[index].title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            _transactionss[index].date.toString(),
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
