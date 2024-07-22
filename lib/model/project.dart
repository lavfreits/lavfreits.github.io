class Project {
  final String title;
  final String description;
  final List<String> imageUrl;
  final String repoUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.repoUrl,
  });
}

List<Project> projects = [
  Project(
    title: "Donut Store",
    description:
        "Donut Store UI é um app Flutter para uma loja de donuts com uma interface simples e recursos de gerenciamento de estado usando Provider e Firebase Cloud Firestore para favoritos. Permite explorar e favoritar produtos, adicionar itens ao carrinho e sincronizar dados. Inclui uma página de lista de produtos para futuras adições. Clone, configure o Firebase e execute para testar.",
    imageUrl: [
      "https://github.com/lavfreits/donut_store_ui/blob/master/home.png",
      "https://github.com/lavfreits/donut_store_ui/blob/master/favorites_page.png"
    ],
    repoUrl: "https://github.com/lavfreits/donut_store_ui",
  ),
  Project(
    title: "Projeto 2",
    description: "Descrição do Projeto 2.",
    imageUrl: [
      "https://github.com/lavfreits/donut_store_ui/blob/master/favorites_page.png"
    ],
    repoUrl:
        "https://github.com/lavfreits/donut_store_ui/blob/master/favorites_page.png",
  ),
];
