import 'package:flutter/material.dart';
import 'package:to_do_app/Constants/colors.dart';
import 'package:to_do_app/Model/todo_model.dart';
import 'package:to_do_app/Widgets/ToDoWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AllToDoItemsObject = ToDoModel.allToDoList();

  final newToDoController = TextEditingController();
  final searchController = TextEditingController();

  List<ToDoModel> foundToDo = [];

  @override
  void initState() {
    foundToDo = AllToDoItemsObject;

    super.initState();
  }


  void onCheckboxChange(ToDoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void onDelete(String id) {
    setState(() {
      // AllToDoItemsObject.removeWhere((item) => item.id == id);
      AllToDoItemsObject.removeWhere((item) => item.id == id);
    });
  }

  void addNewToDo(String input) {
    setState(() {
      AllToDoItemsObject.add(ToDoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(), title: input));
      newToDoController.clear();
    });
  }




  void searchToDo(String text) {
    List<ToDoModel> result = [];
    if (searchController.text.isEmpty) {
      result = AllToDoItemsObject;
    } else {
      result = AllToDoItemsObject.where(
              (item) => item.title!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }

  setState(() {
     foundToDo = result;
  });

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.tdBGColor,
        appBar: AppBar(
          backgroundColor: AppColors.tdBGColor,
          actions: [
            const CircleAvatar(
              backgroundImage: AssetImage('Assets/profile_image.png'),
            ),
            SizedBox(
              width: width * 0.025,
            ),
          ],
          leading: const DrawerButton(
            style: ButtonStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {

                        searchToDo(value);

                      },
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40, bottom: 12),
                          child: const Text('All ToDos',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        for (ToDoModel myToDo in foundToDo.reversed)
                          ToDoItem(
                            myToDoObject: myToDo,
                            onCheckboxChange: onCheckboxChange,
                            onDelete: onDelete,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: newToDoController,
                        decoration: const InputDecoration(
                          hintText: 'Add a new ToDo Item',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        addNewToDo(newToDoController.text);
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: AppColors.tdBlue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.tdBlue,
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                            ]),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
