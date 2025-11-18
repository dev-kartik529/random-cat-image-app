// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:imagechanger/routes/api_route.dart';
import 'package:imagechanger/pages/cat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentdata = 'the data will show here';
  String _imageUrl = '';
  Map<String, dynamic>? _breadsinfo;
  Future<void> _getRandomPost() async {
    var resultApi = await getdata();

    if (resultApi != null && resultApi.isNotEmpty) {
      setState(() {
        var item = resultApi.first;
        print(item['url']);
        _currentdata = " cat images";
        _imageUrl = item['url'];
        print(resultApi);
        if (item['breeds'] != null && item['breeds'].isNotEmpty) {
          _breadsinfo = item['breeds'][0];
        } else {
          _breadsinfo = null;
        }
      });
    } else {
      setState(() {
        _currentdata = 'there is no data found ';
        _imageUrl = '';
        _breadsinfo = null;
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentdata,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _imageUrl.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatPage(
                              imageUrl: _imageUrl,
                              breedInfo: _breadsinfo,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(30),
                        child: Image.network(
                          _imageUrl,
                          height: 400,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Text("tap on the button below >>"),
              SizedBox(height: 20),
              FloatingActionButton.extended(
                onPressed: _getRandomPost,
                label: Text("change cat", style: TextStyle(fontSize: 20)),
                //child: Icon(Icons.change_circle_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
