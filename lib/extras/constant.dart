
import '../models/discount_model.dart';
import '../models/faq_model.dart';
import '../models/news_model.dart';
import '../models/review_model.dart';
import '../models/review_model.dart';
import '../models/slot_model.dart';
import '../models/special_offer_model.dart';
import '../models/stay_model.dart';
import '../models/tour_date.dart';
import '../models/tour_model.dart';
import '../models/travel_blog_model.dart';
import '../models/travel_details.dart';
import '../models/user_model.dart';

class Constants {
  static String tourImage =
      'https://assets.traveltriangle.com/blog/wp-content/uploads/2018/09/swiss-alps.jpg?tr=w-400';
  static String image2 =
      'https://images.pexels.com/photos/355508/pexels-photo-355508.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  static String stayImage =
      'https://media.expedia.com/media/content/shared/images/travelguides/sem-hotels-tablet.jpg?impolicy=fcrop&w=360&h=224&q=medium';

  static NewsModel news = NewsModel(
    id: '1',
    rating: 4.5,
    title: 'What\'s on in Australia',
    location: 'Australia',
    link: 'https://example.com',
    time: '10:00 AM',
    newsDescription: 'This is a dummy news description.',
    locationDescription: 'Australia City',
    longitude: -73.935242,
    latitude: 40.730610,
    address: '123 Main Street',
    images: [tourImage, image2],
    category: 'Tour',
    timePosted: DateTime.now(),
  );

  static DiscountModel discount = DiscountModel(
    id: '1',
    discountNumber: 'DISCOUNT123',
    discountPercentage: 20,
    expired: ['2022-12-31', '2023-01-15'],
  );
  static UserModel user = UserModel(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
    location: 'Rome, Italy',
    email: 'johndoe@example.com',
    images: [
      'https://t4.ftcdn.net/jpg/03/03/11/75/360_F_303117590_NNmo6BS2fOBEmDp8uKs2maYmt03t8fSL.jpg'
    ],
    receiveEmails: true,
  );

  static TourModel tour = TourModel(
      id: '1',
      rating: 4.2,
      title: 'Colosseum Guided Tour',
      category: 'Guided Tours',
      cancellationHeader: 'Cancellation Policy',
      cancellationDescription:
          'Free cancellation up to 24 hours before the tour starts.',
      durationHeader: 'Duration',
      durationDescription: '2 hours',
      numPeople: 10,
      price: 25.99,
      placeDescription: 'Colosseum, Rome',
      longitude: 12.4924,
      latitude: 41.8902,
      whatIncluded: [
        'Transportation',
        'Accommodation',
        'Meals',
        'Guided Tours',
        'Entrance Fees',
        'Activities',
        'Equipment Rental',
        'Insurance',
        'Airport Transfers',
        'Local Guides',
        'Language Interpretation',
        'Souvenirs',
        'Tips and Gratuities',
        '24/7 Support',
        'Free Time for Exploration',
      ],
      address: 'Piazza del Colosseo, 1, 00184 Roma RM, Italy',
      images: [tourImage, image2],
      description: 'Explore the iconic Colosseum with a knowledgeable guide.',
      highlights: [
        'Skip-the-line access to the Colosseum',
        'Guided tour with an expert guide',
        'Learn about the history and architecture of the Colosseum'
      ],
      knowBeforeGo: [
        'Wear comfortable shoes',
        'Bring water and sunscreen',
        'Be prepared for security checks at the entrance'
      ],
      tourDates: [
        TourDate(from: DateTime(2024, 3, 15), to: DateTime(2024, 3, 15)),
        TourDate(from: DateTime(2024, 3, 16), to: DateTime(2024, 3, 16))
      ],
      slots: [
        SlotModel(date: DateTime(2024, 3, 15), slots: [
          DateTime(2024, 3, 15, 9, 0), // 9:00 AM slot
          DateTime(2024, 3, 15, 11, 0), // 11:00 AM slot
        ]),
        SlotModel(date: DateTime(2024, 3, 16), slots: [
          DateTime(2024, 3, 16, 9, 0), // 9:00 AM slot
          DateTime(2024, 3, 16, 11, 0), // 11:00 AM slot
        ]),
      ],
      timePosted: DateTime.now(),
      reviews: reviews);

  static StayModel stay = StayModel(
      id: '1',
      rating: 4.7,
      title: 'Luxury Villa in Tuscany',
      location: 'Tuscany, Italy',
      cancellationHeader: 'Cancellation Policy',
      cancellationDescription:
          'Free cancellation up to 48 hours before check-in.',
      locationHeading: 'About the Location',
      locationDescription: 'Beautiful countryside setting with stunning views.',
      numPeople: 6,
      facilities: ['Swimming pool', 'Garden', 'Wi-Fi'],
      description:
          'Experience the ultimate relaxation in this luxurious villa.',
      placeDescription: 'Tuscany, Italy',
      longitude: 11.2558,
      latitude: 43.7696,
      price: 200.0,
      address: 'Via dei Rossi, 123, 50123 Florence, Italy',
      checkIn: '3:00 PM',
      category: 'Vacation Rentals',
      images: [stayImage, stayImage],
      attributes: ['Family-friendly', 'Pet-friendly'],
      timePosted: DateTime.now(),
      reviews: reviews);

  static List<ReviewModel> reviews = [
    ReviewModel(
      userId: '1',
      id: '1',
      comment: 'Absolutely stunning villa with amazing amenities.',
      date: DateTime.now().millisecondsSinceEpoch,
      rating: 5,
    ),
    ReviewModel(
      userId: '2',
      id: '2',
      comment: 'Had a fantastic stay. Highly recommend!',
      date: DateTime.now().millisecondsSinceEpoch,
      rating: 4,
    ),
  ];

  static TravelBlogModel travelBlog = TravelBlogModel(
    id: '1',
    rating: 4.8,
    title: 'Exploring the Colosseum',
    subTitle: 'A journey through ancient history',
    date: 'March 10, 2024',
    category: 'Travel Blogs',
    description:
        'Discover the wonders of the Colosseum and its fascinating history.',
    longitude: 12.4924,
    latitude: 41.8902,
    heading2: 'Tips for Visiting',
    subHeading2: 'Plan your visit to the Colosseum',
    link: 'https://example.com',
    price: 0,
    timePosted: DateTime.now(),
    image: 'https://img.freepik.com/free-vector/gradient-adventure-background_23-2149048608.jpg',
    faq: [
      FAQModel(
          question: 'What are the opening hours of the Colosseum?',
          answer: 'The Colosseum is open from 8:30 AM to 7:00 PM.'),
      FAQModel(
          question: 'Can I buy tickets on-site?',
          answer:
              'Yes, you can purchase tickets at the entrance, but it may involve long queues.'),
    ],
    travelDetails: [
      TravelDetailsModel(
          title: "Badshahi Mosque, Lahore",
          link: "https://www.google.com/",
          image:image2,
          location: "Lahore, Pakistan",
          description1:
              "The magnificent Badshahi Mosque, also known as the Emperor's Mosque, is a UNESCO World Heritage Site and a stunning example of Mughal architecture.",
          description2:
              "Built in the 17th century by Emperor Aurangzeb, it boasts intricate red sandstone carvings, grand courtyards, and towering minarets, offering breathtaking views of the city.",
          imageDescription:
              "A panoramic view of the Badshahi Mosque showcasing its grand scale and intricate details.",
          timming: "Open daily from sunrise to sunset. Entry fee applies."),
      TravelDetailsModel(
          title: "Shalimar Gardens, Lahore",
          link: "https://www.google.com/",
          image:
             image2,
          location: "Lahore, Pakistan",
          description1:
              "The Shalimar Gardens, another UNESCO World Heritage Site, are a haven of tranquility amidst the bustling city.",
          description2:
              "Laid out in the Mughal style, these terraced gardens feature reflecting pools, cascading water channels, lush greenery, and pavilions, providing a serene escape.",
          imageDescription:
              "A tranquil scene within the Shalimar Gardens, showcasing the water channels and lush greenery.",
          timming: "Open daily from sunrise to sunset. Entry fee applies."),
      TravelDetailsModel(
          title: "Karachi Safari Park",
          link: "https://www.google.com/",
          image:image2,
          location: "Karachi, Pakistan",
          description1:
              "The Karachi Safari Park is a great place to encounter diverse wildlife species from around the world.",
          description2:
              "Spread over a vast area, the park offers opportunities to see lions, tigers, bears, monkeys, and various bird species in a semi-natural environment.",
          imageDescription:
              "A group of lions basking in the sun at the Karachi Safari Park.",
          timming: "Open daily from 9:00 AM to 5:00 PM. Entry fee applies."),
      TravelDetailsModel(
          title: "Mohenjo-daro",
          link: "https://www.google.com/",
          image:image2,
          location: "Larkana, Sindh, Pakistan",
          description1:
              "Mohenjo-daro is a UNESCO World Heritage Site and one of the most well-preserved archaeological sites of the Indus Valley Civilization.",
          description2:
              "Dating back to the 3rd millennium BCE, the ruins offer a glimpse into the sophisticated urban planning, architecture, and social structures of this ancient civilization.",
          imageDescription:
              "The Great Bath, a remarkable structure at Mohenjo-daro, showcasing the advanced engineering skills of the Indus Valley people.",
          timming: "Open daily from 9:00 AM to 5:00 PM. Entry fee applies."),
    ],
    images: [
      'https://img.freepik.com/free-vector/gradient-adventure-background_23-2149048608.jpg',
      image2
    ],
  );

  static SpecialOfferModel specialOffer = SpecialOfferModel(
    id: '1',
    rating: 4.5,
    title: 'Special Discount at Hotel Italia',
    location: 'Rome, Italy',
    link: 'https://example.com',
    time: 'February 25, 2024',
    dealDescription:
        'Get 20% off on your stay at Hotel Italia for bookings made this month.',
    placeDescription:
        'Hotel Italia offers modern accommodations in the heart of Rome.',
    locationDescription:
        'Centrally located near popular attractions like the Colosseum and Roman Forum.',
    longitude: 12.4924,
    latitude: 41.8902,
    address: 'Via Venezia 18, 00184 Roma RM, Italy',
    category: 'Special Offers',
    images: [
      'https://wallpapers.com/images/hd/travel-hd-wruelfhuiyy7ewtw.jpg',
      image2
    ],
    timePosted: DateTime.now(),
    slots: [
      SlotModel(
        date: DateTime(2024, 3, 15),
        slots: [
          DateTime(2024, 3, 15, 14, 0),
          DateTime(2024, 3, 15, 16, 0),
          DateTime(2024, 3, 15, 18, 0),
        ],
      ),
      SlotModel(
        date: DateTime(2024, 3, 16),
        slots: [
          DateTime(2024, 3, 16, 15, 0),
          DateTime(2024, 3, 16, 17, 0),
        ],
      ),
    ],
    price: 100,
    numPeople: 2,
  );

  static const pyClientID =
      "AW65b73NBu5Hlsh_M3BtSgMSQC-88QtxJaUb0IZqBUWV2TaVbEFgOFPabDa8pPQftg5a27f7bPe8Mwpr";
  static const pySecretID =
      "EDNykZWyVV40_TvCnb1e2c2uMIlAP-XBN1XQ91i0NHOYQmeZ6PQUX9dH8r5jEojQBVNfQrnr2TX4oriK";

  static const SECRET_KEY =
      "sk_test_51MJy2OAnQUZdQn3CPGZOVEMIlVyaLFdQPbHxKIxfdveaJu703tsKSqPUl5nlvy6g98UzZvBSVCk3b119GlHvJFUA00A5iIRyht";
  static const publishableKey =
      "pk_test_51MJy2OAnQUZdQn3CNOokcTAk4HhAJYo3I1W5d2AednN3lbbz5D4rrRD1CjrLk9lXP0nwpCntSXRxY7T7lr0xpq6P00HAE4c4PX";
//static const SECRET_KEY ="sk_test_51IutSZFvKe7ZjLaaSSvkaL19JLzavRMyNitlKLDF7grvvtJdYL9NQQMlVDi8cLvmEmk6rH88Eh4gqVWA7Mb9AhFD00TwIp6Twv";
//static const publishableKey = "pk_test_51IutSZFvKe7ZjLaaXWE5K2ED3F9ApOksTp13Bhh8UnAmLfpWdIrQhnmkRbsIOKOYHvtrcRdNo9ZbhW0HtwdZss5500PR3G44ry";
}
