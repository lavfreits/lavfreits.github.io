import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_container.dart';

class LocalizationContainer extends BlocContainer {
  final Widget child;

  const LocalizationContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocaleCubit>(
      create: (context) => CurrentLocaleCubit(),
      child: child,
    );
  }
}

class CurrentLocaleCubit extends Cubit<String> {
  CurrentLocaleCubit() : super('pt-br');
}

class ViewI18N {
  late String _language;

  ViewI18N(BuildContext context) {
    _language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String localize(Map<String, String> values) {
    assert(values.containsKey(_language), 'Language $_language not supported');
    assert(values[_language] != null, 'Language $_language not supported');

    return values[_language]!;
  }

  List<String> localizeList(Map<String, List<String>> values) {
    assert(values.containsKey(_language), 'Language $_language not supported');
    assert(values[_language] != null, 'Language $_language not supported');

    return values[_language]!;
  }
}

class HomeViewI18n extends ViewI18N {
  HomeViewI18n(super.context);

  String get nameIntroduction => localize({
        "en": 'Hi, \nI\'m Lavínia Lima.',
        "pt-br": 'Oi, \neu sou Lavínia Lima.'
      });

  String get introduction => localize({
        "en": 'I\'m a mobile developer.',
        "pt-br": 'Sou uma desenvolvedora mobile.'
      });

  String get expertise =>
      localize({"en": 'My Expertise', "pt-br": 'Minha Especialidade'});

  String get softwareDevDesc => localize({
        "en":
            'Experienced at mobile and backend development. Languages: Dart, TypeScript, Kotlin, JavaScript.',
        "pt-br":
            'Experiente no desenvolvimento mobile e backend. Linguagens: Dart, TypeScript, Kotlin, JavaScript.'
      });

  String get flutterDevDesc => localize({
        "en":
            'Skilled in developing mobile apps for both Android and iOS using Flutter.',
        "pt-br":
            'Habilidosa em desenvolver aplicativos móveis para Android e iOS usando Flutter.'
      });

  String get androidDevDesc => localize({
        "en":
            'Experienced in developing native Android apps using Kotlin with Jetpack Compose.',
        "pt-br":
            'Experiente no desenvolvimento de aplicativos nativos para Android usando Kotlin com Jetpack Compose.'
      });

  String get myWork => localize({"en": 'My Work', "pt-br": 'Meu Trabalho'});

  String get myWorkDesc => localize({
        "en":
            'Developed some hybrid mobile apps using Flutter on projects and companies I have worked on. Also developed some Android apps using Kotlin with Jetpack Compose. Here I\'m showing my personal projects.',
        "pt-br":
            'Desenvolvi aplicativos híbridos usando Flutter em projetos e empresas com as quais trabalhei e, também, desenvolvi alguns aplicativos Android usando Kotlin com Jetpack Compose. Aqui mostro alguns dos meu projetos pessoais. '
      });

  String get professionalExperience => localize({
        "en": 'Professional Experience',
        "pt-br": 'Experiência Profissional',
      });

  List<String> get items => localizeList({
        "en": [
          "home",
          "expertise",
          "work",
          "experience",
          "contact",
        ],
        "pt-br": [
          "início",
          "especialidade",
          "trabalho",
          "experiência",
          "contato",
        ]
      });

  String get softwareAnalystAndDeveloper => localize({
        "en": 'Software Analyst and Developer',
        "pt-br": 'Analista e Desenvolvedora de Software'
      });

  String get softwareAnalystAndDeveloperDesc => localize({
        "en":
            'I developed an academic portal using Flutter, allowing students to access classes, chats, and forums responsively. I refactored existing code by applying Clean Code principles, improving readability and maintainability. I integrated push notifications with Firebase and developed RESTful APIs with TypeScript to ensure effective communication between the app and the backend.\n',
        "pt-br":
            'Desenvolvi um portal acadêmico usando Flutter, permitindo que alunos acessassem aulas, chats e fóruns de forma responsiva. Refatorei código existente aplicando Clean Code, melhorando a legibilidade e a manutenibilidade. Integrei notificações push com Firebase e desenvolvi APIs RESTful com TypeScript para assegurar uma comunicação eficaz entre o app e o backend.\n'
      });

  String get analystSkills => localize({
        "en":
            'Skills: Flutter, Figma, Clean Code, Firebase, TypeScript, RESTful APIs, Agile Development, Code Reviews, Pair Programming',
        "pt-br":
            'Habilidades: Dart, Flutter, Figma, Clean Code, Firebase, TypeScript, APIs RESTful, desenvolvimento ágil, Kanban, Code Reviews, Pair Programming',
      });

  String get mobileDeveloper => localize({
        "en": 'Mobile Developer',
        "pt-br": 'Desenvolvedora Mobile',
      });

  String get mobileDeveloperDesc => localize({
        "en":
            'I created three mobile applications with Dart and Flutter, following Figma designs and the agile Kanban methodology. One of the apps was a white-label solution for stores, while the others formed an emergency system for users and agents. I integrated REST APIs, WebSockets, and the Google Maps API, managed media, and implemented video calls with Jitsi Meet. I utilized BLoC for state management and Modular for code modularization and route control. I performed unit and integration tests, resulting in greater software stability, and automated CI/CD pipelines with GitHub Actions and Fastlane.\n',
        "pt-br":
            'Criei três aplicativos móveis com Dart e Flutter, seguindo designs no Figma e a metodologia ágil Kanban. Um dos apps era um white label para lojas, enquanto os outros formavam um sistema de emergência para usuários e agentes. Integrei APIs REST, WebSockets e a API do Google Maps, além de gerenciar mídias e implementar chamadas de vídeo com Jitsi Meet. \n'
      });

  String get mobileDeveloperSkills => localize({
        "en":
            'Skills: Dart, Flutter, Figma, Kanban (Agile Methodology), REST APIs, WebSockets, Google Maps API, Media Management (Audio, Images, PDFs, Webviews), Jitsi Meet (Video Calls), BLoC, Modular, Unit and Integration Testing, CI/CD Pipelines, GitHub Actions, Fastlane, Git Version Control ',
        "pt-br":
            'Habilidades: Dart, Flutter, Figma, APIs REST, WebSockets, Google Maps API, Gerenciamento de Mídias (Áudio, Imagens, PDFs, Webviews), Jitsi Meet, BLoC, Modular, Testes unitários, CI/CD, Git, GitHub Actions, Fastlane',
      });
}
