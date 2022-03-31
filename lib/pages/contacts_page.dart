import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Color(0XFF3BAAFF),
          automaticallyImplyLeading: false,
          title: Text(
            'Find Help',

            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
       body:
        ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Friendship Bench"),



                        ListTile(
                          leading: Icon(
                            Icons.email
                          ),
                          title: Text("openline@friendshipbench.io"),
                        ),
                        ListTile(
                          leading: Icon(
                              Icons.phone_android
                          ),
                          title: Text("+263 784 845 294"),
                        ),
                        ListTile(
                          leading: Icon(
                              Icons.map
                          ),
                          title: Text("4 Weale Road, Milton Park, Harare, Zimbabwe"),
                        ),
                      ]


                    ),
                  ),
                  Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Zimbabwe Psychological Association"),
                          

                          ListTile(
                            leading: Icon(
                                Icons.phone_android
                            ),
                            title: Text("+263 772 634 466"),
                          ),
                          ListTile(
                            leading: Icon(
                                Icons.info
                            ),
                            title: Text("Pauline will refer you  to a Psychologist - they have a database of all practicing psychologists in Zimbabwe that are certified"),
                          ),
                        ]


                    ),
                  ),
                  Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Adult Rape Clinic"),


                          ListTile(
                            leading: Icon(
                                Icons.phone_android
                            ),
                            title: Text("+263 775 672 770"),
                          ),
                          ListTile(
                            leading: Icon(
                                Icons.phone_android
                            ),
                            title: Text("+263 733 406 292"),
                          ),
                          ListTile(
                            leading: Icon(
                                Icons.info
                            ),
                            title: Text("Provides free medical and pyscho social care to survivors of sexual gender based violence"),
                          ),

                        ]


                    ),
                  ),
                  Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Highlands Halfway House "),


                          ListTile(
                            leading: Icon(
                                Icons.phone_android
                            ),
                            title: Text("+263 786 858 831"),
                          ),
                          ListTile(
                            leading: Icon(
                                Icons.info
                            ),
                            title: Text("They also have Mandara Manor and Borrowdale Halfway House Their team has a Psychiatrist, Clinical Psychologist, Occupational Therapist"),
                          ),
                        ]


                    ),
                  ),

                  Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Highlands Halfway House "),


                          ListTile(
                            leading: Icon(
                                Icons.phone_android
                            ),
                            title: Text("+263 786 858 831"),
                          ),
                          ListTile(
                            leading: Icon(
                                Icons.info
                            ),
                            title: Text("They also have Mandara Manor and Borrowdale Halfway House Their team has a Psychiatrist, Clinical Psychologist, Occupational Therapist"),
                          ),
                        ]


                    ),
                  ),
                ],
              ),
            )
          ],
        )


      // Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Padding(padding: EdgeInsets.all(20),
      //         child: Text("Friend"))
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}