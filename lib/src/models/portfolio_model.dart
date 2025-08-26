class PortfolioModel {
  final String aboutMe;
  final int yearsOfExperience;
  final String email;
  final String phoneNumber;
  final String resumeLink;
  final String shortDescription;
  final String myMissionText;

  PortfolioModel({
    required this.aboutMe,
    required this.yearsOfExperience,
    required this.email,
    required this.phoneNumber,
    required this.resumeLink,
    required this.shortDescription,
    required this.myMissionText
  });

  /// Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'aboutMe': aboutMe,
      'yearsOfExperience': yearsOfExperience,
      'email': email,
      'phoneNumber': phoneNumber,
      'resumeLink': resumeLink,
      'shortDescription' : shortDescription,
      'myMissionText' : myMissionText
    };
  }

  /// Create object from Map
  factory PortfolioModel.fromMap(Map<String, dynamic> map) {
    return PortfolioModel(
      aboutMe: map['aboutMe'] ?? '',
      yearsOfExperience: map['yearsOfExperience'] ?? 0,
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      resumeLink: map['resumeLink'] ?? '',
      shortDescription: map['shortDescription'] ?? '',
      myMissionText: map['myMissionText'] ?? ''
    );
  }

  /// Create empty/default instance
  factory PortfolioModel.empty() {
    return PortfolioModel(
      aboutMe: '',
      yearsOfExperience: 0,
      email: '',
      phoneNumber: '',
      resumeLink: '',
      shortDescription: '',
      myMissionText: ''
    );
  }
}
