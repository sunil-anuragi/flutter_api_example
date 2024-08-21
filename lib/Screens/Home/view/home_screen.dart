

import 'package:flutter_practical/Screens/Home/controller/Home_controller.dart';

import '../../../Config/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) { 

    loginController controller = Get.put(loginController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: (){
                controller.sendFCMMessage();
              },
              child: Center(child: Text("Home screen")))),
      ),
    );
  }
}
