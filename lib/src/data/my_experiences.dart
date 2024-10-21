import 'package:flutter/cupertino.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/models/experience_model.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';

class Experiences {
  static List<ExperienceModel> getMyExperiences({required Color textSpanColor}){
    return [
      ExperienceModel(title: "Tobuild LLC", keyResponsibilities: [
        TextSpan(
            children: [
              TextSpan(
                text: "Developed and Launched ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor),
              ),
              TextSpan(
                text: "Markets AI ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor),
              ),
              TextSpan(
                text: "offering AI-powered insights for retail investors, simplifying financial news and data analysis of top U.S. stocks. Premium features include advanced charting, an AI chatbot, and real-time updates.", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor),
              ),
            ]
        ),

        TextSpan(
            children: [
              TextSpan(
                text: "Developed and Launched ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor),
              ),
              TextSpan(
                text: "Hitches - Player finder App ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor),
              ),
              TextSpan(
                text: " connecting users with tennis and pickleball players, while helping them discover nearby courts. The app also provides options to find or offer coaching services, and facilitates communication to arrange games.", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor),
              ),
            ]
        ),
      ], companyIcon: icTobuildLLCIcon, duration: 'May 2024 - Present'),
      ExperienceModel(title: "Freelancing", keyResponsibilities: [
        TextSpan(
            children: [
              TextSpan(
                text: "Developed and Launched ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor),
              ),
              TextSpan(
                text: "ArabVet - البيطري العربي ", style: regularTextStyleWeb.copyWith(fontFamily: 'NotoNaskhArabic', fontWeight: FontWeight.w600,  color: textSpanColor),
              ),
              TextSpan(
                text: " the first Arabic veterinary consultation app, enabling pet owners to connect with veterinarians via video and text chats,with in-app purchases and push notifications.", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor),
              ),
            ]
        ),

        TextSpan(
            children: [
              TextSpan(
                  text: 'Developed and Published ',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', color: textSpanColor)
              ),
              TextSpan(
                  text: 'HappyLife: Book Summaries',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)
              ),
              TextSpan(
                  text: 'which offers audio summaries of top books, personalizes learning with challenges, and lets you save key ideas with flashcards and spaced repetition for lasting knowledge.',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
            ]
        ),
        TextSpan(
            children: [
              TextSpan(
                  text: 'Updated and Published ',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
              TextSpan(
                  text: 'Konushan - Language Exchange',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)
              ),
              TextSpan(
                  text: 'an AI-driven language teacher app supporting a multitude of languages, facilitating speech practice, transcription, and pronunciation improvement',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
            ]
        ),
        TextSpan(
            children: [
              TextSpan(
                  text: 'Successfully revamped the ',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
              TextSpan(
                  text: 'Kyzo e-commerce mobile app ',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)
              ),
              TextSpan(
                  text: 'introducing a contemporary UI and integrating Social Logins (Google, Apple, Facebook auth) and APIs for an enriched user experience',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
            ]
        ),
        TextSpan(
            children: [
              TextSpan(
                  text: 'Developed the ',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
              TextSpan(
                  text: 'Meeting Notes iOS App',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)
              ),
              TextSpan(
                  text: 'employing OpenAI ChatGPT API to enable real-time summary generation during meetings, empowering users to efficiently track meeting summaries',
                  style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)
              ),
            ]
        ),

      ], companyIcon: icFreelanceExperienceIcon, duration: 'Nov 2020 - 2024'),
      ExperienceModel(title: "ZETSOL Technologies", duration: 'November 2021-March 2022', keyResponsibilities: [
        TextSpan(
            children: [
              TextSpan(text: "Integrated ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)),
              TextSpan(text: "MVVM Architecture ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)),
              TextSpan(text: "in conjunction with Rest APIs, elevating the overall efficiency and maintainability of the applications", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)),
            ]
        ),
        TextSpan(
            children: [
              TextSpan(text: "Integrated ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)),
              TextSpan(text: "Firebase Push notifications, Firebase Dynamic Links, ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)),
              TextSpan(text: "and ", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)),
              TextSpan(text: "Google Maps SDK", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,  color: textSpanColor)),
              TextSpan(text: "in conjunction with Rest APIs, elevating the overall efficiency and maintainability of the applications", style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat',  color: textSpanColor)),
            ]
        ),


      ], companyIcon: zetsolLogo)
    ];
  }
}