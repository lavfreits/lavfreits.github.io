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
            'Experienced in both OOP and funcional: Dart, TypeScript, Kotlin, JavaScript.',
        "pt-br":
            'Experiência em OOP e funcional: Dart, TypeScript, Kotlin, JavaScript.'
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
            'Experiência no desenvolvimento de aplicativos nativos para Android usando Kotlin com Jetpack Compose.'
      });

  String get myWork => localize({"en": 'My \nWork', "pt-br": 'Meu \nTrabalho'});

  String get myWorkDesc => localize({
        "en":
            'Developed some hybrid mobile apps using Flutter on projects and companies I have worked on. Also developed some Android apps using Kotlin with Jetpack Compose.',
        "pt-br":
            'Desenvolvi aplicativos híbridos usando Flutter em projetos e empresas com as quais trabalhei e, também, desenvolvi alguns aplicativos Android usando Kotlin com Jetpack Compose.'
      });

  String get professionalExperience => localize(
      {"en": 'Professional Experience', "pt-br": 'Experiência Profissional'});

  List<String> get items => localizeList({
        "en": ["home", "expertise", "work", "experience", "contact"],
        "pt-br": [
          "início",
          "especialidade",
          "trabalho",
          "experiência",
          "contato"
        ]
      });

  String get softwareAnalystAndDeveloper => localize({
        "en": 'Software Analyst and Developer',
        "pt-br": 'Analista e Desenvolvedora de Software'
      });

  String get softwareAnalystAndDeveloperDesc => localize({
        "en":
            'Developed and maintained software for the company\'s internal use, using Dart, TypeScript, and JavaScript.',
        "pt-br":
            'Desenvolvi e mantive software para uso interno da empresa, utilizando Dart, TypeScript e JavaScript.'
      });

  String get mobileDeveloper =>
      localize({"en": 'Mobile Developer', "pt-br": 'Desenvolvedora Mobile'});

  String get mobileDeveloperDesc => localize({
        "en": 'Developed mobile apps for both Android and iOS using Flutter.',
        "pt-br":
            'Desenvolvi aplicativos móveis para Android e iOS usando Flutter.'
      });
}
