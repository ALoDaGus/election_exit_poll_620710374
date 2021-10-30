import 'package:election_exit_poll_620710374/services/api.dart';
import 'package:flutter/material.dart';

class ElectionPage extends StatefulWidget {
  const ElectionPage({ Key? key }) : super(key: key);

  static const routeName = '/ElectionPage';

  @override
  _ElectionPageState createState() => _ElectionPageState();
}

//SizedBox.shrink();

class _ElectionPageState extends State<ElectionPage> {

  var _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('test Hello World, สวัสดี โลก'),
        ],
      ),
    );
  }

  // Future<Map<String, dynamic>?> _guess() async {
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     var data = (await Api().submit('guess_teacher_age', {'year': _year, 'month': _month})) as Map<String, dynamic>;
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     _showMaterialDialog('ERROR', e.toString());
  //     return null;
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

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