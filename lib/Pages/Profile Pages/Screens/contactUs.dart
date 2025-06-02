import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../GeneralComponents/EdemComponents/CardContainers/contactUsCard.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  ContactUsCard(screenSize: MediaQuery.sizeOf(context),
                      cardBackgroundColor: Colors.white,
                      rowItems: const [
                        Icon(Icons.headset_mic_outlined,size: 30,),
                        SizedBox(width: 30,),
                        Text("Customer Service",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                      isBoxShadowFeatureRequired: false),
                  ContactUsCard(screenSize: MediaQuery.sizeOf(context),
                      cardBackgroundColor: Colors.white,
                      rowItems: const [
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.black,
                          size: 30,
                        ),

                        SizedBox(width: 30,),
                        Text("WhatsApp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                      isBoxShadowFeatureRequired: false),
                  ContactUsCard(screenSize: MediaQuery.sizeOf(context),
                      cardBackgroundColor: Colors.white,
                      rowItems: const [
                        FaIcon(
                          FontAwesomeIcons.globe,
                          color: Colors.black,
                          size: 30,
                        ),

                        SizedBox(width: 30,),
                        Text("Website",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                      isBoxShadowFeatureRequired: false),
                  ContactUsCard(screenSize: MediaQuery.sizeOf(context),
                      cardBackgroundColor: Colors.white,
                      rowItems: const [
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.black,
                          size: 30,
                        ),

                        SizedBox(width: 30,),
                        Text("Facebook",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                      isBoxShadowFeatureRequired: false),
                  ContactUsCard(screenSize: MediaQuery.sizeOf(context),
                      cardBackgroundColor: Colors.white,
                      rowItems: const [
                        FaIcon(
                          FontAwesomeIcons.twitter,
                          color: Colors.black,
                          size: 30,
                        ),

                        SizedBox(width: 30,),
                        Text("Twitter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                      isBoxShadowFeatureRequired: false),
                  ContactUsCard(screenSize: MediaQuery.sizeOf(context),
                      cardBackgroundColor: Colors.white,
                      rowItems: const [
                        FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.black,
                          size: 30,
                        ),

                        SizedBox(width: 30,),
                        Text("Instagram",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                      ],
                      isBoxShadowFeatureRequired: false),



                ],
              ),
            ),
          ),
        )
    );
  }
}
