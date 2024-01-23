import 'package:flutter/material.dart';
import 'package:to_do_app/Constants/colors.dart';
import 'package:to_do_app/Widgets/ToDoWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.tdBGColor,
        appBar: AppBar(
          backgroundColor: AppColors.tdBGColor,
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage('Assets/profile_image.png'),
            ),
            SizedBox(
              width: width * 0.025,
            ),
          ],
          leading: DrawerButton(
            style: ButtonStyle(),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Text('adf'),
              Text('adf'),
              Text('adf'),
              Text('adf'),
              Text('adf'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 12),
                  child: Text('All ToDos',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                ToDoItem(title: 'Title')
              ],
            ),
          ),
        ));
  }
}
