import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';

class TermsAndCondition extends StatefulWidget {
  static const routeName = "/terms-condition";

  const TermsAndCondition({Key? key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.inputColor,
      body: Column(
        children: [
          Container(
            height: Dimensions.height45 * 1.9,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(Dimensions.height10 + Dimensions.height15 + 10),
                bottomRight:
                    Radius.circular(Dimensions.height10 + Dimensions.height15 + 10),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Terms & Condition",
                      color: Colors.white,
                      size: Dimensions.font26,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add your terms and conditions content here
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Introduction",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome to the MUG SRC Info System. These terms and conditions (\"Terms\") govern your access and use of the MUG SRC Info System.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "2. Acceptance of Terms",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "By accessing or using the MUG SRC Info System, you agree to be bound by these Terms and accept all legal consequences. If you do not agree to these Terms, please do not use this platform.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "3. Use of the System",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "3.1. The MUG SRC Info System is intended for use by students, faculty, and staff of the Methodist University College Ghana (MUCG) community.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "3.2. Users are responsible for ensuring the accuracy and security of their login credentials. Do not share your login information with others.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "3.3. Unauthorized access or use of the system is strictly prohibited.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "4. Privacy",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "4.1. The MUG SRC Info System may collect and store personal information for system functionality and communication purposes. User data will be handled in accordance with the MUCG Privacy Policy.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "4.2. Users are responsible for the security of their personal information and are encouraged to keep their profiles up to date.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "5. User Conduct",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "5.1. Users are expected to conduct themselves in a respectful and responsible manner when using the system.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "5.2. Inappropriate, offensive, or abusive behavior will not be tolerated.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "6. Information Accuracy",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "6.1. The information provided through the MUG SRC Info System is for informational purposes only. The MUCG and MUG SRC do not guarantee the accuracy, completeness, or timeliness of the information.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "6.2. Users should verify information obtained from the system with official sources when necessary.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "7. System Availability",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "7.1. The MUG SRC Info System may experience downtime or interruptions for maintenance, updates, or unforeseen circumstances.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "7.2. The MUCG and MUG SRC are not liable for any loss or inconvenience resulting from system unavailability.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "8. Intellectual Property",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "8.1. All content and materials provided through the MUG SRC Info System, including text, images, logos, and software, are the property of the MUCG or MUG SRC and are protected by copyright and other intellectual property laws.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "8.2. Users may not reproduce, distribute, or modify any content from the system without prior written consent.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "9. Disclaimer of Liability",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "9.1. The MUCG and MUG SRC make no warranties or representations regarding the accuracy, reliability, or fitness for a particular purpose of the information provided through the MUG SRC Info System.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "9.2. Users access and use the system at their own risk.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "10. Termination of Access",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "10.1. The MUCG and MUG SRC reserve the right to terminate or suspend a user's access to the system at any time for violations of these Terms and Conditions.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  Text(
                    "11. Contact Information",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "If you have any questions or concerns regarding these Terms and Conditions or the MUG SRC Info System, please contact:",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "Methodist University College Ghana (MUCG)",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "Student Representative Council (SRC)",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  // Customize contact information below as needed

                  Text(
                    "mugsrc@gmail.com",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  SizedBox(height: Dimensions.height10), // Add spacing if needed

                  Text(
                    "By using the MUG SRC Info System, you agree to these Terms and Conditions. If you do not agree with any part of these terms, please refrain from using the system.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "12th November 2024",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
