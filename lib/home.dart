import 'package:flutter/material.dart';
import 'rooms_screen.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double noOfAdults = 0.0;
  double noOfChildren = 0.0;
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  String view = '';
  List<String> extras = [];
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
                shrinkWrap: true,
                children:
                [
                  Image(image: NetworkImage('https://th.bing.com/th/id/OIP.Oseiu-mVfXVnNtNJ3jUx-wHaE8?w=280&h=187&c=7&r=0&o=5&dpr=1.35&pid=1.7'),fit: BoxFit.cover),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      children: [
                        Text('Check-in Date: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                        SizedBox(width: 30),
                        IconButton(onPressed: ()async{
                            final DateTime? selected = await showDatePicker(
                              context: context,
                              initialDate: date1,
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2025),
                            );
                            if (selected != null && selected != date1)
                              setState(() {
                                date1 = selected;
                              });
                          }
                          , icon:
                        Icon(Icons.date_range)),
                        Text(('${date1.year} - ${date1.month} - ${date1.day}').toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300]),)

                      ]
                  ),
                  SizedBox(height:10),
                  Row(
                      children: [
                        Text('Check-out Date: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                        SizedBox(width: 20),
                        IconButton(onPressed: ()async{
                          final DateTime? selected = await showDatePicker(
                            context: context,
                            initialDate: date2,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2025),
                          );
                          if (selected != null && selected != date2)
                            setState(() {
                              date2 = selected;
                            });
                          }, icon:
                        Icon(Icons.date_range)),
                        Text(('${date2.year} - ${date2.month} - ${date2.day}').toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                      ]
                  ),
                  SizedBox(height:10),
                  Row(
                      children:[
                        Text('Number Of Adults: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                        SizedBox(
                          width: 30,
                        ),
                        Slider(
                          activeColor: Colors.deepPurple[300],
                          value: noOfAdults,
                          onChanged: (newNo){
                            setState(() {
                              noOfAdults = newNo;
                            });
                          },
                          divisions: 10,
                          label: noOfAdults.toInt().toString(),
                          min: 0,
                          max: 10,
                        ),
                        Text(noOfAdults.toInt().toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                      ]
                  ),
                  Row(
                      children:[
                        Text('Number Of Children: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                        SizedBox(
                          width: 17,
                        ),
                        Slider(
                          activeColor: Colors.deepPurple[300],
                          value: noOfChildren,
                          onChanged: (newNo){
                            setState(() {
                              noOfChildren = newNo;
                            });
                          },
                          divisions: 10,
                          label: noOfChildren.toInt().toString(),
                          min: 0,
                          max: 10,
                        ),
                        Text(noOfChildren.toInt().toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                      ]
                  ),
                  SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('Extras: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                        CheckboxGroup(labels: <String>["Breakfast (50EGP/Day)","Internet WIFI (50EGP/Day)","Parking (100EGP/Day)"],
                          onSelected: (List<String> checked) =>
                              extras = checked,
                        ),
                        SizedBox(height: 10),
                        Text('View: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[300])),
                        RadioButtonGroup(labels: <String>["Garden View","Sea View"],
                          onSelected: (String selected)=>view = selected,
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> rooms_screen(checkInDate: date1, checkOutDate: date2, noOfChildren: noOfChildren, noOfAdults: noOfAdults, extras: extras, view: view)));
                      // Navigator.pushNamed(context, '0');
                    },
                      child: Text('Check Rooms and Rates'),style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple[200]
                      ),),
                  )
                ]
            ),
          )
      ),
    );
  }

}