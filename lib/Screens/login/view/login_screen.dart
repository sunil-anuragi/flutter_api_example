import 'package:flutter_practical/Screens/login/controller/login_controller.dart';

import '../../../Config/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    loginController controller = Get.put(loginController());
    return 
      Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or App Name
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Email Input
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.email(value),
                ),
                SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => controller.password(value),
                ),
                SizedBox(height: 20),

                Obx(() {
                  return ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.login(),
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text('Login'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                  );
                }),
                SizedBox(height: 20),

                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),

                SizedBox(height: 20),

                TextButton(
                  onPressed: () {},
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      );
   
  }
}
