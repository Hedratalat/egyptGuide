import 'package:egypt_guide/database.dart';
import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
final dest;
const DestinationScreen({super.key,required this.dest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      offset: Offset(0, 7),
                      color: Colors.black54,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child:           Hero(
                  tag: dest['imageUrl'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      image: AssetImage(dest['imageUrl']),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon:Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon:Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.white,),
                        IconButton(onPressed: (){}, icon:Icon(Icons.sort),
                          iconSize: 30.0,
                          color: Colors.white,),
                      ],
                    ),


                  ],
                ),
              ),
              Positioned(
                bottom: 15.0,
                left: 15.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.my_location,
                          color: Colors.white,
                          size: 30.0,),
                        SizedBox(width: 5.0,),
                        Text(dest['city'],
                          style: TextStyle(color: Colors.white,
                        fontSize: 35.0,
                              fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                          color: Colors.white,
                          size: 30.0,),
                        SizedBox(width: 5.0,),
                        Text(dest['country'],style:
                        TextStyle(color: Colors.white,
                            fontSize: 30.0,
                           ),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder:(context,index){
                    return Stack(
                      children:[ Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                          child:Padding(
                            padding: const EdgeInsets.fromLTRB(80, 15, 7, 5),
                            child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children:
                                  [
                                  Container(
                                      width:100,
                                      child: Text(activities[index]['name'],
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines:2),
                                  ),
                                    Column(
                                      children: [
                                        Text('\$${activities[index]['price'].toString()}',
                                          style:TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ) ,),
                                        Text('per pax',
                                          style:TextStyle(
                                              color: Colors.grey
                                          ) ,),
                                      ],
                                    ),
                                ],),
                                Text(activities[index]['type'],
                                style: TextStyle(color: Colors.grey),),
                                  ratingStars(activities[index]['rating']),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                      Container(
                                          padding: const EdgeInsets.all(7.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD8ECF1),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child:
                                          Text(activities[index]['startTimes'][0])),
                                    SizedBox(width: 10.0,),
                                    Container(
                                        padding: const EdgeInsets.all(7.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD8ECF1),
                                            borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child:
                                        Text(activities[index]['startTimes'][1])),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        margin: EdgeInsets.fromLTRB(70, 5, 20, 5),
                        height: 190.0,
                      ),
                      Positioned(
                        top:10,
                        bottom:10,
                        left:15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width:120.0,
                              fit:BoxFit.cover,
                              image: AssetImage(activities[index]['imageUrl'])),
                        ),
                      ),
                      ],
                    );
                  } ,
              ),
            ),
          ),
        ],
      ),

    );
  }
}

Widget ratingStars(int? rate) { // اجعل النوع int? ليقبل null
  String stars = '';
  for (var i = 0; i < (rate ?? 0); i++) { // استخدم rate ?? 0 لتجنب null
    stars += '⭐';
  }
  return Text(stars);
}

