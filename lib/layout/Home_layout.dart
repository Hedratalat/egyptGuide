import 'package:egypt_guide/database.dart';
import 'package:egypt_guide/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomeLayout extends StatefulWidget {


  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
   int selectdIcon = 0;

  @override
  Widget build(BuildContext context) {
    List listIcon =[
      FontAwesomeIcons.plane,
      FontAwesomeIcons.hotel,
      FontAwesomeIcons.taxi,
      FontAwesomeIcons.train,
      FontAwesomeIcons.motorcycle,
      FontAwesomeIcons.ship,

    ];
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),

      body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Tell us about your destination in Egypt!',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // وظيفة البحث
                      },
                      icon: Icon(Icons.search, size: 35.0),
                      color: Colors.black, // لون الأيقونة
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0,),
              SizedBox(
                height: 80.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: listIcon.length,
                    itemBuilder: (context , index){
                         return GestureDetector(
                           onTap: (){
                             setState(() {
                               selectdIcon =index;
                             });
                           },
                           child: Container(
                             margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 80.0,
                             width: 80.0,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0),
                               color:selectdIcon == index? Colors.cyan: Colors.grey,
                             ),
                             child: Icon(listIcon [index],
                               color:Colors.white,),
                           ),
                         );
                }),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Destisnations',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                    ),),
                    Text('All data',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.cyan,
                    ),),
                  ],
                ),
              ),
              Container(
                height: 300.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:destination.length,
                    itemBuilder: (context , index)
                    {
                     return GestureDetector(
                       onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => DestinationScreen(dest: destination[index],)),
                         );                       },
                       child: Container(
                         margin: EdgeInsets.only(top: 15.0,bottom: 15.0,left: 7.0,right: 7.0),
                         height: 100.0,
                         width: 210.0,
                         child: Stack(
                           alignment: Alignment.topCenter,
                           children: [
                             Positioned(
                               bottom:5.0 ,
                               child: Container(
                                 width: 200.0,
                                 height: 100.0,
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(15.0)
                                 ),
                                 child: Expanded(
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 10.0,top: 20.0),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text('${destination[index]['activities'].length} Aactivities',
                                         style: TextStyle(
                                             fontSize: 20.0,
                                         fontWeight: FontWeight.bold),),
                                         Text(destination[index]['description'],
                                         style: TextStyle(
                                           color: Colors.grey,
                                         ),
                                         maxLines: 2,),
                       
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             Container(
                               height: 180.0,
                               width: 180.0,
                               decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black54,
                                     offset: Offset(4, 4),
                                     blurRadius:10.0,
                                   ),
                                   BoxShadow(
                                     color: Colors.black54,
                                     offset: Offset(-4, -4),
                                     blurRadius:10.0,
                                   )
                                 ],
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20.0)),
                             ),
                             Hero(
                               tag:destination[index]['imageUrl'] ,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(20.0),
                                 child: Image(
                                   width: 180.0,
                                   height: 180.0,
                                   fit: BoxFit.cover,
                                   image: AssetImage(destination[index]['imageUrl'],),),
                               ),
                             ),
                            Positioned(
                              top: 120.0,
                              left: 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.my_location,color: Colors.white,),
                                      Text(destination[index]['city'],
                                        style:TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ) ,),
                                    ],
                                       ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_searching,color: Colors.white,),
                                      Text(destination[index]['country'],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                           ],
                         ),
                       ),
                     );
                    },
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Exclusive Hotels',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                    Text('All data',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.cyan,
                      ),),
                  ],
                ),
              ),
              Container(
                height: 300.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context , index)
                  {
                    return Container(
                      margin: EdgeInsets.only(top: 15.0,bottom: 15.0,left: 15.0,right: 15.0),
                      height: 100.0,
                      width: 210.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom:5.0 ,
                            child: Container(
                              width: 200.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('${hotels[index]['name']} ',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      maxLines: 1,),
                                      Text(hotels[index]['address'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        maxLines: 2,),
                                      Text('\$${hotels[index]['price']} ',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 180.0,
                            width: 220.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(4, 4),
                                    blurRadius:10.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(-4, -4),
                                    blurRadius:10.0,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 220.0,
                              height: 180.0,
                              fit: BoxFit.cover,
                              image: AssetImage(hotels[index]['imageUrl'],),),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount:hotels.length,
                ),
              ),
            ],
      )),
    );
  }
}
