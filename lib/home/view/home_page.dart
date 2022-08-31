import 'package:ecommercial/home/widgets/tapbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                // ignore: avoid_redundant_argument_values
                begin: Alignment.centerLeft,
                end: Alignment
                    .center, // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  Color.fromARGB(255, 203, 236, 245),
                  Colors.white
                ], // red to
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),

                //text line selection
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                  child: Text(
                    'New Collection',
                    style: TextStyle(
                      color: Color.fromARGB(255, 42, 104, 119),
                      fontFamily: ' Raleway-Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const MyTapBar(),

                Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: const Text(
                    'Our Products',
                    style: TextStyle(
                      color: Color.fromARGB(255, 42, 104, 119),
                      fontSize: 20,
                      fontFamily: 'Raleway-Medium',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mycont('assets/assets/imgs/hoddiIcon.png'),
                      mycont('assets/assets/imgs/shirtIcon.png'),
                      mycont('assets/assets/imgs/jeans2Icon.png'),
                      mycont('assets/assets/imgs/hoddiIcon.png')
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Center(
                    child: Text(
                      'Pick One',
                      style: TextStyle(
                        color: Color.fromARGB(255, 42, 104, 119),
                        fontSize: 20,
                        fontFamily: 'Raleway-Medium',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myoffer('30% OFF'),
                      myoffer('50% OFF'),
                      myoffer('60% OFF')
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

Widget mycont(String img) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 195, 236, 196),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Image(
          image: AssetImage(img),
          width: 50,
          height: 50,
        ),
      ],
    ),
  );
}

Widget myoffer(String offer) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 42, 104, 119),
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      offer,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 55, 122, 177),
      ),
    ),
  );
}
