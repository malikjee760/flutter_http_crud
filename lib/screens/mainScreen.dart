import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_crud/screens/functions.dart';
import 'package:flutter_http_crud/model/post.dart';
import 'package:flutter_http_crud/util/const.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CRUD Operations'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  print('getting data');
                  getData();
                },
                child: Text('getData'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  print('posting data');

                  createUser(11, 232, 'malik', 'abc');
                },
                child: Text('PostData'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  print('deleting data');

                  deleteUser(5);
                },
                child: Text('DeleteData'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  print('updating data');

                  updatePost(1, 'abc');
                },
                child: Text('UpdateData'),
              ),
            ],
          ),
        ));
  }
}
