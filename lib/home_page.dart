// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:imagechanger/api_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentdata = 'the data will show here';
  String _imageUrl = '';
  Future<void> _getRandomPost() async {
    var resultApi = await getdata();

    if (resultApi != null && resultApi.isNotEmpty) {
      setState(() {
        var item = resultApi.first;
        print(item['url']);
        _currentdata = "random cat images";
        _imageUrl = item['url'];
      });
    } else {
      setState(() {
        _currentdata = 'there is no data found ';
        _imageUrl = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cat page",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_currentdata),
            SizedBox(height: 30),
            _imageUrl.isNotEmpty
                ? Image.network(
                    _imageUrl,
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  )
                : Text("tap on the button below >>"),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _getRandomPost,
              child: Icon(Icons.change_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
