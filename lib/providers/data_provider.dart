import 'package:flutter/material.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/models/stay_booking.dart';
import 'package:travel_book/models/tour_booking.dart';
import 'package:travel_book/models/user_model.dart';
import '../models/discount_model.dart';
import '../models/help_model.dart';
import '../models/news_model.dart';
import '../models/notifications_model.dart';
import '../models/participant.dart';
import '../models/special_offer_model.dart';
import '../models/stay_model.dart';
import '../models/tour_model.dart';
import '../models/travel_blog_model.dart';

class DataProvider with ChangeNotifier {
  DataProvider() {
    drinksList = [
      "Water",
      "Coffee",
      "Tea",
      "Orange Juice",
      "Cola",
      "Lemonade",
      "Milk",
    ];

    userModel = Constants.user;

    specialOffers = [Constants.specialOffer];
    news = [Constants.news, Constants.news];
    blogs = [Constants.travelBlog, Constants.travelBlog];

    stays = [Constants.stay, Constants.stay];
    tours = [Constants.tour, Constants.tour];
    discountList = [Constants.discount, Constants.discount];

    help = [
      HelpModel(
        question: "How much water should I drink per day?",
        answer:
            "The recommended amount of water intake per day varies depending on factors such as age, weight, and activity level. However, a general guideline is to drink at least 8 glasses of water a day, which is about 2 liters.",
        category: "Health",
        id: "1",
      ),
      HelpModel(
        question: "How do I brew the perfect cup of coffee?",
        answer:
            "Brewing the perfect cup of coffee involves using the right coffee-to-water ratio, choosing high-quality coffee beans, grinding them to the correct consistency, and using clean water at the right temperature (between 195°F to 205°F). Experiment with different brewing methods and find what works best for your taste.",
        category: "Food & Drink",
        id: "2",
      ),
      HelpModel(
        question: "What are some tips for improving my sleep?",
        answer:
            "To improve sleep quality, establish a regular sleep schedule, create a relaxing bedtime routine, make your sleep environment comfortable and conducive to sleep, limit screen time before bed, avoid caffeine and heavy meals close to bedtime, and manage stress through relaxation techniques like deep breathing or meditation.",
        category: "Health",
        id: "3",
      ),
    ];

    notifications = [
      NotificationsModel(
        id: "1",
        icon: "sun",
        title: "Weather Update",
        description:
            "Sunny weather forecast for today. Don't forget your sunscreen!",
        timePosted: DateTime.now(),
        usersNotification: ["user1", "user2", "user3"],
      ),
      NotificationsModel(
        id: "2",
        icon: "people",
        title: "Special Offer",
        description:
            "Don't miss out on our special discount! Limited time offer.",
        timePosted: DateTime.now().subtract(Duration(days: 1)),
        usersNotification: ["user4", "user5", "user6"],
      ),
      NotificationsModel(
        id: "3",
        icon: "tag",
        title: "New Arrival",
        description:
            "Check out our latest collection. Trendy styles just for you.",
        timePosted: DateTime.now().subtract(Duration(days: 2)),
        usersNotification: ["user7", "user8", "user9"],
      ),
    ];

    tourBookings = [
      TourBooking(
        dateTime: DateTime.now(),
        firstName: "John",
        lastName: "Doe",
        participants: [
          Participant(
              firstName: TextEditingController(text: "Alice"),
              lastName: TextEditingController(text: "Doe"),
              preferredDrink: "Coffee"),
        ],
        pricePerPerson: 200.00,
        totalAmount: 200.00,
        userID: "user123",
        tourID: "tourABC",
        numParticipants: 1,
        bookingDateTime: DateTime.now(),
      ),
      TourBooking(
        dateTime: DateTime.now().add(Duration(days: 5)),
        firstName: "Jane",
        lastName: "Smith",
        participants: [
          Participant(
              firstName: TextEditingController(text: "Bob"),
              lastName: TextEditingController(text: "Smith"),
              preferredDrink: "Tea"),
          Participant(
              firstName: TextEditingController(text: "Emily"),
              lastName: TextEditingController(text: "Green"),
              preferredDrink: "Juice"),
        ],
        pricePerPerson: 350.00,
        totalAmount: 700.00,
        userID: "user456",
        tourID: "tourXYZ",
        numParticipants: 2,
        bookingDateTime: DateTime.now(),
      ),
      TourBooking(
        dateTime: DateTime.now().add(Duration(days: 10)),
        firstName: "Michael",
        lastName: "Johnson",
        participants: [
          Participant(
              firstName: TextEditingController(text: "Emily"),
              lastName: TextEditingController(text: "Johnson"),
              preferredDrink: "Water"),
        ],
        pricePerPerson: 150.00,
        totalAmount: 300.00,
        userID: "user789",
        tourID: "tourDEF",
        numParticipants: 1,
        bookingDateTime: DateTime.now(),
      ),
    ];

    reservedOffers = [
      tourBookings[0],
      tourBookings[1],
    ];

    stayBookings = [
      StayBooking(
        reservedDateTime: DateTime.now(),
        firstName: "Alice",
        lastName: "Jones",
        pricePerNight: 100.00,
        totalAmount: 200.00,
        userID: "user123",
        stayID: "stayGHI",
        numDays: 2,
        bookingDateTime: DateTime.now(),
      ),
      StayBooking(
        reservedDateTime: DateTime.now().add(Duration(days: 3)),
        firstName: "Bob",
        lastName: "Williams",
        pricePerNight: 120.00,
        totalAmount: 360.00,
        userID: "user456",
        stayID: "stayJKL",
        numDays: 3,
        bookingDateTime: DateTime.now(),
      ),
      StayBooking(
        reservedDateTime: DateTime.now().add(Duration(days: 7)),
        firstName: "Charlie",
        lastName: "Brown",
        pricePerNight: 80.00,
        totalAmount: 160.00,
        userID: "user789",
        stayID: "stayMNO",
        numDays: 2,
        bookingDateTime: DateTime.now(),
      ),
    ];
  }

  String? type, id;

  //data variables
  UserModel? userModel;
  List<SpecialOfferModel> specialOffers = [];
  List<NewsModel> news = [];
  List<TravelBlogModel> blogs = [];
  List<HelpModel> help = [];
  List<StayModel> stays = [];
  List<TourModel> tours = [];

  List<TourBooking> tourBookings = [];
  List<TourBooking> reservedOffers = [];
  List<StayBooking> stayBookings = [];
  List<String> drinksList = [];
  List<DiscountModel> discountList = [];
  List<NotificationsModel> notifications = [];

  @override
  void dispose() {
    // cancelStreams();
    super.dispose();
  }
}
