class UserModel {
  late String id, firstName, lastName, location, email;
  List<String> images = [];
  late bool receiveEmails;

  List<String> fTours = [], fStays = [], fBlogs = [], fOffers = [], fNews = [];
  List<String> likedQuestions = [], unlikedQuestions = [];

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.email,
    this.images = const [],
    required this.receiveEmails,
  });

  UserModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    firstName = data["firstName"];
    lastName = data["lastName"];
    location = data["location"];
    email = data["email"];
    List images = data["images"] ?? [];
    this.images = List.generate(images.length, (index) => images[index]);
    receiveEmails = data["receiveEmails"];


    List fTours = data["fTours"] ?? [];
    this.fTours = List.generate(fTours.length, (index) => fTours[index]);



    List fStays = data["fStays"] ?? [];
    this.fStays = List.generate(fStays.length, (index) => fStays[index]);


    List fOffers = data["fOffers"] ?? [];
    this.fOffers = List.generate(fOffers.length, (index) => fOffers[index]);


    List fBlogs = data["fBlogs"] ?? [];
    this.fBlogs = List.generate(fBlogs.length, (index) => fBlogs[index]);


    List fNews = data["fNews"] ?? [];
    this.fNews = List.generate(fNews.length, (index) => fNews[index]);


    List likedQuestions = data["likedQuestions"] ?? [];
    this.likedQuestions = List.generate(likedQuestions.length, (index) => likedQuestions[index]);


    List unlikedQuestions = data["unlikedQuestions"] ?? [];
    this.unlikedQuestions = List.generate(unlikedQuestions.length, (index) => unlikedQuestions[index]);

  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "firstName" : firstName,
      "lastName" : lastName,
      "location" : location,
      "email" : email,
      "images" : images,
      "receiveEmails" : receiveEmails,
    };
  }
}
