import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                elevation: 5.0,
                color: Colors.grey[500],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 150,child: Image(image: AssetImage("images/fbench.jpg"),)),
                              Text("Friendship Bench"),
                              ListTile(
                                leading: Icon(Icons.email),
                                title: Text("openline@friendshipbench.io"),
                              ),
                              ListTile(
                                leading: Icon(Icons.phone_android),
                                title: Text("+263 784 845 294"),
                              ),
                              ListTile(
                                leading: Icon(Icons.map),
                                title: Text(
                                    "4 Weale Road, Milton Park, Harare, Zimbabwe"),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[700],
                        elevation: 10,
                        shadowColor: Colors.blue[200],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Zimbabwe Psychological Association",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.phone_android,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    "+263 772 634 466",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.info,
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    "Pauline will refer you  to a Psychologist - they have a database of all practicing psychologists in Zimbabwe that are certified",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Adult Rape Clinic"),
                              ListTile(
                                leading: Icon(Icons.phone_android),
                                title: Text("+263 775 672 770"),
                              ),
                              ListTile(
                                leading: Icon(Icons.phone_android),
                                title: Text("+263 733 406 292"),
                              ),
                              ListTile(
                                leading: Icon(Icons.info),
                                title: Text(
                                    "Provides free medical and pyscho social care to survivors of sexual gender based violence"),
                              ),
                            ]),
                      ),
                      Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Highlands Halfway House"),
                              ListTile(
                                leading: Icon(Icons.phone_android),
                                title: Text("+263 786 858 831"),
                              ),
                              ListTile(
                                leading: Icon(Icons.info),
                                title: Text(
                                    "They also have Mandara Manor and Borrowdale Halfway House Their team has a Psychiatrist, Clinical Psychologist, Occupational Therapist"),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
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
