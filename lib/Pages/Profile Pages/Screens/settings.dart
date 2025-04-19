import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.all(25.00),
              width: double.infinity,
              child:  Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10.00)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      Icon(Icons.notifications_none,size: 30,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: size.width * 0.15,
                            child: ClipOval(
                              child: Image.asset("assets/images/gag_logo_red.png",
                              fit: BoxFit.contain,
                              ),
                            ),
                          ),
                           const SizedBox(height: 10,),
                           const Text("Gordon Auto Garage",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                          const Text("joined: 1st January 2025",style: TextStyle(fontSize: 10),),
                          const SizedBox(height: 10,),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Get Verified',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 16),
                                Icon(Icons.check, color: Colors.white),
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2), // Optional border
                              ),
                              child: const Icon(Icons.perm_identity,size: 20,color: Colors.black,) ,
                            ),


                            const SizedBox(width: 25,),
                            const Text("Profile",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                          ],),
                          const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.red,)
                    ],
                  ),
                      const SizedBox(height: 16,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(Icons.list_alt_rounded,size: 30,),
                            SizedBox(width: 25,),
                            Text("My Listings",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                          ],),
                          Icon(Icons.arrow_forward_ios,size: 20,color: Colors.red,)
                        ],
                      ),
                      const SizedBox(height: 16,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                           Icon(Icons.shield_outlined,size: 30,),
                            SizedBox(width: 25,),
                            Text("Security",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                          ],),
                          Icon(Icons.arrow_forward_ios,size: 20,color: Colors.red,)
                        ],
                      ),
                      const SizedBox(height: 16,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                         Icon(Icons.perm_identity,size: 30,),
                            SizedBox(width: 25,),
                            Text("Dealer Login",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                          ],),
                          Icon(Icons.arrow_forward_ios,size: 20,color: Colors.red,)
                        ],
                      ),
                      const SizedBox(height: 16,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                         Icon(Icons.help_outline,size: 30,),
                            SizedBox(width: 25,),
                            Text("Help Center",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                          ],),
                          Icon(Icons.arrow_forward_ios,size: 20,color: Colors.red,)
                        ],
                      ),
                      const SizedBox(height: 16,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(Icons.settings_outlined,size: 30,),
                            SizedBox(width: 25,),
                            Text("Settings",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                          ],),
                          Icon(Icons.arrow_forward_ios,size: 20,color: Colors.red,)
                        ],
                      ),

                ],
              ),
                  const SizedBox(height: 70,),
                   const Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: [
                    Icon(Icons.logout_rounded, size: 50,),
                    Text("Logout",style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),)

                  ],)

            ]),
          ),
    ),
    ),
    );
  }
}
