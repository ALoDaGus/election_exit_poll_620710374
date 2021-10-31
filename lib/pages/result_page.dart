import 'package:election_exit_poll_620710374/models/electorItemWithScore.dart';
import 'package:election_exit_poll_620710374/services/api.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  static const routeName = '/ResultPage';

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<ElectorItemWithScore>? _electorList;
  var _isLoading = false;

  @override
  initState() {
    super.initState();
    _loadElector().then((list) {
      _electorList = list;
    });
    _isLoading = true;
  }

  Future<List<ElectorItemWithScore>> _loadElector() async {
    List list = await Api().fetch('exit_poll/result');
    var electorList =
        list.map((item) => ElectorItemWithScore.fromJson(item)).toList();
    // print(electorList);
    setState(() {
      _isLoading = false;
    });
    return electorList;
  }

  Widget _electorCard(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green,
            width: 50.0,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                '${_electorList![index].number}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.white.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _electorList![index].displayName,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          '${_electorList![index].score}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _electorList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/bg.png'),
                fit: BoxFit.cover,
              )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      image: AssetImage('images/vote_hand.png'),
                      width: 80.0,
                      height: 80.0,
                    ),
                    Text('EXIT POLL', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                      child: Text('Result', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    ),
                    Column(
                      children: [
                        _electorCard(0),
                        _electorCard(1),
                        _electorCard(2),
                        _electorCard(3),
                        _electorCard(4),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
