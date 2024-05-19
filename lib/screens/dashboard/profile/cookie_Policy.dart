import 'package:flutter/material.dart';
import 'package:travel_book/widgets/divider_widget.dart';
import 'package:travel_book/widgets/text_tile_widget.dart';

import '../../../extras/colors.dart';
import '../../../widgets/back_button_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/rich_bold_widget.dart';
import '../../../widgets/text_widget.dart';
class CookiePolicy extends StatelessWidget {
   CookiePolicy({Key? key}) : super(key: key);

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
                 const VMarginWidget(
                 factor: 2,
               ),
               const BackButtonWidget(),
               const  VMarginWidget(
                factor: 0.6,
               ),
                 HeadingWidget(
                   text: "Cookie Policy"
                    ),
               const  VMarginWidget(factor: 0.5,),
                  TextWidget(
                    text: "This document informs Users about the technologies that help this Application to achieve the purposes described below. Such technologies allow the Owner to access and store information (for example by using a Cookie) or use resources (for example by running a script) on a User’s device as they interact with this Application."
                    "\n\nFor simplicity, all such technologies are defined as Trackers within this document – unless there is a reason to differentiate.For example, while Cookies can be used on both web and mobile browsers, it would be inaccurate to talk about Cookies in the context of mobile apps as they are a browser-based Tracker. For this reason, within this document, the term Cookies is only used where it is specifically meant to indicate that particular type of Tracker Some of the purposes for which Trackers are used may also require the User's consent. Whenever consent is given, it can be freely withdrawn at any time following the instructions provided in this document."
                    "\n\nThis Application uses Trackers managed directly by the Owner (so-called “first-party” Trackers) and Trackers that enable services provided by a third-party (so-called “third-party” Trackers). Unless otherwise specified within this document, third-party providers may access the Trackers managed by them.The validity and expiration periods of Cookies and other similar Trackers may vary depending on the lifetime set by the Owner or the relevant provider. Some of them expire upon termination of the User’s browsing session.In addition to what’s specified in the descriptions within each of the categories below, Users may find more precise and updated information regarding lifetime specification as well as any other relevant information – such as the presence of other Trackers - in the linked privacy policies of the respective third-party providers or by contacting the Owner.",
                  ),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "Definitions and legal references"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(
                      text: "Activities strictly necessary for the operation of this Application and delivery of the Service",
                    fontSize: 17,
                  ),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "This Application uses so-called “technical” Cookies and other similar Trackers to carry out activities that are strictly necessary for the operation or delivery of the Service."),
                  const VMarginWidget(factor: 0.4,),
                  HeadingWidget(text: "Third-party Trackers",fontSize: 14,),
                  const VMarginWidget(factor: 0.5,),
                  const TextTileWidget(text: "Tag Management"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "Other activities involving the use of Trackers",fontSize: 17,),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "Basic interactions & functionalities",fontSize: 14,),
                  const VMarginWidget(factor: 0.4,),
                  TextWidget(text: "This Application uses Trackers to enable basic interactions and functionalities, allowing Users to access selected features of the Service and facilitating the User's communication with the Owner."),
                  const VMarginWidget(factor: 0.5,),
                  const TextTileWidget(text: "Interaction with live chat platforms"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "Experience enhancement",fontSize: 14,),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "This Application uses Trackers to provide a personalized user experience by improving the quality of preference management options, and by enabling interaction with external networks and platforms."),
                  const VMarginWidget(factor: 0.5,),
                 const TextTileWidget(text: "Displaying content from external platforms"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "Measurement",fontSize: 14,),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "This Application uses Trackers to measure traffic and analyze User behavior with the goal of improving the Service."),
                  const VMarginWidget(factor: 0.5,),
                  const TextTileWidget(text: "Analytics"),
                  const DividerWidget(),
                  const TextTileWidget(text: "Anonymized analytics services"),
                  const DividerWidget(),
                  const TextTileWidget(text: "Content performance and features testing (A/B testing)"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "Targeting & Advertising",fontSize: 14,),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "This Application uses Trackers to deliver personalized marketing content based on User behavior and to operate, serve and track ads."),
                  const VMarginWidget(factor: 0.5,),
                  const TextTileWidget(text: "Advertising"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "How to manage preferences and provide or withdraw consent",fontSize: 17,),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "There are various ways to manage Tracker related preferences and to provide and withdraw consent, where relevant:"
                  "\n\nUsers can manage preferences related to Trackers from directly within their own device settings, for example, by preventing the use or storage of Trackers."
                      "\n\nAdditionally, whenever the use of Trackers is based on consent, Users can provide or withdraw such consent by setting their preferences within the cookie notice or by updating such preferences accordingly via the relevant consent-preferences widget, if available."
                      "\n\n It is also possible, via relevant browser or device features, to delete previously stored Trackers, including those used to remember the User’s initial consent. "
                      "\n\nOther Trackers in the browser’s local memory may be cleared by deleting the browsing history."
                     " With regard to any third-party Trackers, Users can manage their preferences and withdraw their consent via the related opt-out link (where provided), by using the means indicated in the third party's privacy policy, or by contacting the third party. "
                  ),
                  const VMarginWidget(factor: 0.5,),
                  const TextTileWidget(text: "Locating Tracker Settings"),
                  const DividerWidget(),
                  const TextTileWidget(text: "How to opt out of interest-based advertising"),
                  const DividerWidget(),
                  const TextTileWidget(text: "Consequences of denying consent"),
                  const DividerWidget(),
                  const VMarginWidget(factor: 0.5,),
                  HeadingWidget(text: "Owner and Data Controller",fontSize: 17,),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "Address"
                  ),
                  const VMarginWidget(factor: 0.5,),
                  RichBoldWidget(
                      boldText: "Owner contact email: ", normalText: "test@gmail.com",color: CColors.primary,),
                  const VMarginWidget(factor: 0.5,),
                  TextWidget(text: "Since the use of third-party Trackers through this Application cannot be fully controlled by the Owner, any specific references to third-party Trackers are to be considered indicative. In order to obtain complete information, Users are kindly requested to consult the privacy policies of the respective third-party services listed in this document."
                  "\n\n Given the objective complexity surrounding tracking technologies, Users are encouraged to contact the Owner should they wish to receive any further information on the use of such technologies by this Application."
                  ),
                  const VMarginWidget(factor: 0.5,),


















                ]
              ),
    ),
      ),
    );
  }
}
