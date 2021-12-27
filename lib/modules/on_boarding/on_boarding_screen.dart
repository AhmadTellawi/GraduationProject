import 'package:flutter/material.dart';
import 'package:gigapet/modules/identity/identity_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_identification_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({ Key? key }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'https://us.123rf.com/450wm/goodstudio/goodstudio1902/goodstudio190200256/117297231-adorable-young-woman-dressed-in-casual-clothes-holding-treat-and-training-her-dog-to-obey-commands-c.jpg?ver=6',
      title: 'Login as',
      body: 'Pet Owner'
    ),
    BoardingModel(
      image: 'https://st4.depositphotos.com/16253260/37883/v/950/depositphotos_378839844-stock-illustration-veterinarian-examines-dog-veterinary-clinic.jpg',
      title: 'Login as',
      body: 'Pet Clinic'
    ),
    BoardingModel(
      image: 'https://cdn4.iconfinder.com/data/icons/veterinary-indigo-vol-2/256/Pet_Store-512.png',      
      title: 'Login as',
      body: 'Pet Store'
    ),
    BoardingModel(
      image: 'https://cdn-icons-png.flaticon.com/512/2037/2037710.png',
      title: 'Swipe again',
      body: 'To Join Us!'
    )
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'GigaPet!',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(

                controller: boardController,
                onPageChanged: (index){
                  if(index == boarding.length - 1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  } else{
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 8,
                    spacing: 5,
                    activeDotColor: Colors.deepOrange
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => Sign_In_Identification_Screen(),
                        )
                      );
                    } else{
                    boardController.nextPage(
                      duration: Duration(
                        milliseconds: 750
                      ), 
                      curve: Curves.fastLinearToSlowEaseIn
                    );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(
                '${model.image}',
                scale: 1.5,
              )
            ),
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26
            ),
          ),
        ],
      );
}