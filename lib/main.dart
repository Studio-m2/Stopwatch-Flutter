// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps




import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int h=0,m=0,s=0; 

//we want to show time by clicking button so thats why we are taking value zero for h m s 
//we are taking three button for stop ,rest and start time

late Timer time;
    @override
  // hour   minute second     int type  

//void initState(){       // we dont want to show automatic time

//super.initState();
//start_time_function();

//}


void resettime()// resettime function

{

setState(() {
  
h=0;
m=0;
s=0;

});

}

void stoptime()   // stoptime function
{

time.cancel();  

}




void start_time_function(){

//h=0;      //intialize
//m=59;     //intialize
//s=50;       //intialize

time=Timer.periodic(const Duration(seconds:1), (myfunction) {
  
setState(() {
  
  if(s<59)    ///second starting from 0   then 1,2,3.......less than 59  

  {

s++;

  }

else
  if(m<59)    ///minute starting from 0   then 1,2,3.......less than 59  

  {

s=0;    // second set zero
m++;     // minute increasing 1,2,........59

  }



  else 


  {


m=0;   // minute set zero
s=0 ;  // secont set zero
h++;    // hour increasing 1,2,3..

  }






});
  
});


}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text('Timer'),
      centerTitle: true,
      
      ),
      body:
      
      Center(child:
      Column(
crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text('$h hour :$m minute :$s second',style: const TextStyle(fontSize:30 ),), // we need value so thats why we are taking (dollar sign $ )with s,m,h
        
        ElevatedButton(onPressed: () // we want to show time by clicking button
        {



start_time_function();




          
        }, child:const Text('start time')),
        
        
        SizedBox(height: 10,),
   ElevatedButton(onPressed: ()   // we want to stop time by clicking button
   
   {



stoptime();  //stoptime funcion


   }, child: const Text('stop time')) , 

 SizedBox(height: 10,),

ElevatedButton(onPressed: (){

resettime();


}, child: Text('reset time')), // third button //reset time // hour minute second == zero



        
        ],
      ),) ,
      ),
    );


  }
}




