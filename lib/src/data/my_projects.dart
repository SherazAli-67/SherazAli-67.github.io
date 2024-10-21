import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/models/projects_model.dart';

final List<ProjectsModel> myProjects = [
  ProjectsModel(
    title: "ArabVet - البيطري العربي",
    coverPage: arabVetCoverPage,
    description: arabVetDescription,
    techStackList: [
      'Flutter',
      'Firebase',
      'WebRTC',
      'In-app-purchase',
      'BLoc',
      'Provider'
    ],
    appStore: 'https://apps.apple.com/us/app/arabvet-%D8%A7%D9%84%D8%A8%D9%8A%D8%B7%D8%B1%D9%8A-%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A/id6702022948',
    isArabicText: true
  ),
  ProjectsModel(
    title: "Hitch - Player Finder",
    coverPage: hitchPlayerFinderCoverPage,
    description: hitchDescription,
    techStackList: [
      'Flutter',
      'Firebase',
      'REST APIs',
      'In-app-purchase',
      'BLoc',
      'Provider'
    ],
    appStore: 'https://apps.apple.com/us/app/hitch-player-finder/id6670320911',
  ),
  ProjectsModel(
      title: "Markets AI",
      coverPage: marketsAICoverPage,
      description: marketsAIDescription,
      techStackList: [
        'Flutter',
        'Firebase',
        'REST APIs',
        'In-app-purchase',
        'BLoc',
        'Provider'
      ],
      appStore: 'https://apps.apple.com/us/app/markets-ai/id6479254392',
      ),
  ProjectsModel(
      title: "HappyLife: Book Summaries",
      coverPage: happyLifeCoverPage,
      description: happyLifeDescription,
      techStackList: [
        'Flutter',
        'Firebase',
        'BLoc',
        'Background Services',
        'Audio Manager',
        'Offline access'
      ],
      appStore: 'https://apps.apple.com/us/app/happylife-book-summaries/id6477767679',
      googlePlay: 'https://play.google.com/store/apps/details?id=com.jesperquest.happy_life_booksummaryapp'
  ),
  ProjectsModel(
    title: "Konushan - Language Exchange",
    coverPage: konushanCoverPage,
    description: konushanDescription,
    techStackList: [
      'Flutter',
      'OpenAI ChatGPT',
      'Firebase',
      'REST APIs',
      'BLoc',
    ],
    appStore: 'https://apps.apple.com/tr/app/konushan-language-exchange/id6462826463',
    googlePlay: 'https://play.google.com/store/apps/details?id=com.aithings.konushan'
  ),
  ProjectsModel(
      title: "Code of CIVIL PROCEDURE",
      coverPage: codeOfCivilProcedureCoverPage,
      description: codeOfCivilProcedureDescription,
      techStackList: [
        'Native Android',
        'Java',
        'Firebase',
        'Translation',
        'Text-to-Speech',
      ],
  ),
 /* ProjectsModel(
    title: "PRINT-ON-DEMAND Custom T-Shirt",
    coverPage: customTeesCoverPage,
    description: customTeesDescription,
    techStackList: [
      'Native Android',
      'Java',
      'Firebase',
      'Design SDK',
    ],
  ),*/
];