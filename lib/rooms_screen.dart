import 'package:flutter/material.dart';

class rooms_screen extends StatefulWidget {
  DateTime checkInDate,checkOutDate;
  double noOfAdults,noOfChildren;
  List<String> extras;
  String view;
  rooms_screen({Key?key,required this.checkInDate,required this.checkOutDate,required this.noOfChildren,
  required this.noOfAdults, required this.extras, required this.view
  });
  @override
  State<rooms_screen> createState() => _rooms_screenState(checkInDate: checkInDate, checkOutDate: checkOutDate, noOfChildren: noOfChildren, noOfAdults: noOfAdults, extras: extras, view: view);
}
class Myitem{
  bool isExpanded;
  bool isSwiched;
  final Widget header;
  final Widget body;
  Myitem({this.isExpanded = false,required this.header,required this.body,required this.isSwiched});
}
class _rooms_screenState extends State<rooms_screen> {
  DateTime checkInDate,checkOutDate;
  double noOfAdults,noOfChildren;
  List<String> extras;
  String view;
  _rooms_screenState({Key?key,required this.checkInDate,required this.checkOutDate,required this.noOfChildren,
    required this.noOfAdults, required this.extras, required this.view
  });
  void ShowAlertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text('Are you sure you want to proceed in checking out?'),
        content: Text(
            '''This is a confirmation message that you agree on all data you entered:
Check-in Date: ${this.checkInDate.year}-${this.checkInDate.month}-${this.checkInDate.day}
Check-out Dte: ${this.checkOutDate.year}-${this.checkOutDate.month}-${this.checkOutDate.day}
Number of Adults: ${this.noOfAdults.toInt()}
Number of Children: ${this.noOfChildren.toInt()}
Extras: ${this.extras}
View: ${this.view}
Chosen Rooms: ${this.rooms}'''),

        actions: [
          ElevatedButton(
        onPressed: (){
           Navigator.pop(context);
        },
            child: Text('Confirm',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[200]
              )
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Discard',
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[200]
              )
          ),
        ]
    );
    showDialog(context: context, builder: (BuildContext context){return alertDialog;});

  }
  List<String> rooms = <String>[];
  List<String> roomsNames = <String>['Single Room','Double Room','Suite Room'];
  List<Myitem> _items = <Myitem>[
    Myitem(
      isSwiched: false,
      header: Row(children: [
        Image(image: NetworkImage('https://th.bing.com/th/id/OIP.V22-pNJJpfdjBQrjWfdmtQHaE7?w=263&h=180&c=7&r=0&o=5&dpr=1.35&pid=1.7',scale: 3),),
        SizedBox(width: 15),
        Text('Single Room',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
        SizedBox(width: 2,),
        ],
      ),body:
        Row(
          children: [
            Icon(Icons.star_outlined,color: Colors.amber),
            Icon(Icons.star_outlined,color: Colors.amber),
            Icon(Icons.star_outlined,color: Colors.amber),
            Icon(Icons.star_outlined,color: Colors.amber),
            Icon(Icons.star_outlined),
            SizedBox(width: 10),
            Text('A room assigned to one person.',style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
          ],
        ),
    ),
    Myitem(
      isSwiched: false,
      header: Row(children: [
        Image(image: NetworkImage('https://th.bing.com/th/id/OIP.iJDJYpi8eY2SzIwQnb0brAHaE7?w=264&h=180&c=7&r=0&o=5&dpr=1.35&pid=1.7',scale: 3),),
        SizedBox(width: 14),
        Text('Double Room',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
      ],
      ),body:
    Row(
      children: [
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined),
        SizedBox(width: 10),
        Expanded(
          child: Text('A room assigned to two people. May have one or more beds.',style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.deepPurple[300]),
          maxLines: 2,
          ),
        ),
      ],
    ),
    ),
    Myitem(
      isSwiched: false,
      header: Row(children: [
        Image(image: NetworkImage('https://th.bing.com/th/id/OIP.Srg8KWlMUSkj-g1cbC3eNwHaGI?w=212&h=180&c=7&r=0&o=5&dpr=1.35&pid=1.7',scale: 2.4),),
        SizedBox(width: 15),
        Text('Suite Room',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
        SizedBox(width:12)
      ],
      ),body:
    Row(
      children: [
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        Icon(Icons.star_outlined,color: Colors.amber),
        SizedBox(width: 10),
        Expanded(child: Text('A room with one or more bedrooms and a separate living space.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.deepPurple[300]),maxLines: 2)),
      ],
    ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title:Text('Castaway Resort',style: TextStyle(fontSize: 35,fontFamily:'MsMadi',fontWeight: FontWeight.bold,color: Colors.white)),
            backgroundColor: Colors.deepPurple[200],
          ),
          body: Padding(
            padding: EdgeInsets.all(8),
            child: ListView(
                children:[
                  ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded){
                        setState(() {
                          _items[index].isExpanded = !isExpanded;
                        });
                      },
                      children: _items.map<ExpansionPanel>((Myitem item)
                      {
                        return ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
                          return ListTile(
                              title: Row(
                                  children:[
                                    item.header,
                                    Switch(onChanged:(value){
                                      setState(() {
                                        item.isSwiched = !item.isSwiched;
                                      });
                                    },
                                      value: item.isSwiched,
                                    ),
                                  ]
                              )
                          );

                        },
                          body: ListTile(
                            title: item.body,
                          ),
                          isExpanded: item.isExpanded,
                        );
                      }
                      ).toList()
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: ElevatedButton(onPressed: (){
                      rooms.clear();
                      for(int i=0;i<3;i++)
                      {
                          if(_items[i].isSwiched)
                            rooms.add(roomsNames[i]);
                      }
                      ShowAlertDialog(context);
                    },
                      child: Text('Book Now!'),style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[200]
                      ),
                    ),
                  )
                ]
            )
          )
      ),
    );
  }

}