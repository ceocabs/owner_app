import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';



class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.privacyPolicy,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                navigator.pop();
              },
              child: Image.asset(
                Res.leftArrow,
                height: 39.h,
                width: 34.w,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColor.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: ProsteBezierCurve(
                position: ClipPosition.bottom,
                list: [
                  BezierCurveSection(
                    start: const Offset(0, 150),
                    top: Offset(screenWidth / 2, 200),
                    end: Offset(screenWidth, 150),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Container(
                  //  height: 180.h,
                  color: AppColor.darkBlue,
                ),
              ),
            ),
            Container(
              // height: 473.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 17.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          10.h.VBox,
                          Text(
                            "Privacy Policy",
                            style: textBold,
                          ),
                          10.h.VBox,
                          Text(
                            "Commencement Date: 01 January 2023",
                            style: textBold,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              top: 10.h,
                            ),
                            child: Text(
                              """We at CeoCabs Operating an app-based taxi service under a brand name namely CEO CABS owned by us respect your privacy as our valued customer/patron and acknowledge the need to protect the personally identifiable information (any information by which you can be identified, such as name, address, and telephone number) you share with us. We would like to assure you that we follow appropriate and stringent standards when it comes to protecting your privacy on our web sites and/ our mobile app with my ride features.


• This Privacy Policy applies to your use of interactive features or downloads that:
(i) we own or control and or 
(ii) are available through our various services. And or
(iii) interaction with these services.


• BY USING OUR SERVICES OR BY OTHERWISE GIVING US YOUR INFORMATION, YOU AGREE TO THE TERMS OF THIS PRIVACY POLICY. 


Please do review the following carefully so that you may appreciate our policies and practises with respect to protecting your privacy and our concern for your safety.


• We collect your name, mobile number and email id while registering you as our honoured customer. These details are required to identify you as a unique user in order to provide you our services hassle free. 
We collect your travel details like current location, travel time, source address and destination location only for the booking requests you make with us and happen your travel with us a happy experience.


You can choose to save your home address, office address and favourite travel destinations/addresses in your profile to make your booking experience highly handy. We also save your addresses from where you have travelled recently to book your next travel from the same location instantly. We also collect your feedback and ratings provided by you to improve our services. We collect your mobile OS type and device id to uniquely identify your device in order to send you relevant push notifications.


If you choose to use the tracking feature and alerts, we can use the mobile numbers of your dear and near ones shared by you in your profile to send them your location details to track you. This is for your safety purpose only.


• We require the information to identify you as a user, improve our services and provide the best possible service to all you and all our other users. We keep this information for internal record keeping purposes only. We use your contact details to send you your trip related information to you as well as our service partners. 


We may sometimes send you information to your email id or mobile number about ours as well as our associates’ new services, special offers or other information which in our opinion would be of interest to you. We may also sometimes contact you for your feedback for improving our services and market research purposes via email or mobile number keeping your best interest at our heart..


• We are committed to ensure you that your information is secured with us and that we have taken appropriate measures to protect the information you share with us. We employ the latest technology and security features and adhere to strict policy guidelines to safeguard the privacy of your personally identifiable information from any unauthorized access and improper use or disclosure.


Please feel free to contact us at "help@ceocabs.in" to obtain names and addresses of the specific entities which have access to your personal information in a given transaction. We shall continue to enhance the security procedures as the new technologies constantly emerge and ensures that any such security procedures are compliant with current applicable regulations.


• By using our services through the app, you agree for us to collect any personal information necessary to provide you the requested service and you agree that such personal information may be disclosed to the service partners (who may be third parties) for that purpose only.


We do not sell or rent any personal information to third parties. We reserve the right to modify our ‘privacy policy’ as and when required and in such an event, we shall update those changes on our website under the tab “Privacy Policy”, and other places we deem appropriate to disclose them so that you are all the time keep a breasted of what information we collect, how we use it, and under what circumstances. 


The Privacy Policy applies only to information collected through our website/application and not through any other sources. We may use your personal information to send you promotional information about third parties which we believe may of interest and useful to you.


• If there are any questions regarding this privacy policy or its implementation, please email us at "help@ceocabs.in" . 
If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible, at the above address. We shall promptly correct any information found to be incorrect.


• You are most welcome to visit our website (www.ceocabs.in) and should you find it necessary to raise any objection to our ‘PRIVACY POLICY’ fully or partially or desire to suggest any idea of yours to improve upon it, we assure of giving you a patient hearing in this regard but please be informed the same shall have to be strictly commensurate with our this ‘Privacy Policy’ and the website's terms of use. 


In addition to the foregoing, any disputes arising under this Policy shall be governed by the laws of the land and courts in Mumbai shall have exclusive jurisdiction in the matter.


HEARTY WELCOME TO CEO CABS.

The Brand CEO CABS is owned by Pro-Cab Roadway Private Limited, an Indian Company registered under the Companies Act, 2013 having its Registered office in – Mumbai suburban.
Complaints
If you wish to make a complaint about your personal information has been managed, you can lodge a complaint with us via your CeoCabs Application. Please provide as much information as possible so we can investigate and respond.
let you know that we have received your complaint
do our best to respond within 30 days of receiving your complaint. If we can’t respond within this timeframe we will let you know.
Phone No: +91 903 903 0010 Email: help@ceocabs.in 
Web: www.ceocabs.in Whatsaap Support: +91 7045 83 4507


                              """,
                              style: textRegular.copyWith(
                                  fontSize: 14.sp, color: AppColor.dark),
                              overflow: TextOverflow.fade,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
