import 'package:flutter/material.dart';
import '../../../extras/colors.dart';
import '../../../widgets/back_button_widget.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/rich_bold_widget.dart';
import '../../../widgets/rich_text_tab.dart';
import '../../../widgets/text_tile_widget.dart';
import '../../../widgets/text_widget.dart';
class PrivacyPolicy extends StatelessWidget {
   PrivacyPolicy({Key? key}) : super(key: key);

  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
                const VMarginWidget(factor: 2,),
          const BackButtonWidget(),
           const  VMarginWidget(
                 factor: 0.6,
               ),
                  HeadingWidget(
              text: "Privacy"
            ),
           const  VMarginWidget(factor: 0.5,),
            TextWidget(
            text: '3 Feb 2023',
            ),
          const VMarginWidget(factor: 0.5,),
          RichTextTab(text: 'First things first – your privacy is important to us. That might be the kind of thing all these notices say, but we mean it. You place your trust in us by using Rome Italy Travel services and we value that trust. That means we’re committed to protecting and safeguarding your personal data. We act in our customers’ best interest and we are transparent about the processing of your personal data.'
              '\n\nThis document describes how we use and process your personal data, provided in a readable and transparent manner. It also tells you what rights you can exercise in relation to your personal data and how you can contact us. Please also read our',
            tabText: ' Cookie Policy ',
            textThree: 'which tells you how Rome Italy Travel uses cookies and other similar tracking technologies.',
          ),
          const TextTileWidget(
            text: 'Definitions and legal references',
          ),
          const DividerWidget(),
          HeadingWidget(
            text: "Personal Data (or Data)" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Usage Data" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Information collected automatically through this Application (or third-party services employed in this Application), which can include: the IP addresses or domain names of the computers utilized by the Users who use this Application, the URI addresses (Uniform Resource Identifier), the time of the request, the method utilized to submit the request to the server, the size of the file received in response, the numerical code indicating the status of the server's answer (successful outcome, error, etc.), the country of origin, the features of the browser and the operating system utilized by the User, the various time details per visit (e.g., the time spent on each page within the Application) and the details about the path followed within the Application with special reference to the sequence of pages visited, and other parameters about the device operating system and/or the User's IT environment."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "User" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "The individual using this Application who, unless otherwise specified, coincides with the Data Subject."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Data Subject" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "The natural person to whom the Personal Data refers."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Data Processor (or Data Supervisor)" ,
            fontSize: 14,
          ),
          TextWidget(
              text: "The natural or legal person, public authority, agency or other body which processes Personal Data on behalf of the Controller, as described in this privacy policy."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Data Controller (or Owner)" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "The natural or legal person, public authority, agency or other body which, alone or jointly with others, determines the purposes and means of the processing of Personal Data, including the security measures concerning the operation and use of this Application. The Data Controller, unless otherwise specified, is the Owner of this Application."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "This Application" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "The means by which the Personal Data of the User is collected and processed."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Service" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "The service provided by this Application as described in the relative terms (if available) and on this site/application."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "European Union (or EU)" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Unless otherwise specified, all references made within this document to the European Union include all current member states to the European Union and the European Economic Area."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Cookie" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Cookies are Trackers consisting of small sets of data stored in the User's browser."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Tracker" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Tracker indicates any technology - e.g Cookies, unique identifiers, web beacons, embedded scripts, e-tags and fingerprinting - that enables the tracking of Users, for example by accessing or storing information on the User’s device."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Legal information" ,
            fontSize: 14,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "This Privacy Statement has been prepared based on provisions of multiple legislations, including Art. 13/14 of Regulation (EU) 2016/679 (General Data Protection Regulation)."
             " \n\n This privacy policy relates solely to this Application, if not stated otherwise within this document."
          ),
          const VMarginWidget(factor: 0.4,),
          HeadingWidget(
            text: "Types of Data collected" ,
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Among the types of Personal Data that this Application collects, by itself or through third parties, there are: first name; last name; email address; Trackers; Usage Data; Data communicated while using the service; calendar information; device information; name; phone number; geographic position."
          ),
          const VMarginWidget(factor: 0.4,),
        const TextTileWidget(
              text: "Read more"),
          const VMarginWidget(factor: 0.4,),
         const DividerWidget(),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "Mode and place of processing the Data" ,
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.5,),
          const TextTileWidget(
              text: "Methods of processing"),
          const DividerWidget(),
          const TextTileWidget(
              text: "Legal basis of processing"),
          const DividerWidget(),
          const TextTileWidget(
              text: "Place"),
          const DividerWidget(),
          const TextTileWidget(
              text: "Retention time"),
          const DividerWidget(),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "The purposes of processing" ,
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.5,),
          TextWidget(
              text: "The Data concerning the User is collected to allow the Owner to provide its Service, comply with its legal obligations, respond to enforcement requests, protect its rights and interests (or those of its Users or third parties), detect any malicious or fraudulent activity, as well as the following: Contacting the User, Analytics, Interaction with live chat platforms, Displaying content from external platforms, Tag Management, Advertising and Content performance and features testing (A/B testing)"
             "\n\n For specific information about the Personal Data used for each purpose, the User may refer to the section “Detailed information on the processing of Personal Data”."),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "Detailed information on the processing of Personal Data" ,
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.5,),
          TextWidget(
              text: "Personal Data is collected for the following purposes and using the following services:"),
          const VMarginWidget(factor: 0.5,),
          const TextTileWidget(text: "Advertising"),
          const DividerWidget(),
          const TextTileWidget(text: "Analytics"),
          const DividerWidget(),
          const TextTileWidget(text: "Contacting the User"),
          const DividerWidget(),
          const TextTileWidget(text: "Content performance and features testing (A/B testing)"),
          const DividerWidget(),
          const TextTileWidget(text: "Displaying content from external platforms"),
          const DividerWidget(),
          const TextTileWidget(text: "Interaction with live chat platforms"),
          const DividerWidget(),
          const TextTileWidget(text: "Tag Management"),
          const DividerWidget(),
         const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "Information on opting out of interest-based advertising" ,
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.5,),
          RichTextTab(
              text: "In addition to any opt-out feature provided by any of the services listed in this document, Users may learn more on how to generally opt out of interest-based advertising within the dedicated section of the ",
              tabText: "Cookie Policy."),
          TextWidget(
              text: " Cookie Policy."
          ),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "The rights of Users",
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Users may exercise certain rights regarding their Data processed by the Owner."
                  "\n\n In particular, Users have the right to do the following:"
          ),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(
            boldText: 'Withdraw their consent at any time.',
            normalText: ' Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data.',color: CColors.black,),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(
              boldText: "Object to processing of their Data.",
              normalText: " Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent. Further details are provided in the dedicated section below.",color: CColors.black) ,
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(boldText: "Access their Data. ",
              normalText: "Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing.",color: CColors.black),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(boldText: "Verify and seek rectification.",
              normalText: " Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected.",color: CColors.black),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(
              boldText: "Restrict the processing of their Data.",
              normalText: " Users have the right, under certain circumstances, to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it.",color: CColors.black
          ),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(
              boldText: "Have their Personal Data deleted or otherwise removed.",
              normalText: "Users have the right, under certain circumstances, to obtain the erasure of their Data from the Owner.",color: CColors.black),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(
              boldText: "Receive their Data and have it transferred to another controller.",
              normalText: " Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that the Data is processed by automated means and that the processing is based on the User's consent, on a contract which the User is part of or on pre-contractual obligations thereof.",color: CColors.black
          ),
          const VMarginWidget(factor: 0.5,),
          RichBoldWidget(
              boldText: "Lodge a complaint.",
              normalText: " Users have the right to bring a claim before their competent data protection authority.",color: CColors.black
          ),
          const VMarginWidget(factor: 0.5,),
          const TextTileWidget(
              text: "Details about the right to object to processing"
          ),
          const DividerWidget(),
          const TextTileWidget(
              text: "How to exercise these rights"
          ),
          const DividerWidget(),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "Cookie Policy ",
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.3,),
          RichTextTab(
              text: "This Application uses Trackers. To learn more, the User may consult the",
              tabText: " Cookie Policy."),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "Additional information about Data collection and processing",
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.5,),
          const TextTileWidget(
              text: "Legal action"
          ),
          const DividerWidget(),
          const TextTileWidget(
              text: "Additional information about User's Personal Data"
          ),
          const DividerWidget(),
          const TextTileWidget(
              text: "System logs and maintenance"
          ),
          const DividerWidget(),
          const TextTileWidget(
              text: "Information not contained in this policy"
          ),
          const DividerWidget(),
          const TextTileWidget(
              text: "How “Do Not Track” requests are handled"
          ),
          const DividerWidget(),
          const TextTileWidget(
              text: "Changes to this privacy policy"
          ),
          const DividerWidget(),
          const VMarginWidget(factor: 0.3,),
          TextWidget(
              text: "Should the changes affect processing activities performed on the basis of the User’s consent, the Owner shall collect new consent from the User, where required."
          ),
          const VMarginWidget(factor: 0.5,),
          HeadingWidget(
            text: "Owner and Data Controller",
            fontSize: 17,
          ),
          const VMarginWidget(factor: 0.4,),
          TextWidget(
              text: "Address"
          ),
          const VMarginWidget(factor: 0.3,),
          RichBoldWidget(
            boldText: "Owner contact email: ", normalText: "test@gmail.com",color: CColors.primary,),
          const VMarginWidget(),
































        ]
            ),
           ),
      ),
    );
  }
}
