
import 'dart:math';

import 'package:flutter/material.dart';


// Parents
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics:const NeverScrollableScrollPhysics(),
          child: Container(
            padding:const EdgeInsets.only(top: 30),
            child:const Column(
              children: [
                Header(),
                SizedBox(height: 30,),
                Main(),
              ]
            ),
          ),
        ),
      ),
    );
  }
}


// Header

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text('TODOLIST-APP',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Ephesis-Regular',
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink.shade100.withOpacity(0.7)),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.pink.shade100)
                      )
                    )
                  ), 
                  child:const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Text('Add Task',
                      style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Ephesis-Regular',
                      fontWeight: FontWeight.bold
                      
                    ), 
                    ),
                  ),
                )
              )
            ],
          ),
          const SizedBox(height: 30,),
          const Text('Daily Task',
            style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Ephesis-Regular',
                    fontWeight: FontWeight.bold
                  )
          )
        ],
      ),
    );
  }
}

// Body

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding:const EdgeInsets.only(top: 40, left: 10),
      height:size.height *3/4 ,
      decoration:const BoxDecoration(
        color: Color.fromARGB(255, 236, 205, 215),
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index)=> ListTask(color: Colors.primaries[Random().nextInt(Colors.primaries.length)],)
      ),
    );
  }
}

// ListTask

class ListTask extends StatefulWidget {
  final Color color;
  const ListTask({super.key, required this.color});

  @override
  // ignore: no_logic_in_create_state
  State<ListTask> createState() => _ListTaskState(color);
}

class _ListTaskState extends State<ListTask> {

  final Color color ;

  _ListTaskState(this.color);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 30),
      child: Row(
        children: [
          Container(
            height: size.height *1/5,
            width: size.width *1/6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
              boxShadow:[
                BoxShadow(
                  color: color,
                  offset:const Offset(0, 0),
                  spreadRadius: 0.3,
                  blurRadius: 10
                )
              ]
            ),
          ),
          const SizedBox(width: 30,),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 10, top: 15),
                child: Stack(
                  children:[
                    Container(
                      height: size.height *1/5,
                      width: size.width *4/6,
                      decoration:BoxDecoration(
                        color: color.withOpacity(0.75),
                        borderRadius:const BorderRadius.all(Radius.circular(20)),
                      ),
                      child:const Padding(
                        padding:  EdgeInsets.only(left:35, top: 10 , right: 10, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hoc tap va lam viec',
                              style: TextStyle(
                                fontSize: 27,
                                fontFamily: 'Ephesis-Regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              )
                            ),
                            SizedBox(height: 3,),
                            Text(
                              '8AM - 3PM',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Ephesis-Regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                              )
                            ),
                            SizedBox(height: 3,),
                            Text(
                              'Việc làm IT FRESHER |r Tăng lương 2 lần/ năm | Thời gian làm việc linh hoạt | TopDev - Việc Làm IT Hàng Đầu',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width *1/14,
                      height: size.height *1/5,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              
              Row(
                children: [
                  Buttonx(
                    icon: const Icon(Icons.edit,size: 30,color: Colors.blueGrey,),
                    onPresss: (){},
                  ),
                  const SizedBox(width: 5,),
                  Buttonx(
                    icon: const Icon(Icons.delete,size: 30,color: Colors.lightBlue,),
                    onPresss: (){},
                  ),
                  const SizedBox(width: 5,),
                  Buttonx(
                    icon: const Icon(Icons.workspace_premium,size: 30,color: Colors.yellowAccent,),
                    onPresss: (){},
                  ),
                  const SizedBox(width: 5,),
                  Buttonx(
                    icon: const Icon(Icons.schedule,size: 30,color: Colors.redAccent,),
                    onPresss: (){},
                  ),
                ],
              )
            ]
          ),
        ],
      ),
    );
  }
}

// Cac Butoon

// ignore: must_be_immutable
class Buttonx extends StatelessWidget {
  VoidCallback onPresss;
  Icon icon;
  Buttonx({super.key, required this.icon, required this.onPresss});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *0.5/10,
      width: size.width*1/10,
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ) ,
      
      child: IconButton(
        onPressed: onPresss,
        // icon:const Icon(icon, size: 30,color: Colors.lightBlue,),
        icon: icon,
      ),
    );
  }
}