import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    final titles = ["General", "Account", "Payment"];
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF8B0000) : Colors.transparent,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    minHeight: 200,
                  ),
                  padding: const EdgeInsets.all(10.00),
                  decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("What is GAG cars?",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      SizedBox(height: 15,),
                      Divider(height: 1,thickness: 1,),
                      SizedBox(height: 30,),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                    ,)


                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  padding: const EdgeInsets.all(10.00),
                  decoration: BoxDecoration(
                       color: const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                         const Text("How To Use GAG cars app?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          GestureDetector(child: const Icon(Icons.keyboard_arrow_down_outlined,size: 25,weight: double.infinity,))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
