// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:election_exit_poll_620710374/models/electorItem.dart';
import 'package:election_exit_poll_620710374/services/api.dart';
import 'package:flutter/material.dart';

import 'result_page.dart';

class ElectionPage extends StatefulWidget {
  const ElectionPage({Key? key}) : super(key: key);

  static const routeName = '/ElectionPage';

  @override
  _ElectionPageState createState() => _ElectionPageState();
}

class _ElectionPageState extends State<ElectionPage> {
  List<ElectorItem>? _electorList;

  var _isLoading = true;

  @override
  initState() {
    super.initState();
    _loadElector().then((list) {
      _electorList = list;
    });
    _isLoading = true;
  }

  Future<List<ElectorItem>> _loadElector() async {
    List list = await Api().fetch('exit_poll');
    var electorList = list.map((item) => ElectorItem.fromJson(item)).toList();
    // print(electorList);
    setState(() {
      _isLoading = false;
    });
    return electorList;
  }

  Future<void> _election(int index) async {
    var elector = (await Api().submit('exit_poll', {'candidateNumber': index}));
    _showMaterialDialog('SUCCESS', 'บันทึกข้อมูลสำเร็จ ${elector.toString()}');
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                        image: AssetImage('images/vote_hand.png'),
                        width: 80.0,
                        height: 80.0,
                      ),
                      Column(
                        children: [
                          Text(
                            'EXIT POLL',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'เลือกตั้ง อบต.',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'รายชื่อผู้สมัครรับเลือกตั้ง\nนายกองค์กรบริหารส่วนตำบลเขาพระ\nอำเภอเมืองนครนายก จังหวัดนครนายก',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _electorCard(0),
                          _electorCard(1),
                          _electorCard(2),
                          _electorCard(3),
                          _electorCard(4),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              ResultPage.routeName,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.teal,
                          ),
                          child: Text(
                            'ดูผล',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () {},
                      //     child: Text(
                      //       'ดูผล',
                      //       style: TextStyle(fontSize: 30.0),
                      //     ))
                    ],
                  ),
                ),
              ));
  }

  Widget _electorCard(index) {
    return InkWell(
      onTap: () {
        _election(index + 1);
      },
      child: Padding(
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
                  padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                  child: Text(
                    _electorList![index].displayName,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg, style: Theme.of(context).textTheme.bodyText2),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
