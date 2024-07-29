class Project {
  final String title;
  final String short_description;
  final String detailed_description;
  final List<String> imageUrl;
  final List<String> technologies;
  final String repoUrl;
  final bool isWeb;

  Project({
    this.isWeb = false,
    required this.title,
    required this.short_description,
    required this.detailed_description,
    required this.technologies,
    required this.imageUrl,
    required this.repoUrl,
  });
}

List<Project> projects = [
  Project(
    title: "Donut Store",
    short_description:
        "Um aplicativo Flutter para uma loja de donuts, permitindo explorar produtos e gerenciar favoritos.",
    detailed_description:
        "Donut Store UI é um app Flutter para uma loja de donuts com uma interface simples e recursos de gerenciamento de estado usando Provider e Firebase Cloud Firestore para favoritos. Permite explorar e favoritar produtos, adicionar itens ao carrinho e sincronizar dados. Inclui uma página de lista de produtos para futuras adições. Clone, configure o Firebase e execute para testar.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/donut_store_ui/master/home.png",
      "https://raw.githubusercontent.com/lavfreits/donut_store_ui/master/favorites_page.png",
      "https://raw.githubusercontent.com/lavfreits/donut_store_ui/master/cart.png",
      "https://raw.githubusercontent.com/lavfreits/donut_store_ui/master/products_list_page.png",
    ],
    repoUrl: "https://github.com/lavfreits/donut_store_ui",
    technologies: ["Provider", "Firebase Cloud Firestore", "Flutter"],
  ),
  Project(
    title: "Amphibians App",
    short_description:
        "Um aplicativo sobre anfíbios com informações e imagens detalhadas.",
    detailed_description:
        "Amphibians App é um aplicativo que fornece informações e imagens de diferentes espécies de anfíbios. Ideal para quem gosta de animais e deseja aprender mais sobre esses seres fascinantes.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/amphibians-app/master/home.png"
    ],
    repoUrl: "https://github.com/lavfreits/amphibians-app",
    technologies: ["Retrofit", "Jetpack Compose", "Coil", "Arquitetura MVVM"],
  ),
  Project(
    title: "Site Flutter Web",
    short_description:
        "Um site desenvolvido em Flutter que mostra diversos recursos e informações.",
    detailed_description:
        "Site Flutter Web é um projeto que demonstra a criação de um site moderno usando Flutter. O site inclui várias páginas e seções que destacam a flexibilidade do Flutter para web.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/site_flutter_web/master/Captura%20de%20tela%201.png",
      "https://raw.githubusercontent.com/lavfreits/site_flutter_web/master/Captura%20de%20tela%202.png",
      "https://raw.githubusercontent.com/lavfreits/site_flutter_web/master/Captura%20de%20tela%203.png",
      "https://raw.githubusercontent.com/lavfreits/site_flutter_web/master/Captura%20de%20tela%204.png",
      "https://raw.githubusercontent.com/lavfreits/site_flutter_web/master/Captura%20de%20tela%205.png"
    ],
    repoUrl: "https://github.com/lavfreits/site_flutter_web",
    isWeb: true,
    technologies: [
      "Flutter Web",
      "Responsividade",
    ],
  ),
  Project(
    title: "Portifólio",
    short_description:
        "Um site moderno feito em Flutter que mostra meus trabalhos e habilidades.",
    detailed_description:
        "Este projeto é um site feito em Flutter que exibe diversos recursos e informações sobre meu trabalho como desenvolvedora.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/site_flutter_web/master/Captura%20de%20tela%201.png",
    ],
    repoUrl: "https://github.com/lavfreits/site_flutter_web",
    isWeb: true,
    technologies: ["Flutter Web", "Responsividade", "Adaptabilidade das telas"],
  ),
  Project(
    title: "Login",
    short_description:
        "Um aplicativo que permite aos usuários se autenticar usando e-mail, senha ou Google.",
    detailed_description:
        "Login é um aplicativo Flutter que integra Autenticação Firebase para login de usuários, registro e Login com Google. Oferece uma interface simples para autenticação com e-mail e senha ou conta do Google.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/login/master/loging_in_page.png",
      "https://raw.githubusercontent.com/lavfreits/login/master/registering_page.png",
      "https://raw.githubusercontent.com/lavfreits/login/master/home_page.png"
    ],
    repoUrl: "https://github.com/lavfreits/login",
    technologies: [
      "Autenticação Firebase",
      "Login com e-mail e senha",
      "Login com Google",
    ],
  ),
  Project(
    title: "TMDB",
    short_description:
        "Um aplicativo para explorar filmes com informações detalhadas e imagens.",
    detailed_description:
        "TMDB é um aplicativo que permite aos usuários explorar e obter informações detalhadas sobre filmes. Inclui imagens, descrições e informações adicionais sobre filmes populares.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/tmdb_movies/master/splash.png",
      "https://raw.githubusercontent.com/lavfreits/tmdb_movies/master/home.png",
      "https://raw.githubusercontent.com/lavfreits/tmdb_movies/master/movie_info.png",
      "https://raw.githubusercontent.com/lavfreits/tmdb_movies/master/movie_info_2.png",
    ],
    repoUrl: "https://github.com/lavfreits/tmdb_movies",
    technologies: [
      "API TMDB",
      "Gerenciamento de estado com ChangeNotifier, Cubit e Bloc",
      "Manipulação de dados JSON"
    ],
  ),
  Project(
    title: "Flutter tarefas",
    short_description:
        "Um aplicativo para gerenciar tarefas e acompanhar o progresso.",
    detailed_description:
        "Flutter tarefas é um aplicativo simples para gerenciamento de tarefas, ajudando os usuários a acompanhar suas atividades diárias e manter a organização.",
    imageUrl: [
      "https://raw.githubusercontent.com/Kakomo/alura_flutter_curso_1/Aula_2/flutter1_gif.gif",
      "https://raw.githubusercontent.com/alura-cursos/alura_flutter_curso_3/main/flutter3V1_gif.gif",
    ],
    repoUrl: "https://github.com/lavfreits/flutter-app-tarefas",
    technologies: ["Flutter", "State Management", "Gamificação", "SQLite"],
  ),
  Project(
    title: "Rick and Morty App",
    short_description:
        "Um aplicativo baseado na série Rick and Morty, mostrando personagens e episódios.",
    detailed_description:
        "Rick and Morty App é um aplicativo dedicado aos fãs da série Rick and Morty. Ele exibe informações sobre personagens e episódios da série, oferecendo uma maneira divertida de explorar o universo do show.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/rick_morty_app/master/home.png",
      "https://raw.githubusercontent.com/lavfreits/rick_morty_app/master/character_page.png",
    ],
    repoUrl: "https://github.com/lavfreits/rick_morty_app",
    technologies: [
      "Flutter",
      "API Rick and Morty",
      "Rolagem infinita",
      "Exibição de detalhes do personagem"
    ],
  ),
  Project(
    title: "Bluromatic App",
    short_description:
        "Um aplicativo Android para aplicar efeitos de desfoque em imagens.",
    detailed_description:
        "Bluromatic é um aplicativo Android que permite aplicar diferentes níveis de desfoque em imagens. Ideal para quem deseja experimentar efeitos visuais e aprender sobre manipulação de imagens.",
    imageUrl: [
      "https://raw.githubusercontent.com/lavfreits/kotlin-compose-workmanager/master/home.png",
      "https://raw.githubusercontent.com/lavfreits/kotlin-compose-workmanager/master/see_file.png",
      "https://raw.githubusercontent.com/lavfreits/kotlin-compose-workmanager/master/file_blurred.png",
    ],
    repoUrl: "https://github.com/lavfreits/kotlin-compose-workmanager",
    technologies: [
      "WorkManager",
      "Jetpack Compose",
      "Kotlin Coroutines",
      "NotificationCompat",
      "Bitmap",
      "ContentResolver"
    ],
  ),
];
