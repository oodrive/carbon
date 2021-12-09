// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translation {
  Translation();

  static Translation? _current;

  static Translation get current {
    assert(_current != null,
        'No instance of Translation was loaded. Try to initialize the Translation delegate before accessing Translation.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translation> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translation();
      Translation._current = instance;

      return instance;
    });
  }

  static Translation of(BuildContext context) {
    final instance = Translation.maybeOf(context);
    assert(instance != null,
        'No instance of Translation present in the widget tree. Did you add Translation.delegate in localizationsDelegates?');
    return instance!;
  }

  static Translation? maybeOf(BuildContext context) {
    return Localizations.of<Translation>(context, Translation);
  }

  /// `Vos organisations`
  String get yourOrganizationsTitle {
    return Intl.message(
      'Vos organisations',
      name: 'yourOrganizationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Télécharger les données`
  String get exportData {
    return Intl.message(
      'Télécharger les données',
      name: 'exportData',
      desc: '',
      args: [],
    );
  }

  /// `Erreur pendant l'importation`
  String get exportDataError {
    return Intl.message(
      'Erreur pendant l\'importation',
      name: 'exportDataError',
      desc: '',
      args: [],
    );
  }

  /// `Importer des données`
  String get importData {
    return Intl.message(
      'Importer des données',
      name: 'importData',
      desc: '',
      args: [],
    );
  }

  /// `A propos de ce projet`
  String get about {
    return Intl.message(
      'A propos de ce projet',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Ce projet est complètement ouvert et open-source, vous pouvez aider à son développement en allant [ici](https://github.com/oodrive/carbon).\n\nIcones faites par [ultimatearm](https://www.flaticon.com/authors/ultimatearm) et [FreePik](https://www.freepik.com) de [Flaticon](https://www.flaticon.com/).`
  String get aboutDescription {
    return Intl.message(
      'Ce projet est complètement ouvert et open-source, vous pouvez aider à son développement en allant [ici](https://github.com/oodrive/carbon).\n\nIcones faites par [ultimatearm](https://www.flaticon.com/authors/ultimatearm) et [FreePik](https://www.freepik.com) de [Flaticon](https://www.flaticon.com/).',
      name: 'aboutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Créer une nouvelle organisation`
  String get createOrganizationTitle {
    return Intl.message(
      'Créer une nouvelle organisation',
      name: 'createOrganizationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nom`
  String get name {
    return Intl.message(
      'Nom',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Merci de renseigner un nom`
  String get nameError {
    return Intl.message(
      'Merci de renseigner un nom',
      name: 'nameError',
      desc: '',
      args: [],
    );
  }

  /// `Année`
  String get year {
    return Intl.message(
      'Année',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Merci de renseigner une année correcte`
  String get yearError {
    return Intl.message(
      'Merci de renseigner une année correcte',
      name: 'yearError',
      desc: '',
      args: [],
    );
  }

  /// `Pourquoi réduire ses émissions de gaz à effet de serre (GES) ?`
  String get whyReduceFootprintTitle {
    return Intl.message(
      'Pourquoi réduire ses émissions de gaz à effet de serre (GES) ?',
      name: 'whyReduceFootprintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nous avons déjà gagné **+1°C** (en moyenne) par rapport aux niveaux préindustriels, avec une augmentation déjà visible du nombre de vagues de chaleur, de sécheresses, d'incendies ou de cyclones. Malgré ce que disent certains climatosceptiques, les scientifiques [sont sûrs à plus de 95%](https://climate.nasa.gov/evidence/) que cela est dû aux émissions de GES provenant des activités humaines (CO₂, CH₄, N₂O). La nature ne peut absorber une telle quantité de GES et, comme si cela ne suffisait pas, nous ne cessons d’en ajouter chaque année davantage dans l’atmosphère.\n- En atteignant **+2°C** d'ici 2100, [nous subirons certainement](https://www.wwf.org.uk/updates/our-warming-world-how-much-difference-will-half-degree-really-make) une perte majeure de notre biodiversité (-18% d'insectes, -16% de plantes, -8% de vertébrés, -99% des coraux), 49 millions de personnes devraient être touchées par la hausse du niveau de la mer et 410 millions de personnes risque de souffrir de grave sécheresses, conduisant certainement à une émigration massive et à des instabilités financières et politiques.\n- À **+4°C** les humains ne pourront plus vivre autour de l'équateur [en raison de chaleurs mortelles](http://www.uhm.hawaii.edu/news/article.php?aId=8657), des milliards de personnes vont émigrer dans d'autres régions et entraineront un risque très élevé de famines ou de guerres, avec des millions ou milliards de morts potentiels.\n\n  ![](resource:assets/dead_zones_4deg.webp)\n- **+6°C** est la même différence de température moyenne entre le dernier **âge de glace** et le **20e siècle**, les conséquences seraient inimaginables.`
  String get whyReduceFootprintDescription {
    return Intl.message(
      'Nous avons déjà gagné **+1°C** (en moyenne) par rapport aux niveaux préindustriels, avec une augmentation déjà visible du nombre de vagues de chaleur, de sécheresses, d\'incendies ou de cyclones. Malgré ce que disent certains climatosceptiques, les scientifiques [sont sûrs à plus de 95%](https://climate.nasa.gov/evidence/) que cela est dû aux émissions de GES provenant des activités humaines (CO₂, CH₄, N₂O). La nature ne peut absorber une telle quantité de GES et, comme si cela ne suffisait pas, nous ne cessons d’en ajouter chaque année davantage dans l’atmosphère.\n- En atteignant **+2°C** d\'ici 2100, [nous subirons certainement](https://www.wwf.org.uk/updates/our-warming-world-how-much-difference-will-half-degree-really-make) une perte majeure de notre biodiversité (-18% d\'insectes, -16% de plantes, -8% de vertébrés, -99% des coraux), 49 millions de personnes devraient être touchées par la hausse du niveau de la mer et 410 millions de personnes risque de souffrir de grave sécheresses, conduisant certainement à une émigration massive et à des instabilités financières et politiques.\n- À **+4°C** les humains ne pourront plus vivre autour de l\'équateur [en raison de chaleurs mortelles](http://www.uhm.hawaii.edu/news/article.php?aId=8657), des milliards de personnes vont émigrer dans d\'autres régions et entraineront un risque très élevé de famines ou de guerres, avec des millions ou milliards de morts potentiels.\n\n  ![](resource:assets/dead_zones_4deg.webp)\n- **+6°C** est la même différence de température moyenne entre le dernier **âge de glace** et le **20e siècle**, les conséquences seraient inimaginables.',
      name: 'whyReduceFootprintDescription',
      desc: '',
      args: [],
    );
  }

  /// `Quel est l'effort à faire ?`
  String get neededEffortTitle {
    return Intl.message(
      'Quel est l\'effort à faire ?',
      name: 'neededEffortTitle',
      desc: '',
      args: [],
    );
  }

  /// `Les hommes doivent donc limiter le réchauffement à **+1,5°C** en réduisant les émissions de GES de **15% par an**. Il est donc vital pour chaque organisation de calculer ses émissions annuelles de GES et d'en planifier la réduction.\n\nCet outil vous permet de calculer vos émissions de GES (exprimées ici en tonnes de CO₂-équivalent, ou tCO₂e, afin d'avoir une seule unité de mesure) et recense quelques pistes connues pour faire baisser vos émissions.`
  String get neededEffortDescription {
    return Intl.message(
      'Les hommes doivent donc limiter le réchauffement à **+1,5°C** en réduisant les émissions de GES de **15% par an**. Il est donc vital pour chaque organisation de calculer ses émissions annuelles de GES et d\'en planifier la réduction.\n\nCet outil vous permet de calculer vos émissions de GES (exprimées ici en tonnes de CO₂-équivalent, ou tCO₂e, afin d\'avoir une seule unité de mesure) et recense quelques pistes connues pour faire baisser vos émissions.',
      name: 'neededEffortDescription',
      desc: '',
      args: [],
    );
  }

  /// `Est-ce que mes données sont sécurisés ?`
  String get dataConfidentialityTitle {
    return Intl.message(
      'Est-ce que mes données sont sécurisés ?',
      name: 'dataConfidentialityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toutes les données que vous rentrez sont traitées sur votre poste et rien n'est envoyé par le réseau, vos données restent donc parfaitement confidentielles. Cela veut également dire qu'il vous faut récupérer et sauvegarder vos données via la fonction d'export si vous souhaitez changer d'ordinateur ou partager les données.\n\nComme cet outil est complètement ouvert, vous pouvez vérifier son comportement en regardant son code-source [ici](https://github.com/oodrive/carbon).`
  String get dataConfidentialityDescription {
    return Intl.message(
      'Toutes les données que vous rentrez sont traitées sur votre poste et rien n\'est envoyé par le réseau, vos données restent donc parfaitement confidentielles. Cela veut également dire qu\'il vous faut récupérer et sauvegarder vos données via la fonction d\'export si vous souhaitez changer d\'ordinateur ou partager les données.\n\nComme cet outil est complètement ouvert, vous pouvez vérifier son comportement en regardant son code-source [ici](https://github.com/oodrive/carbon).',
      name: 'dataConfidentialityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Vos sites`
  String get yourSitesTitle {
    return Intl.message(
      'Vos sites',
      name: 'yourSitesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Comment réduire son empreinte carbone ?`
  String get howToReduceFootprint {
    return Intl.message(
      'Comment réduire son empreinte carbone ?',
      name: 'howToReduceFootprint',
      desc: '',
      args: [],
    );
  }

  /// `Voir nos conseils >`
  String get seeAdvices {
    return Intl.message(
      'Voir nos conseils >',
      name: 'seeAdvices',
      desc: '',
      args: [],
    );
  }

  /// `Désolé, mais à part faire preuve de plus de sobriété nous ne connaissons pas de solution miracle pour réduire ces émissions.`
  String get noAdvices {
    return Intl.message(
      'Désolé, mais à part faire preuve de plus de sobriété nous ne connaissons pas de solution miracle pour réduire ces émissions.',
      name: 'noAdvices',
      desc: '',
      args: [],
    );
  }

  /// `Supprimer cette organisation`
  String get deleteOrganization {
    return Intl.message(
      'Supprimer cette organisation',
      name: 'deleteOrganization',
      desc: '',
      args: [],
    );
  }

  /// `Créer un nouveau site`
  String get createSiteTitle {
    return Intl.message(
      'Créer un nouveau site',
      name: 'createSiteTitle',
      desc: '',
      args: [],
    );
  }

  /// `L'empreinte carbone totale de cette organisation`
  String get organizationFootprintTitle {
    return Intl.message(
      'L\'empreinte carbone totale de cette organisation',
      name: 'organizationFootprintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Puis-je communiquer cette estimation ?`
  String get estimationCommunicationTitle {
    return Intl.message(
      'Puis-je communiquer cette estimation ?',
      name: 'estimationCommunicationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cette estimation n'a pas pour vocation de remplacer une réelle certification par un organisme extérieur, il est en effet facile d'oublier ou de minimiser des émissions.\n\nNous vous recommandons donc d'utiliser cet outil à des fins d'analyse et non à des fins de communication.`
  String get estimationCommunicationDescription {
    return Intl.message(
      'Cette estimation n\'a pas pour vocation de remplacer une réelle certification par un organisme extérieur, il est en effet facile d\'oublier ou de minimiser des émissions.\n\nNous vous recommandons donc d\'utiliser cet outil à des fins d\'analyse et non à des fins de communication.',
      name: 'estimationCommunicationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Neutralité carbone`
  String get compensationTitle {
    return Intl.message(
      'Neutralité carbone',
      name: 'compensationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pour participer à l'effort de décarbonation mondial, l'organisation peut financer des projets qui permettront, hors de son périmètre, des évitements d'émissions (ex : remplacement d'une centrale charbon par une centrale solaire) ou de la séquestration de CO₂ (ex : préservation de forêts). Ces projets, certifiés par des organisations indépendantes telles que Gold Standard ou Verra, permettent de chiffrer les émissions évitées ou séquestrées. Ces projets sont bons pour le climat et leur financement est encouragé.\n\nAttention cependant à [ne pas utiliser](https://www.ademe.fr/sites/default/files/assets/documents/avis-ademe-neutralite-carbone-2021.pdf) ces contributions, souvent peu onéreuses, pour déclarer l'organisation "neutre en carbone". La neutralité climatique (équilibre entre les émissions de CO₂ et l'absorbtion de CO₂ par les puits de carbone) n'a de sens qu'à l'échelle mondiale et la priorité absolue pour y arriver est de réduire ses propres émissions (à hauteur de 15% par an pour limiter le réchauffement à 1,5°C).`
  String get compensationDescription {
    return Intl.message(
      'Pour participer à l\'effort de décarbonation mondial, l\'organisation peut financer des projets qui permettront, hors de son périmètre, des évitements d\'émissions (ex : remplacement d\'une centrale charbon par une centrale solaire) ou de la séquestration de CO₂ (ex : préservation de forêts). Ces projets, certifiés par des organisations indépendantes telles que Gold Standard ou Verra, permettent de chiffrer les émissions évitées ou séquestrées. Ces projets sont bons pour le climat et leur financement est encouragé.\n\nAttention cependant à [ne pas utiliser](https://www.ademe.fr/sites/default/files/assets/documents/avis-ademe-neutralite-carbone-2021.pdf) ces contributions, souvent peu onéreuses, pour déclarer l\'organisation "neutre en carbone". La neutralité climatique (équilibre entre les émissions de CO₂ et l\'absorbtion de CO₂ par les puits de carbone) n\'a de sens qu\'à l\'échelle mondiale et la priorité absolue pour y arriver est de réduire ses propres émissions (à hauteur de 15% par an pour limiter le réchauffement à 1,5°C).',
      name: 'compensationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Les scopes de ce site`
  String get siteScopesTitle {
    return Intl.message(
      'Les scopes de ce site',
      name: 'siteScopesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Supprimer ce site`
  String get deleteSite {
    return Intl.message(
      'Supprimer ce site',
      name: 'deleteSite',
      desc: '',
      args: [],
    );
  }

  /// `L'empreinte carbone de ce site`
  String get siteFootprintTitle {
    return Intl.message(
      'L\'empreinte carbone de ce site',
      name: 'siteFootprintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pourquoi cette séparation en 3 scopes ?`
  String get scopesExplanationTitle {
    return Intl.message(
      'Pourquoi cette séparation en 3 scopes ?',
      name: 'scopesExplanationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cette séparation suit les conventions du [Greenhouse Gas Protocol](https://ghgprotocol.org/) et ISO 14064-1, qui sont maintenant universellement utilisés.\n\n- Le scope 1 regroupe toutes les émissions directes de GES liées au fonctionnement de l'organisation et à la fabrication des produits, par exemple via la combustion de gaz ou l'utilisation d'essence.\n- Le scope 2 regroupe les émissions indirectes liées à la consommation d'énergie. L'utilisation d'électricité ne dégage aucun GES, mais sa production oui. Nous parlons donc d'émissions indirectes.\n- Le scope 3 regroupe toutes les autres émissions indirectes, que ce soit en amont (ex : transport des matières premières, voyages professionnels, …) ou en aval (utilisation et fin de vie des produits).`
  String get scopesExplanationDescription {
    return Intl.message(
      'Cette séparation suit les conventions du [Greenhouse Gas Protocol](https://ghgprotocol.org/) et ISO 14064-1, qui sont maintenant universellement utilisés.\n\n- Le scope 1 regroupe toutes les émissions directes de GES liées au fonctionnement de l\'organisation et à la fabrication des produits, par exemple via la combustion de gaz ou l\'utilisation d\'essence.\n- Le scope 2 regroupe les émissions indirectes liées à la consommation d\'énergie. L\'utilisation d\'électricité ne dégage aucun GES, mais sa production oui. Nous parlons donc d\'émissions indirectes.\n- Le scope 3 regroupe toutes les autres émissions indirectes, que ce soit en amont (ex : transport des matières premières, voyages professionnels, …) ou en aval (utilisation et fin de vie des produits).',
      name: 'scopesExplanationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Les émissions de ce scope`
  String get scopeCriteriaTitle {
    return Intl.message(
      'Les émissions de ce scope',
      name: 'scopeCriteriaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scope {number}`
  String scopeNumber(Object number) {
    return Intl.message(
      'Scope $number',
      name: 'scopeNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Emissions directes`
  String get scope1Description {
    return Intl.message(
      'Emissions directes',
      name: 'scope1Description',
      desc: '',
      args: [],
    );
  }

  /// `Emissions indirectes - energies`
  String get scope2Description {
    return Intl.message(
      'Emissions indirectes - energies',
      name: 'scope2Description',
      desc: '',
      args: [],
    );
  }

  /// `Emissions indirectes - autres`
  String get scope3Description {
    return Intl.message(
      'Emissions indirectes - autres',
      name: 'scope3Description',
      desc: '',
      args: [],
    );
  }

  /// `Type :`
  String get criteriaType {
    return Intl.message(
      'Type :',
      name: 'criteriaType',
      desc: '',
      args: [],
    );
  }

  /// `{kgCO2e} kgCO₂e/unité ({source})`
  String criteriaSource(Object kgCO2e, Object source) {
    return Intl.message(
      '$kgCO2e kgCO₂e/unité ($source)',
      name: 'criteriaSource',
      desc: '',
      args: [kgCO2e, source],
    );
  }

  /// `Quantité`
  String get criteriaQuantity {
    return Intl.message(
      'Quantité',
      name: 'criteriaQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Vous devez renseigner une quantité correcte`
  String get criteriaQuantityError {
    return Intl.message(
      'Vous devez renseigner une quantité correcte',
      name: 'criteriaQuantityError',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get criteriaNote {
    return Intl.message(
      'Note',
      name: 'criteriaNote',
      desc: '',
      args: [],
    );
  }

  /// `Coefficient d'ajustment`
  String get criteriaAdjustmentCoefficient {
    return Intl.message(
      'Coefficient d\'ajustment',
      name: 'criteriaAdjustmentCoefficient',
      desc: '',
      args: [],
    );
  }

  /// `Durée d'amortissement (en années)`
  String get criteriaAmortizationPeriod {
    return Intl.message(
      'Durée d\'amortissement (en années)',
      name: 'criteriaAmortizationPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Durée trop faible par rapport à sa date d'achat.`
  String get criteriaAmortizationPeriodError {
    return Intl.message(
      'Durée trop faible par rapport à sa date d\'achat.',
      name: 'criteriaAmortizationPeriodError',
      desc: '',
      args: [],
    );
  }

  /// `Génération de chaleur`
  String get heatGenerationTitle {
    return Intl.message(
      'Génération de chaleur',
      name: 'heatGenerationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Energie utilisée pour chauffer les bâtiments de l'organisation via de la combustion (c.-à-d. hors électricité, principalement gaz, fioul).\n\nDocuments nécessaires : factures annuelles de gaz, fioul à rechercher auprès des services généraux.`
  String get heatGenerationDesc {
    return Intl.message(
      'Energie utilisée pour chauffer les bâtiments de l\'organisation via de la combustion (c.-à-d. hors électricité, principalement gaz, fioul).\n\nDocuments nécessaires : factures annuelles de gaz, fioul à rechercher auprès des services généraux.',
      name: 'heatGenerationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Pour le chauffage des bâtiments, il est possible de jouer sur plusieurs facteurs :\n1. Baisser sa consommation énergétique en améliorant [l'isolation des bâtiments](https://conseils-thermiques.org/contenu/comparatif_isolants.php).\n2. Utiliser une énergie moins carbonée :\n   - Changer de système de chauffage pour passer [à la pompe à chaleur](http://www.carbone4.com/analyse-chaudieres-gaz-climat/).\n   - Changer de fournisseur ou d'offre de gaz pour favoriser le [biométhane](http://www.carbone4.com/wp-content/uploads/2019/06/Publication-Carbone-4-biome%CC%81thane-et-climat.pdf). Attention tout de même car, comme pour l'électricité, le système de Garanties d'Origine est [très critiqué](https://www.youtube.com/watch?v=goceQuwWwKA&t=895s) pour son inefficacité, il est fortement probable qu'un grand nombre d'offres dites "vertes" n'aient que peu d'impact réel pour l'instant, mais pourraient être bénéfiques à moyen ou long terme.`
  String get heatGenerationAdvice {
    return Intl.message(
      'Pour le chauffage des bâtiments, il est possible de jouer sur plusieurs facteurs :\n1. Baisser sa consommation énergétique en améliorant [l\'isolation des bâtiments](https://conseils-thermiques.org/contenu/comparatif_isolants.php).\n2. Utiliser une énergie moins carbonée :\n   - Changer de système de chauffage pour passer [à la pompe à chaleur](http://www.carbone4.com/analyse-chaudieres-gaz-climat/).\n   - Changer de fournisseur ou d\'offre de gaz pour favoriser le [biométhane](http://www.carbone4.com/wp-content/uploads/2019/06/Publication-Carbone-4-biome%CC%81thane-et-climat.pdf). Attention tout de même car, comme pour l\'électricité, le système de Garanties d\'Origine est [très critiqué](https://www.youtube.com/watch?v=goceQuwWwKA&t=895s) pour son inefficacité, il est fortement probable qu\'un grand nombre d\'offres dites "vertes" n\'aient que peu d\'impact réel pour l\'instant, mais pourraient être bénéfiques à moyen ou long terme.',
      name: 'heatGenerationAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Gaz naturel`
  String get naturalGas {
    return Intl.message(
      'Gaz naturel',
      name: 'naturalGas',
      desc: '',
      args: [],
    );
  }

  /// `Biométhane`
  String get bioGas {
    return Intl.message(
      'Biométhane',
      name: 'bioGas',
      desc: '',
      args: [],
    );
  }

  /// `Fioul domestique`
  String get fuelOil {
    return Intl.message(
      'Fioul domestique',
      name: 'fuelOil',
      desc: '',
      args: [],
    );
  }

  /// `Bois bûche`
  String get firewood {
    return Intl.message(
      'Bois bûche',
      name: 'firewood',
      desc: '',
      args: [],
    );
  }

  /// `Achat d'électricité`
  String get electricityPurchaseTitle {
    return Intl.message(
      'Achat d\'électricité',
      name: 'electricityPurchaseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toute l'électricité achetée (et donc consommée) par l'organisation.\n\nSource : factures annuelles d'électricité à rechercher auprès des services généraux.`
  String get electricityPurchaseDesc {
    return Intl.message(
      'Toute l\'électricité achetée (et donc consommée) par l\'organisation.\n\nSource : factures annuelles d\'électricité à rechercher auprès des services généraux.',
      name: 'electricityPurchaseDesc',
      desc: '',
      args: [],
    );
  }

  /// `En France l'électricité est dans l'ensemble décarbonée, le seul moyen de vraiment réduire son impact est de réduire sa consommation.\n\nCependant, si l'organisation possède des bureaux dans un pays où l'électricité est fortement carbonée ou si vous souhaitez réduire au maximum ses émissions, vous pouvez choisir un fournisseur d'électricité dont le facteur d'émission est inférieur à celui du mix énergétique moyen. Attention tout de même car, comme pour le gaz, le système de Garanties d'Origine est [très critiqué](https://www.youtube.com/watch?v=goceQuwWwKA&t=895s) pour son inefficacité, il est fortement probable qu'un grand nombre d'offres dites "vertes" n'aient que peu d'impact réel pour l'instant, mais pourraient être bénéfiques à moyen ou long terme.`
  String get electricityPurchaseAdvice {
    return Intl.message(
      'En France l\'électricité est dans l\'ensemble décarbonée, le seul moyen de vraiment réduire son impact est de réduire sa consommation.\n\nCependant, si l\'organisation possède des bureaux dans un pays où l\'électricité est fortement carbonée ou si vous souhaitez réduire au maximum ses émissions, vous pouvez choisir un fournisseur d\'électricité dont le facteur d\'émission est inférieur à celui du mix énergétique moyen. Attention tout de même car, comme pour le gaz, le système de Garanties d\'Origine est [très critiqué](https://www.youtube.com/watch?v=goceQuwWwKA&t=895s) pour son inefficacité, il est fortement probable qu\'un grand nombre d\'offres dites "vertes" n\'aient que peu d\'impact réel pour l\'instant, mais pourraient être bénéfiques à moyen ou long terme.',
      name: 'electricityPurchaseAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get ownedTransportTitle {
    return Intl.message(
      'Transport',
      name: 'ownedTransportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Via un véhicules possédé par l'organisation ou en location longue durée (leasing).`
  String get ownedTransportDesc {
    return Intl.message(
      'Via un véhicules possédé par l\'organisation ou en location longue durée (leasing).',
      name: 'ownedTransportDesc',
      desc: '',
      args: [],
    );
  }

  /// `Pour réduire les émissions de CO₂ liées à la flotte de véhicules de l'organisation :\n- Moins utiliser les véhicules en question et privilégier les transports en commun.\n- Utiliser des [voitures électriques](http://www.carbone4.com/wp-content/uploads/2020/12/Motorisations-Alternatives-Executive-Summary-VP-1-1.pdf) de petite taille.`
  String get ownedTransportAdvice {
    return Intl.message(
      'Pour réduire les émissions de CO₂ liées à la flotte de véhicules de l\'organisation :\n- Moins utiliser les véhicules en question et privilégier les transports en commun.\n- Utiliser des [voitures électriques](http://www.carbone4.com/wp-content/uploads/2020/12/Motorisations-Alternatives-Executive-Summary-VP-1-1.pdf) de petite taille.',
      name: 'ownedTransportAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Distance en voiture à moteur thermique`
  String get carDistance {
    return Intl.message(
      'Distance en voiture à moteur thermique',
      name: 'carDistance',
      desc: '',
      args: [],
    );
  }

  /// `Distance en voiture électrique`
  String get electricCarDistance {
    return Intl.message(
      'Distance en voiture électrique',
      name: 'electricCarDistance',
      desc: '',
      args: [],
    );
  }

  /// `Distance en 2-roues à moteur thermique`
  String get motorbikeDistance {
    return Intl.message(
      'Distance en 2-roues à moteur thermique',
      name: 'motorbikeDistance',
      desc: '',
      args: [],
    );
  }

  /// `Essence E85`
  String get petrol {
    return Intl.message(
      'Essence E85',
      name: 'petrol',
      desc: '',
      args: [],
    );
  }

  /// `Gazole E30`
  String get diesel {
    return Intl.message(
      'Gazole E30',
      name: 'diesel',
      desc: '',
      args: [],
    );
  }

  /// `GPL`
  String get lpg {
    return Intl.message(
      'GPL',
      name: 'lpg',
      desc: '',
      args: [],
    );
  }

  /// `Production d'électricité`
  String get electricityProductionTitle {
    return Intl.message(
      'Production d\'électricité',
      name: 'electricityProductionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Energie utilisée pour générer de l'électricité à partir de la combustion (ex : gaz, bois).`
  String get electricityProductionDesc {
    return Intl.message(
      'Energie utilisée pour générer de l\'électricité à partir de la combustion (ex : gaz, bois).',
      name: 'electricityProductionDesc',
      desc: '',
      args: [],
    );
  }

  /// `France continentale`
  String get countryFrance {
    return Intl.message(
      'France continentale',
      name: 'countryFrance',
      desc: '',
      args: [],
    );
  }

  /// `Afrique du Sud`
  String get countrySouthAfrica {
    return Intl.message(
      'Afrique du Sud',
      name: 'countrySouthAfrica',
      desc: '',
      args: [],
    );
  }

  /// `Albanie`
  String get countryAlbania {
    return Intl.message(
      'Albanie',
      name: 'countryAlbania',
      desc: '',
      args: [],
    );
  }

  /// `Algérie`
  String get countryAlgeria {
    return Intl.message(
      'Algérie',
      name: 'countryAlgeria',
      desc: '',
      args: [],
    );
  }

  /// `Allemagne`
  String get countryGermany {
    return Intl.message(
      'Allemagne',
      name: 'countryGermany',
      desc: '',
      args: [],
    );
  }

  /// `Angola`
  String get countryAngola {
    return Intl.message(
      'Angola',
      name: 'countryAngola',
      desc: '',
      args: [],
    );
  }

  /// `Antilles Néerlandaises`
  String get countryNetherlandsAntilles {
    return Intl.message(
      'Antilles Néerlandaises',
      name: 'countryNetherlandsAntilles',
      desc: '',
      args: [],
    );
  }

  /// `Arabie Saoudite`
  String get countrySaudiArabia {
    return Intl.message(
      'Arabie Saoudite',
      name: 'countrySaudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `Argentine`
  String get countryArgentina {
    return Intl.message(
      'Argentine',
      name: 'countryArgentina',
      desc: '',
      args: [],
    );
  }

  /// `Arménie`
  String get countryArmenia {
    return Intl.message(
      'Arménie',
      name: 'countryArmenia',
      desc: '',
      args: [],
    );
  }

  /// `Australie`
  String get countryAustralia {
    return Intl.message(
      'Australie',
      name: 'countryAustralia',
      desc: '',
      args: [],
    );
  }

  /// `Autriche`
  String get countryAustria {
    return Intl.message(
      'Autriche',
      name: 'countryAustria',
      desc: '',
      args: [],
    );
  }

  /// `Azerbaïdjan`
  String get countryAzerbaijan {
    return Intl.message(
      'Azerbaïdjan',
      name: 'countryAzerbaijan',
      desc: '',
      args: [],
    );
  }

  /// `Bahreïn`
  String get countryBahrain {
    return Intl.message(
      'Bahreïn',
      name: 'countryBahrain',
      desc: '',
      args: [],
    );
  }

  /// `Bangladesh`
  String get countryBangladesh {
    return Intl.message(
      'Bangladesh',
      name: 'countryBangladesh',
      desc: '',
      args: [],
    );
  }

  /// `Bélarus`
  String get countryBelarus {
    return Intl.message(
      'Bélarus',
      name: 'countryBelarus',
      desc: '',
      args: [],
    );
  }

  /// `Belgique`
  String get countryBelgium {
    return Intl.message(
      'Belgique',
      name: 'countryBelgium',
      desc: '',
      args: [],
    );
  }

  /// `Bénin`
  String get countryBenin {
    return Intl.message(
      'Bénin',
      name: 'countryBenin',
      desc: '',
      args: [],
    );
  }

  /// `Birmanie`
  String get countryMyanmar {
    return Intl.message(
      'Birmanie',
      name: 'countryMyanmar',
      desc: '',
      args: [],
    );
  }

  /// `Bolivie`
  String get countryBolivia {
    return Intl.message(
      'Bolivie',
      name: 'countryBolivia',
      desc: '',
      args: [],
    );
  }

  /// `Bosnie-Herzégovine`
  String get countryBosniaandHerzegovina {
    return Intl.message(
      'Bosnie-Herzégovine',
      name: 'countryBosniaandHerzegovina',
      desc: '',
      args: [],
    );
  }

  /// `Botswana`
  String get countryBotswana {
    return Intl.message(
      'Botswana',
      name: 'countryBotswana',
      desc: '',
      args: [],
    );
  }

  /// `Brésil`
  String get countryBrazil {
    return Intl.message(
      'Brésil',
      name: 'countryBrazil',
      desc: '',
      args: [],
    );
  }

  /// `Brunéi Darussalam`
  String get countryBruneiDarussalam {
    return Intl.message(
      'Brunéi Darussalam',
      name: 'countryBruneiDarussalam',
      desc: '',
      args: [],
    );
  }

  /// `Bulgarie`
  String get countryBulgaria {
    return Intl.message(
      'Bulgarie',
      name: 'countryBulgaria',
      desc: '',
      args: [],
    );
  }

  /// `Cambodge`
  String get countryCambodia {
    return Intl.message(
      'Cambodge',
      name: 'countryCambodia',
      desc: '',
      args: [],
    );
  }

  /// `Cameroun`
  String get countryCameroon {
    return Intl.message(
      'Cameroun',
      name: 'countryCameroon',
      desc: '',
      args: [],
    );
  }

  /// `Canada`
  String get countryCanada {
    return Intl.message(
      'Canada',
      name: 'countryCanada',
      desc: '',
      args: [],
    );
  }

  /// `Chili`
  String get countryChile {
    return Intl.message(
      'Chili',
      name: 'countryChile',
      desc: '',
      args: [],
    );
  }

  /// `Chine`
  String get countryChina {
    return Intl.message(
      'Chine',
      name: 'countryChina',
      desc: '',
      args: [],
    );
  }

  /// `Chypre`
  String get countryCyprus {
    return Intl.message(
      'Chypre',
      name: 'countryCyprus',
      desc: '',
      args: [],
    );
  }

  /// `Colombie`
  String get countryColombia {
    return Intl.message(
      'Colombie',
      name: 'countryColombia',
      desc: '',
      args: [],
    );
  }

  /// `Congo`
  String get countryCongo {
    return Intl.message(
      'Congo',
      name: 'countryCongo',
      desc: '',
      args: [],
    );
  }

  /// `Corée du nord`
  String get countryDPRofKoreanorth {
    return Intl.message(
      'Corée du nord',
      name: 'countryDPRofKoreanorth',
      desc: '',
      args: [],
    );
  }

  /// `Corée du sud`
  String get countrySouthKorea {
    return Intl.message(
      'Corée du sud',
      name: 'countrySouthKorea',
      desc: '',
      args: [],
    );
  }

  /// `Costa rica`
  String get countryCostaRica {
    return Intl.message(
      'Costa rica',
      name: 'countryCostaRica',
      desc: '',
      args: [],
    );
  }

  /// `Côte d'Ivoire`
  String get countryCotedIvoire {
    return Intl.message(
      'Côte d\'Ivoire',
      name: 'countryCotedIvoire',
      desc: '',
      args: [],
    );
  }

  /// `Croatie`
  String get countryCroatia {
    return Intl.message(
      'Croatie',
      name: 'countryCroatia',
      desc: '',
      args: [],
    );
  }

  /// `Cuba`
  String get countryCuba {
    return Intl.message(
      'Cuba',
      name: 'countryCuba',
      desc: '',
      args: [],
    );
  }

  /// `Danemark`
  String get countryDenmark {
    return Intl.message(
      'Danemark',
      name: 'countryDenmark',
      desc: '',
      args: [],
    );
  }

  /// `République Dominicaine`
  String get countryDominicanRepublic {
    return Intl.message(
      'République Dominicaine',
      name: 'countryDominicanRepublic',
      desc: '',
      args: [],
    );
  }

  /// `Égypte`
  String get countryEgypt {
    return Intl.message(
      'Égypte',
      name: 'countryEgypt',
      desc: '',
      args: [],
    );
  }

  /// `Salvador`
  String get countryElSalvador {
    return Intl.message(
      'Salvador',
      name: 'countryElSalvador',
      desc: '',
      args: [],
    );
  }

  /// `Émirats Arabes Unis`
  String get countryUnitedArabEmirates {
    return Intl.message(
      'Émirats Arabes Unis',
      name: 'countryUnitedArabEmirates',
      desc: '',
      args: [],
    );
  }

  /// `Équateur`
  String get countryEcuador {
    return Intl.message(
      'Équateur',
      name: 'countryEcuador',
      desc: '',
      args: [],
    );
  }

  /// `Érythrée`
  String get countryEritrea {
    return Intl.message(
      'Érythrée',
      name: 'countryEritrea',
      desc: '',
      args: [],
    );
  }

  /// `Espagne`
  String get countrySpain {
    return Intl.message(
      'Espagne',
      name: 'countrySpain',
      desc: '',
      args: [],
    );
  }

  /// `Estonie`
  String get countryEstonia {
    return Intl.message(
      'Estonie',
      name: 'countryEstonia',
      desc: '',
      args: [],
    );
  }

  /// `États-Unis`
  String get countryUnitedStates {
    return Intl.message(
      'États-Unis',
      name: 'countryUnitedStates',
      desc: '',
      args: [],
    );
  }

  /// `Éthiopie`
  String get countryEthiopia {
    return Intl.message(
      'Éthiopie',
      name: 'countryEthiopia',
      desc: '',
      args: [],
    );
  }

  /// `Finlande`
  String get countryFinland {
    return Intl.message(
      'Finlande',
      name: 'countryFinland',
      desc: '',
      args: [],
    );
  }

  /// `Syrie`
  String get countrySyrianArabRepublic {
    return Intl.message(
      'Syrie',
      name: 'countrySyrianArabRepublic',
      desc: '',
      args: [],
    );
  }

  /// `Gabon`
  String get countryGabon {
    return Intl.message(
      'Gabon',
      name: 'countryGabon',
      desc: '',
      args: [],
    );
  }

  /// `Géorgie`
  String get countryGeorgia {
    return Intl.message(
      'Géorgie',
      name: 'countryGeorgia',
      desc: '',
      args: [],
    );
  }

  /// `Ghana`
  String get countryGhana {
    return Intl.message(
      'Ghana',
      name: 'countryGhana',
      desc: '',
      args: [],
    );
  }

  /// `Gibraltar`
  String get countryGibraltar {
    return Intl.message(
      'Gibraltar',
      name: 'countryGibraltar',
      desc: '',
      args: [],
    );
  }

  /// `Grèce`
  String get countryGreece {
    return Intl.message(
      'Grèce',
      name: 'countryGreece',
      desc: '',
      args: [],
    );
  }

  /// `Guatemala`
  String get countryGuatemala {
    return Intl.message(
      'Guatemala',
      name: 'countryGuatemala',
      desc: '',
      args: [],
    );
  }

  /// `Haïti`
  String get countryHaiti {
    return Intl.message(
      'Haïti',
      name: 'countryHaiti',
      desc: '',
      args: [],
    );
  }

  /// `Honduras`
  String get countryHonduras {
    return Intl.message(
      'Honduras',
      name: 'countryHonduras',
      desc: '',
      args: [],
    );
  }

  /// `Hongrie`
  String get countryHungary {
    return Intl.message(
      'Hongrie',
      name: 'countryHungary',
      desc: '',
      args: [],
    );
  }

  /// `Inde`
  String get countryIndia {
    return Intl.message(
      'Inde',
      name: 'countryIndia',
      desc: '',
      args: [],
    );
  }

  /// `Indonésie`
  String get countryIndonesia {
    return Intl.message(
      'Indonésie',
      name: 'countryIndonesia',
      desc: '',
      args: [],
    );
  }

  /// `Iraq`
  String get countryIraq {
    return Intl.message(
      'Iraq',
      name: 'countryIraq',
      desc: '',
      args: [],
    );
  }

  /// `Irlande`
  String get countryIreland {
    return Intl.message(
      'Irlande',
      name: 'countryIreland',
      desc: '',
      args: [],
    );
  }

  /// `Islande`
  String get countryIceland {
    return Intl.message(
      'Islande',
      name: 'countryIceland',
      desc: '',
      args: [],
    );
  }

  /// `Israël`
  String get countryIsrael {
    return Intl.message(
      'Israël',
      name: 'countryIsrael',
      desc: '',
      args: [],
    );
  }

  /// `Italie`
  String get countryItaly {
    return Intl.message(
      'Italie',
      name: 'countryItaly',
      desc: '',
      args: [],
    );
  }

  /// `Jamaïque`
  String get countryJamaica {
    return Intl.message(
      'Jamaïque',
      name: 'countryJamaica',
      desc: '',
      args: [],
    );
  }

  /// `Japon`
  String get countryJapan {
    return Intl.message(
      'Japon',
      name: 'countryJapan',
      desc: '',
      args: [],
    );
  }

  /// `Jordanie`
  String get countryJordan {
    return Intl.message(
      'Jordanie',
      name: 'countryJordan',
      desc: '',
      args: [],
    );
  }

  /// `Kazakstan`
  String get countryKazakhstan {
    return Intl.message(
      'Kazakstan',
      name: 'countryKazakhstan',
      desc: '',
      args: [],
    );
  }

  /// `Kenya`
  String get countryKenya {
    return Intl.message(
      'Kenya',
      name: 'countryKenya',
      desc: '',
      args: [],
    );
  }

  /// `Kirghizistan`
  String get countryKyrgyzstan {
    return Intl.message(
      'Kirghizistan',
      name: 'countryKyrgyzstan',
      desc: '',
      args: [],
    );
  }

  /// `Kosovo`
  String get countryKosovo {
    return Intl.message(
      'Kosovo',
      name: 'countryKosovo',
      desc: '',
      args: [],
    );
  }

  /// `Koweït`
  String get countryKuwait {
    return Intl.message(
      'Koweït',
      name: 'countryKuwait',
      desc: '',
      args: [],
    );
  }

  /// `Lettonie`
  String get countryLatvia {
    return Intl.message(
      'Lettonie',
      name: 'countryLatvia',
      desc: '',
      args: [],
    );
  }

  /// `Liban`
  String get countryLebanon {
    return Intl.message(
      'Liban',
      name: 'countryLebanon',
      desc: '',
      args: [],
    );
  }

  /// `Libye`
  String get countryLibya {
    return Intl.message(
      'Libye',
      name: 'countryLibya',
      desc: '',
      args: [],
    );
  }

  /// `Lituanie`
  String get countryLithuania {
    return Intl.message(
      'Lituanie',
      name: 'countryLithuania',
      desc: '',
      args: [],
    );
  }

  /// `Luxembourg`
  String get countryLuxembourg {
    return Intl.message(
      'Luxembourg',
      name: 'countryLuxembourg',
      desc: '',
      args: [],
    );
  }

  /// `Macédonie`
  String get countryFYRofMacedonia {
    return Intl.message(
      'Macédonie',
      name: 'countryFYRofMacedonia',
      desc: '',
      args: [],
    );
  }

  /// `Malaisie`
  String get countryMalaysia {
    return Intl.message(
      'Malaisie',
      name: 'countryMalaysia',
      desc: '',
      args: [],
    );
  }

  /// `Malte`
  String get countryMalta {
    return Intl.message(
      'Malte',
      name: 'countryMalta',
      desc: '',
      args: [],
    );
  }

  /// `Maroc`
  String get countryMorocco {
    return Intl.message(
      'Maroc',
      name: 'countryMorocco',
      desc: '',
      args: [],
    );
  }

  /// `Mexique`
  String get countryMexico {
    return Intl.message(
      'Mexique',
      name: 'countryMexico',
      desc: '',
      args: [],
    );
  }

  /// `Moldavie`
  String get countryRepublicofMoldova {
    return Intl.message(
      'Moldavie',
      name: 'countryRepublicofMoldova',
      desc: '',
      args: [],
    );
  }

  /// `Mongolie`
  String get countryMongolia {
    return Intl.message(
      'Mongolie',
      name: 'countryMongolia',
      desc: '',
      args: [],
    );
  }

  /// `Montenegro`
  String get countryMontenegro {
    return Intl.message(
      'Montenegro',
      name: 'countryMontenegro',
      desc: '',
      args: [],
    );
  }

  /// `Mozambique`
  String get countryMozambique {
    return Intl.message(
      'Mozambique',
      name: 'countryMozambique',
      desc: '',
      args: [],
    );
  }

  /// `Namibie`
  String get countryNamibia {
    return Intl.message(
      'Namibie',
      name: 'countryNamibia',
      desc: '',
      args: [],
    );
  }

  /// `Népal`
  String get countryNepal {
    return Intl.message(
      'Népal',
      name: 'countryNepal',
      desc: '',
      args: [],
    );
  }

  /// `Nicaragua`
  String get countryNicaragua {
    return Intl.message(
      'Nicaragua',
      name: 'countryNicaragua',
      desc: '',
      args: [],
    );
  }

  /// `Nigéria`
  String get countryNigeria {
    return Intl.message(
      'Nigéria',
      name: 'countryNigeria',
      desc: '',
      args: [],
    );
  }

  /// `Norvège`
  String get countryNorway {
    return Intl.message(
      'Norvège',
      name: 'countryNorway',
      desc: '',
      args: [],
    );
  }

  /// `Nouvelle-Zélande`
  String get countryNewZealand {
    return Intl.message(
      'Nouvelle-Zélande',
      name: 'countryNewZealand',
      desc: '',
      args: [],
    );
  }

  /// `Oman`
  String get countryOman {
    return Intl.message(
      'Oman',
      name: 'countryOman',
      desc: '',
      args: [],
    );
  }

  /// `Ouzbékistan`
  String get countryUzbekistan {
    return Intl.message(
      'Ouzbékistan',
      name: 'countryUzbekistan',
      desc: '',
      args: [],
    );
  }

  /// `Pakistan`
  String get countryPakistan {
    return Intl.message(
      'Pakistan',
      name: 'countryPakistan',
      desc: '',
      args: [],
    );
  }

  /// `Panama`
  String get countryPanama {
    return Intl.message(
      'Panama',
      name: 'countryPanama',
      desc: '',
      args: [],
    );
  }

  /// `Pays-Bas`
  String get countryNetherlands {
    return Intl.message(
      'Pays-Bas',
      name: 'countryNetherlands',
      desc: '',
      args: [],
    );
  }

  /// `Pérou`
  String get countryPeru {
    return Intl.message(
      'Pérou',
      name: 'countryPeru',
      desc: '',
      args: [],
    );
  }

  /// `Philippines`
  String get countryPhilippines {
    return Intl.message(
      'Philippines',
      name: 'countryPhilippines',
      desc: '',
      args: [],
    );
  }

  /// `Pologne`
  String get countryPoland {
    return Intl.message(
      'Pologne',
      name: 'countryPoland',
      desc: '',
      args: [],
    );
  }

  /// `Portugal`
  String get countryPortugal {
    return Intl.message(
      'Portugal',
      name: 'countryPortugal',
      desc: '',
      args: [],
    );
  }

  /// `Qatar`
  String get countryQatar {
    return Intl.message(
      'Qatar',
      name: 'countryQatar',
      desc: '',
      args: [],
    );
  }

  /// `Rép. Dém. Du Congo`
  String get countryDemRepofCongo {
    return Intl.message(
      'Rép. Dém. Du Congo',
      name: 'countryDemRepofCongo',
      desc: '',
      args: [],
    );
  }

  /// `République Tchèque`
  String get countryCzechRepublic {
    return Intl.message(
      'République Tchèque',
      name: 'countryCzechRepublic',
      desc: '',
      args: [],
    );
  }

  /// `Roumanie`
  String get countryRomania {
    return Intl.message(
      'Roumanie',
      name: 'countryRomania',
      desc: '',
      args: [],
    );
  }

  /// `Royaume-Uni`
  String get countryUnitedKingdom {
    return Intl.message(
      'Royaume-Uni',
      name: 'countryUnitedKingdom',
      desc: '',
      args: [],
    );
  }

  /// `Russie`
  String get countryRussianFederation {
    return Intl.message(
      'Russie',
      name: 'countryRussianFederation',
      desc: '',
      args: [],
    );
  }

  /// `Sénégal`
  String get countrySenegal {
    return Intl.message(
      'Sénégal',
      name: 'countrySenegal',
      desc: '',
      args: [],
    );
  }

  /// `Serbie`
  String get countrySerbia {
    return Intl.message(
      'Serbie',
      name: 'countrySerbia',
      desc: '',
      args: [],
    );
  }

  /// `Singapour`
  String get countrySingapore {
    return Intl.message(
      'Singapour',
      name: 'countrySingapore',
      desc: '',
      args: [],
    );
  }

  /// `Slovaquie`
  String get countrySlovakRepublic {
    return Intl.message(
      'Slovaquie',
      name: 'countrySlovakRepublic',
      desc: '',
      args: [],
    );
  }

  /// `Slovénie`
  String get countrySlovenia {
    return Intl.message(
      'Slovénie',
      name: 'countrySlovenia',
      desc: '',
      args: [],
    );
  }

  /// `Soudan`
  String get countrySudan {
    return Intl.message(
      'Soudan',
      name: 'countrySudan',
      desc: '',
      args: [],
    );
  }

  /// `Sri Lanka`
  String get countrySriLanka {
    return Intl.message(
      'Sri Lanka',
      name: 'countrySriLanka',
      desc: '',
      args: [],
    );
  }

  /// `Suède`
  String get countrySweden {
    return Intl.message(
      'Suède',
      name: 'countrySweden',
      desc: '',
      args: [],
    );
  }

  /// `Suisse`
  String get countrySwitzerland {
    return Intl.message(
      'Suisse',
      name: 'countrySwitzerland',
      desc: '',
      args: [],
    );
  }

  /// `Tadjikistan`
  String get countryTajikistan {
    return Intl.message(
      'Tadjikistan',
      name: 'countryTajikistan',
      desc: '',
      args: [],
    );
  }

  /// `Taïwan`
  String get countryChineseTaipei {
    return Intl.message(
      'Taïwan',
      name: 'countryChineseTaipei',
      desc: '',
      args: [],
    );
  }

  /// `Tanzanie`
  String get countryUnitedRepofTanzania {
    return Intl.message(
      'Tanzanie',
      name: 'countryUnitedRepofTanzania',
      desc: '',
      args: [],
    );
  }

  /// `Thaïlande`
  String get countryThailand {
    return Intl.message(
      'Thaïlande',
      name: 'countryThailand',
      desc: '',
      args: [],
    );
  }

  /// `Togo`
  String get countryTogo {
    return Intl.message(
      'Togo',
      name: 'countryTogo',
      desc: '',
      args: [],
    );
  }

  /// `Trinité-et-Tobago`
  String get countryTrinidadandTobago {
    return Intl.message(
      'Trinité-et-Tobago',
      name: 'countryTrinidadandTobago',
      desc: '',
      args: [],
    );
  }

  /// `Tunisie`
  String get countryTunisia {
    return Intl.message(
      'Tunisie',
      name: 'countryTunisia',
      desc: '',
      args: [],
    );
  }

  /// `Turkménistan`
  String get countryTurkmenistan {
    return Intl.message(
      'Turkménistan',
      name: 'countryTurkmenistan',
      desc: '',
      args: [],
    );
  }

  /// `Turquie`
  String get countryTurkey {
    return Intl.message(
      'Turquie',
      name: 'countryTurkey',
      desc: '',
      args: [],
    );
  }

  /// `Ukraine`
  String get countryUkraine {
    return Intl.message(
      'Ukraine',
      name: 'countryUkraine',
      desc: '',
      args: [],
    );
  }

  /// `Uruguay`
  String get countryUruguay {
    return Intl.message(
      'Uruguay',
      name: 'countryUruguay',
      desc: '',
      args: [],
    );
  }

  /// `Venezuela`
  String get countryVenezuela {
    return Intl.message(
      'Venezuela',
      name: 'countryVenezuela',
      desc: '',
      args: [],
    );
  }

  /// `Viêtnam`
  String get countryVietnam {
    return Intl.message(
      'Viêtnam',
      name: 'countryVietnam',
      desc: '',
      args: [],
    );
  }

  /// `Yémen`
  String get countryYemen {
    return Intl.message(
      'Yémen',
      name: 'countryYemen',
      desc: '',
      args: [],
    );
  }

  /// `Zambie`
  String get countryZambia {
    return Intl.message(
      'Zambie',
      name: 'countryZambia',
      desc: '',
      args: [],
    );
  }

  /// `Zimbabwe`
  String get countryZimbabwe {
    return Intl.message(
      'Zimbabwe',
      name: 'countryZimbabwe',
      desc: '',
      args: [],
    );
  }

  /// `Autre`
  String get otherCriteriaTitle {
    return Intl.message(
      'Autre',
      name: 'otherCriteriaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Concerne toute autre émission de GES dont vous connaissez explicitement sa valeur en tCO₂e.`
  String get otherCriteriaDesc {
    return Intl.message(
      'Concerne toute autre émission de GES dont vous connaissez explicitement sa valeur en tCO₂e.',
      name: 'otherCriteriaDesc',
      desc: '',
      args: [],
    );
  }

  /// `Déplacements professionnels`
  String get businessTravelTitle {
    return Intl.message(
      'Déplacements professionnels',
      name: 'businessTravelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Avec un véhicule à moteur thermique qui n'est ni possédé par l'organisation, ni en location longue durée (leasing). N'inclut pas les déplacements domicile-travail.`
  String get businessTravelDesc {
    return Intl.message(
      'Avec un véhicule à moteur thermique qui n\'est ni possédé par l\'organisation, ni en location longue durée (leasing). N\'inclut pas les déplacements domicile-travail.',
      name: 'businessTravelDesc',
      desc: '',
      args: [],
    );
  }

  /// `Afin de réduire efficacement les émissions liés aux déplacements, vous pouvez dans l'ordre :\n1. Privilégiez la visioconférence aux déplacements.\n2. Limiter les déplacements en avion au maximum.\n3. Favorisez le train quand possible, ceci étant de loin de moyen de transport le moins polluant.`
  String get businessTravelAdvice {
    return Intl.message(
      'Afin de réduire efficacement les émissions liés aux déplacements, vous pouvez dans l\'ordre :\n1. Privilégiez la visioconférence aux déplacements.\n2. Limiter les déplacements en avion au maximum.\n3. Favorisez le train quand possible, ceci étant de loin de moyen de transport le moins polluant.',
      name: 'businessTravelAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Train à grande vitesse (TGV)`
  String get tgv {
    return Intl.message(
      'Train à grande vitesse (TGV)',
      name: 'tgv',
      desc: '',
      args: [],
    );
  }

  /// `Train régional (TER)`
  String get ter {
    return Intl.message(
      'Train régional (TER)',
      name: 'ter',
      desc: '',
      args: [],
    );
  }

  /// `Train de banlieue (RER)`
  String get rer {
    return Intl.message(
      'Train de banlieue (RER)',
      name: 'rer',
      desc: '',
      args: [],
    );
  }

  /// `Métro`
  String get subway {
    return Intl.message(
      'Métro',
      name: 'subway',
      desc: '',
      args: [],
    );
  }

  /// `Avion court courrier`
  String get shortHaulPlane {
    return Intl.message(
      'Avion court courrier',
      name: 'shortHaulPlane',
      desc: '',
      args: [],
    );
  }

  /// `Avion moyen courrier`
  String get mediumHaulPlane {
    return Intl.message(
      'Avion moyen courrier',
      name: 'mediumHaulPlane',
      desc: '',
      args: [],
    );
  }

  /// `Avion long courrier`
  String get longHaulPlane {
    return Intl.message(
      'Avion long courrier',
      name: 'longHaulPlane',
      desc: '',
      args: [],
    );
  }

  /// `Avion long courrier - Première classe`
  String get premiumLongHaulPlane {
    return Intl.message(
      'Avion long courrier - Première classe',
      name: 'premiumLongHaulPlane',
      desc: '',
      args: [],
    );
  }

  /// `Taxi / VTC`
  String get taxi {
    return Intl.message(
      'Taxi / VTC',
      name: 'taxi',
      desc: '',
      args: [],
    );
  }

  /// `Déplacements domicile-travail`
  String get employeeCommutingTitle {
    return Intl.message(
      'Déplacements domicile-travail',
      name: 'employeeCommutingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Emissions CO₂ dues aux déplacements des employés pour se rendre au travail via divers moyens de locomotions (voiture, transports en commun, vélo). Il est possible d'utiliser des valeurs moyennes pour éviter d'avoir à recenser tous les modes de transports des employés.`
  String get employeeCommutingDesc {
    return Intl.message(
      'Emissions CO₂ dues aux déplacements des employés pour se rendre au travail via divers moyens de locomotions (voiture, transports en commun, vélo). Il est possible d\'utiliser des valeurs moyennes pour éviter d\'avoir à recenser tous les modes de transports des employés.',
      name: 'employeeCommutingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Sans surprise, la solution la plus efficace pour décarboner les déplacements domicile-travail est le télétravail, si possible en limitant l'utilisation de la vidéo.\n\nAutre façon de décarboner ces déplacements : proposer aux employés un service de vélos de fonction qui permettra notamment aux automobilistes de changer de mode de transport.`
  String get employeeCommutingAdvice {
    return Intl.message(
      'Sans surprise, la solution la plus efficace pour décarboner les déplacements domicile-travail est le télétravail, si possible en limitant l\'utilisation de la vidéo.\n\nAutre façon de décarboner ces déplacements : proposer aux employés un service de vélos de fonction qui permettra notamment aux automobilistes de changer de mode de transport.',
      name: 'employeeCommutingAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Employés Île-de-France`
  String get employeeNumberIleDeFrance {
    return Intl.message(
      'Employés Île-de-France',
      name: 'employeeNumberIleDeFrance',
      desc: '',
      args: [],
    );
  }

  /// `Employés Province`
  String get employeeNumberProvince {
    return Intl.message(
      'Employés Province',
      name: 'employeeNumberProvince',
      desc: '',
      args: [],
    );
  }

  /// `Télétravail`
  String get homeworkingTitle {
    return Intl.message(
      'Télétravail',
      name: 'homeworkingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lorsque des employés télétravaillent, ils consomment de l'énergie (pour le fonctionnement de leur poste de travail, le chauffage, la climatisation) qui peut être comptabilisée dans le bilan carbone de l'organisation.\n\nCertaines études montrent qu'un télétravailleur à temps-plein (5 jours par semaine) consomme en moyenne [au moins 50 kWh](https://wikipower.be/blog/facture-energie-en-teletravail/) de plus par mois, il est donc possible de ramener ce ratio au nombre d'employé et de jours en télétravail.`
  String get homeworkingDesc {
    return Intl.message(
      'Lorsque des employés télétravaillent, ils consomment de l\'énergie (pour le fonctionnement de leur poste de travail, le chauffage, la climatisation) qui peut être comptabilisée dans le bilan carbone de l\'organisation.\n\nCertaines études montrent qu\'un télétravailleur à temps-plein (5 jours par semaine) consomme en moyenne [au moins 50 kWh](https://wikipower.be/blog/facture-energie-en-teletravail/) de plus par mois, il est donc possible de ramener ce ratio au nombre d\'employé et de jours en télétravail.',
      name: 'homeworkingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Data centers`
  String get dataCenterTitle {
    return Intl.message(
      'Data centers',
      name: 'dataCenterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Electricité utilisée par les datacenters de l'organisation, qui ne sont pas hébergés dans les locaux de l'organisation (auquel cas cette électricité ferait partie du scope 2).\n\nSi la consommation annuelle de ces machines est difficile à obtenir, recenser les équipements présents dans ces datacenters, calculer leur puissance et multiplier par le coefficient PUE (Power Usage Efficiency) du datacenter afin d'avoir une évaluation de la puissance totale des équipements. L'énergie annuelle consommée s'obtient ensuite en multipliant cette puissance moyenne par 24h puis par 365 jours.`
  String get dataCenterDesc {
    return Intl.message(
      'Electricité utilisée par les datacenters de l\'organisation, qui ne sont pas hébergés dans les locaux de l\'organisation (auquel cas cette électricité ferait partie du scope 2).\n\nSi la consommation annuelle de ces machines est difficile à obtenir, recenser les équipements présents dans ces datacenters, calculer leur puissance et multiplier par le coefficient PUE (Power Usage Efficiency) du datacenter afin d\'avoir une évaluation de la puissance totale des équipements. L\'énergie annuelle consommée s\'obtient ensuite en multipliant cette puissance moyenne par 24h puis par 365 jours.',
      name: 'dataCenterDesc',
      desc: '',
      args: [],
    );
  }

  /// `Le choix du datacenter peut avoir un fort impact :\n- Un coefficient PUE plus petit fait baisser les émissions.\n- Certains fournisseurs utilisent la chaleur des équipements pour chauffer des bâtiments. Cela permet d'éviter qu'un autre système de chauffage émette du CO₂. Ces émissions évitées sont à mettre au crédit de l'organisation.`
  String get dataCenterAdvice {
    return Intl.message(
      'Le choix du datacenter peut avoir un fort impact :\n- Un coefficient PUE plus petit fait baisser les émissions.\n- Certains fournisseurs utilisent la chaleur des équipements pour chauffer des bâtiments. Cela permet d\'éviter qu\'un autre système de chauffage émette du CO₂. Ces émissions évitées sont à mettre au crédit de l\'organisation.',
      name: 'dataCenterAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Achats de biens`
  String get goodsTitle {
    return Intl.message(
      'Achats de biens',
      name: 'goodsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toutes les dépenses de l'organisations en biens consommables au cours de l'année. Comme il est très dur de recenser précisément tous les achats de l'organisation, il est plus simple d'utiliser le montant des dépenses en € pour estimer les émissions associées.\n\nAttention à ne pas inclure dans ces dépenses les biens qui vont être amortis dans le temps (ex : serveurs informatiques). Ces biens amortis dans le temps doivent être inclus dans la partie "Immobilisations".`
  String get goodsDesc {
    return Intl.message(
      'Toutes les dépenses de l\'organisations en biens consommables au cours de l\'année. Comme il est très dur de recenser précisément tous les achats de l\'organisation, il est plus simple d\'utiliser le montant des dépenses en € pour estimer les émissions associées.\n\nAttention à ne pas inclure dans ces dépenses les biens qui vont être amortis dans le temps (ex : serveurs informatiques). Ces biens amortis dans le temps doivent être inclus dans la partie "Immobilisations".',
      name: 'goodsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Consommables bureautiques`
  String get officeConsumables {
    return Intl.message(
      'Consommables bureautiques',
      name: 'officeConsumables',
      desc: '',
      args: [],
    );
  }

  /// `Petites fournitures`
  String get officeSupplies {
    return Intl.message(
      'Petites fournitures',
      name: 'officeSupplies',
      desc: '',
      args: [],
    );
  }

  /// `Produits agricoles et de la mer`
  String get agriculturalProducts {
    return Intl.message(
      'Produits agricoles et de la mer',
      name: 'agriculturalProducts',
      desc: '',
      args: [],
    );
  }

  /// `Produit agro-alimentaires transformés`
  String get transformedFoodProducts {
    return Intl.message(
      'Produit agro-alimentaires transformés',
      name: 'transformedFoodProducts',
      desc: '',
      args: [],
    );
  }

  /// `Produit minéraux (ciment, verre, etc.)`
  String get mineralProducts {
    return Intl.message(
      'Produit minéraux (ciment, verre, etc.)',
      name: 'mineralProducts',
      desc: '',
      args: [],
    );
  }

  /// `Plastiques et caoutchouc`
  String get plastic {
    return Intl.message(
      'Plastiques et caoutchouc',
      name: 'plastic',
      desc: '',
      args: [],
    );
  }

  /// `Papier et carton`
  String get paper {
    return Intl.message(
      'Papier et carton',
      name: 'paper',
      desc: '',
      args: [],
    );
  }

  /// `Bois et article en bois`
  String get wood {
    return Intl.message(
      'Bois et article en bois',
      name: 'wood',
      desc: '',
      args: [],
    );
  }

  /// `Textile et habillement`
  String get clothes {
    return Intl.message(
      'Textile et habillement',
      name: 'clothes',
      desc: '',
      args: [],
    );
  }

  /// `Meubles et autres biens manufacturés`
  String get furniture {
    return Intl.message(
      'Meubles et autres biens manufacturés',
      name: 'furniture',
      desc: '',
      args: [],
    );
  }

  /// `Produits chimiques`
  String get chemicalProducts {
    return Intl.message(
      'Produits chimiques',
      name: 'chemicalProducts',
      desc: '',
      args: [],
    );
  }

  /// `Produits pharmaceutiques`
  String get pharmaceuticalProducts {
    return Intl.message(
      'Produits pharmaceutiques',
      name: 'pharmaceuticalProducts',
      desc: '',
      args: [],
    );
  }

  /// `Métaux (aluminium, cuivre, acier, etc.)`
  String get metals {
    return Intl.message(
      'Métaux (aluminium, cuivre, acier, etc.)',
      name: 'metals',
      desc: '',
      args: [],
    );
  }

  /// `Produits métalliques, sauf machines et équipements`
  String get metalProducts {
    return Intl.message(
      'Produits métalliques, sauf machines et équipements',
      name: 'metalProducts',
      desc: '',
      args: [],
    );
  }

  /// `Machines et équipements`
  String get machines {
    return Intl.message(
      'Machines et équipements',
      name: 'machines',
      desc: '',
      args: [],
    );
  }

  /// `Produits informatiques, électroniques et optiques`
  String get computerProducts {
    return Intl.message(
      'Produits informatiques, électroniques et optiques',
      name: 'computerProducts',
      desc: '',
      args: [],
    );
  }

  /// `Matériel de transport`
  String get transportationEquipment {
    return Intl.message(
      'Matériel de transport',
      name: 'transportationEquipment',
      desc: '',
      args: [],
    );
  }

  /// `Immobilisations`
  String get capitalGoodsTitle {
    return Intl.message(
      'Immobilisations',
      name: 'capitalGoodsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toutes les biens physiques rentrant dans le capital de l'organisations et qui sont conservés d'une année à l'autre. Comprend également les biens et vehicules en location longue durée (leasing).\n\nIl est très important de mentionner la durée d'amortissement de ces biens.`
  String get capitalGoodsDesc {
    return Intl.message(
      'Toutes les biens physiques rentrant dans le capital de l\'organisations et qui sont conservés d\'une année à l\'autre. Comprend également les biens et vehicules en location longue durée (leasing).\n\nIl est très important de mentionner la durée d\'amortissement de ces biens.',
      name: 'capitalGoodsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Une manière simple de faire baisser ses émissions liées aux immobilisations est de prolonger la durée de vie des équipements. Exemple :\n- allonger la durée de vie d'un ordinateur de 3 à 5 ans fait baisser les émissions de 37%\n- allonger la durée de vie d'un smartphone de 2,5 ans à 3,5 ans fait baisser les émissions de 26%`
  String get capitalGoodsAdvice {
    return Intl.message(
      'Une manière simple de faire baisser ses émissions liées aux immobilisations est de prolonger la durée de vie des équipements. Exemple :\n- allonger la durée de vie d\'un ordinateur de 3 à 5 ans fait baisser les émissions de 37%\n- allonger la durée de vie d\'un smartphone de 2,5 ans à 3,5 ans fait baisser les émissions de 26%',
      name: 'capitalGoodsAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Bâtiments de bureaux`
  String get office {
    return Intl.message(
      'Bâtiments de bureaux',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Ecran - 21,5 pouces`
  String get screen21inches {
    return Intl.message(
      'Ecran - 21,5 pouces',
      name: 'screen21inches',
      desc: '',
      args: [],
    );
  }

  /// `Ecran - 23,8 pouces`
  String get screen23inches {
    return Intl.message(
      'Ecran - 23,8 pouces',
      name: 'screen23inches',
      desc: '',
      args: [],
    );
  }

  /// `Imprimante`
  String get printer {
    return Intl.message(
      'Imprimante',
      name: 'printer',
      desc: '',
      args: [],
    );
  }

  /// `Photocopieurs`
  String get photocopiers {
    return Intl.message(
      'Photocopieurs',
      name: 'photocopiers',
      desc: '',
      args: [],
    );
  }

  /// `Ordinateur fixe`
  String get desktopComputer {
    return Intl.message(
      'Ordinateur fixe',
      name: 'desktopComputer',
      desc: '',
      args: [],
    );
  }

  /// `Ordinateur portable`
  String get laptop {
    return Intl.message(
      'Ordinateur portable',
      name: 'laptop',
      desc: '',
      args: [],
    );
  }

  /// `Rack serveur`
  String get rack {
    return Intl.message(
      'Rack serveur',
      name: 'rack',
      desc: '',
      args: [],
    );
  }

  /// `Serveur informatique`
  String get server {
    return Intl.message(
      'Serveur informatique',
      name: 'server',
      desc: '',
      args: [],
    );
  }

  /// `Smartphone`
  String get smartphone {
    return Intl.message(
      'Smartphone',
      name: 'smartphone',
      desc: '',
      args: [],
    );
  }

  /// `Tablette numérique`
  String get tablet {
    return Intl.message(
      'Tablette numérique',
      name: 'tablet',
      desc: '',
      args: [],
    );
  }

  /// `Vidéo-projecteur`
  String get videoProjector {
    return Intl.message(
      'Vidéo-projecteur',
      name: 'videoProjector',
      desc: '',
      args: [],
    );
  }

  /// `Télévision`
  String get tv {
    return Intl.message(
      'Télévision',
      name: 'tv',
      desc: '',
      args: [],
    );
  }

  /// `Voiture`
  String get car {
    return Intl.message(
      'Voiture',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `Achats de services`
  String get servicesTitle {
    return Intl.message(
      'Achats de services',
      name: 'servicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Toutes les dépenses de l'organisation liées à des prestations fournies par des organisations externes.\n\nAttention, si une prestation génère un bien qui devient la propriété de l'organisation et qui est amortissable sur plusieurs années (ex : construction de batiment), il faut retirer de ces dépenses la valeur du bien généré et l'inclure dans la partie "Immobilisations".`
  String get servicesDesc {
    return Intl.message(
      'Toutes les dépenses de l\'organisation liées à des prestations fournies par des organisations externes.\n\nAttention, si une prestation génère un bien qui devient la propriété de l\'organisation et qui est amortissable sur plusieurs années (ex : construction de batiment), il faut retirer de ces dépenses la valeur du bien généré et l\'inclure dans la partie "Immobilisations".',
      name: 'servicesDesc',
      desc: '',
      args: [],
    );
  }

  /// `Il est délicat de choisir les prestataires les moins impactants, mais il existe tout de même quelques astuces :\n- Le béton et l'acier sont particulièrement émetteurs de GES, il est donc recommandé de choisir des prestataires utilisant bois ou terre crue (bauge, adobe, pisé, torchis) pour vos constructions, en faisant attention à avoir une bonne [isolation](https://conseils-thermiques.org/contenu/comparatif_isolants.php).\n- Même s'il est dur de quantifier les émissions liées à l'argent investi ou sur le compte courant de l'organisation, le choix de la banque n'est pas anodin. Certaines banques [financent des activités bien plus carbonées](https://www.oxfamfrance.org/wp-content/uploads/2020/10/rapportBanque_OXFAM_v5.pdf) que d'autres.\n- Choisissez de préférence le ferroviaire pour tout ce qui est transport de marchandise.\n- De manière générale, n'hésitez pas à faire signer à vos prestataires une [charte d'achats responsables](https://www.tikehaucapital.com/~/media/Files/T/Tikehau-Capital/charte-des-achats-responsables), cela à au moins le mérite de montrer à vos fournisseurs que le sujet est important.`
  String get servicesAdvice {
    return Intl.message(
      'Il est délicat de choisir les prestataires les moins impactants, mais il existe tout de même quelques astuces :\n- Le béton et l\'acier sont particulièrement émetteurs de GES, il est donc recommandé de choisir des prestataires utilisant bois ou terre crue (bauge, adobe, pisé, torchis) pour vos constructions, en faisant attention à avoir une bonne [isolation](https://conseils-thermiques.org/contenu/comparatif_isolants.php).\n- Même s\'il est dur de quantifier les émissions liées à l\'argent investi ou sur le compte courant de l\'organisation, le choix de la banque n\'est pas anodin. Certaines banques [financent des activités bien plus carbonées](https://www.oxfamfrance.org/wp-content/uploads/2020/10/rapportBanque_OXFAM_v5.pdf) que d\'autres.\n- Choisissez de préférence le ferroviaire pour tout ce qui est transport de marchandise.\n- De manière générale, n\'hésitez pas à faire signer à vos prestataires une [charte d\'achats responsables](https://www.tikehaucapital.com/~/media/Files/T/Tikehau-Capital/charte-des-achats-responsables), cela à au moins le mérite de montrer à vos fournisseurs que le sujet est important.',
      name: 'servicesAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Construction`
  String get serviceConstruction {
    return Intl.message(
      'Construction',
      name: 'serviceConstruction',
      desc: '',
      args: [],
    );
  }

  /// `Assurance, services bancaires, conseil et honoraires`
  String get serviceAssuranceBank {
    return Intl.message(
      'Assurance, services bancaires, conseil et honoraires',
      name: 'serviceAssuranceBank',
      desc: '',
      args: [],
    );
  }

  /// `Courrier`
  String get serviceMail {
    return Intl.message(
      'Courrier',
      name: 'serviceMail',
      desc: '',
      args: [],
    );
  }

  /// `Telecommunications`
  String get serviceTelecommunications {
    return Intl.message(
      'Telecommunications',
      name: 'serviceTelecommunications',
      desc: '',
      args: [],
    );
  }

  /// `Hebergement et restauration`
  String get serviceRestauration {
    return Intl.message(
      'Hebergement et restauration',
      name: 'serviceRestauration',
      desc: '',
      args: [],
    );
  }

  /// `Services (imprimerie, publicité, architecture et ingénierie, maintenance multi-technique des bâtiments)`
  String get servicePrint {
    return Intl.message(
      'Services (imprimerie, publicité, architecture et ingénierie, maintenance multi-technique des bâtiments)',
      name: 'servicePrint',
      desc: '',
      args: [],
    );
  }

  /// `Édition (livres, journaux, revues, etc.)`
  String get serviceEdition {
    return Intl.message(
      'Édition (livres, journaux, revues, etc.)',
      name: 'serviceEdition',
      desc: '',
      args: [],
    );
  }

  /// `Films, enregistrement sonores, télévision et radio`
  String get serviceMovie {
    return Intl.message(
      'Films, enregistrement sonores, télévision et radio',
      name: 'serviceMovie',
      desc: '',
      args: [],
    );
  }

  /// `Réparation et installation de machines et d'équipements`
  String get serviceMachinesInstallation {
    return Intl.message(
      'Réparation et installation de machines et d\'équipements',
      name: 'serviceMachinesInstallation',
      desc: '',
      args: [],
    );
  }

  /// `Transport terrestre`
  String get serviceLandTransport {
    return Intl.message(
      'Transport terrestre',
      name: 'serviceLandTransport',
      desc: '',
      args: [],
    );
  }

  /// `Transport fluvial et maritime`
  String get serviceMaritimeTransport {
    return Intl.message(
      'Transport fluvial et maritime',
      name: 'serviceMaritimeTransport',
      desc: '',
      args: [],
    );
  }

  /// `Transport aérien`
  String get serviceAirTransport {
    return Intl.message(
      'Transport aérien',
      name: 'serviceAirTransport',
      desc: '',
      args: [],
    );
  }

  /// `Entreposage et services auxiliaires des transports`
  String get serviceTransportAuxiliaries {
    return Intl.message(
      'Entreposage et services auxiliaires des transports',
      name: 'serviceTransportAuxiliaries',
      desc: '',
      args: [],
    );
  }

  /// `Administration publiques et défense, sécurité sociale obligatoire`
  String get servicePublicAdministration {
    return Intl.message(
      'Administration publiques et défense, sécurité sociale obligatoire',
      name: 'servicePublicAdministration',
      desc: '',
      args: [],
    );
  }

  /// `Enseignement`
  String get serviceEducation {
    return Intl.message(
      'Enseignement',
      name: 'serviceEducation',
      desc: '',
      args: [],
    );
  }

  /// `Recherche et développement`
  String get serviceRAD {
    return Intl.message(
      'Recherche et développement',
      name: 'serviceRAD',
      desc: '',
      args: [],
    );
  }

  /// `Activités pour la santé humaine`
  String get serviceHealth {
    return Intl.message(
      'Activités pour la santé humaine',
      name: 'serviceHealth',
      desc: '',
      args: [],
    );
  }

  /// `Action sociale`
  String get serviceSocialAction {
    return Intl.message(
      'Action sociale',
      name: 'serviceSocialAction',
      desc: '',
      args: [],
    );
  }

  /// `Activités créatives, artistiques, culturelles, bibliothèques, et organisation de jeux de hasard et d'argent`
  String get serviceArtisticActivities {
    return Intl.message(
      'Activités créatives, artistiques, culturelles, bibliothèques, et organisation de jeux de hasard et d\'argent',
      name: 'serviceArtisticActivities',
      desc: '',
      args: [],
    );
  }

  /// `Activités sportives, récréatives et de loisirs`
  String get serviceSportActivities {
    return Intl.message(
      'Activités sportives, récréatives et de loisirs',
      name: 'serviceSportActivities',
      desc: '',
      args: [],
    );
  }

  /// `Activités des organisations associatives`
  String get serviceAssociationActivities {
    return Intl.message(
      'Activités des organisations associatives',
      name: 'serviceAssociationActivities',
      desc: '',
      args: [],
    );
  }

  /// `Déchets`
  String get wasteTitle {
    return Intl.message(
      'Déchets',
      name: 'wasteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Le nombre de tonnes de déchets produites par l'organisation au cours de l'année.`
  String get wasteDesc {
    return Intl.message(
      'Le nombre de tonnes de déchets produites par l\'organisation au cours de l\'année.',
      name: 'wasteDesc',
      desc: '',
      args: [],
    );
  }

  /// `Papier`
  String get paperWaste {
    return Intl.message(
      'Papier',
      name: 'paperWaste',
      desc: '',
      args: [],
    );
  }

  /// `Carton`
  String get cardboardWaste {
    return Intl.message(
      'Carton',
      name: 'cardboardWaste',
      desc: '',
      args: [],
    );
  }

  /// `Verre`
  String get glassWaste {
    return Intl.message(
      'Verre',
      name: 'glassWaste',
      desc: '',
      args: [],
    );
  }

  /// `Bouteilles en plastique PET`
  String get plasticPETBottleWaste {
    return Intl.message(
      'Bouteilles en plastique PET',
      name: 'plasticPETBottleWaste',
      desc: '',
      args: [],
    );
  }

  /// `Autres plastiques`
  String get otherPlasticWaste {
    return Intl.message(
      'Autres plastiques',
      name: 'otherPlasticWaste',
      desc: '',
      args: [],
    );
  }

  /// `Ordures ménagères`
  String get householdWaste {
    return Intl.message(
      'Ordures ménagères',
      name: 'householdWaste',
      desc: '',
      args: [],
    );
  }

  /// `Béton, briques, tuiles et céramiques`
  String get concreteWaste {
    return Intl.message(
      'Béton, briques, tuiles et céramiques',
      name: 'concreteWaste',
      desc: '',
      args: [],
    );
  }

  /// `Déchets de construction non dangereux en mélange (DIB)`
  String get otherMixedConstructionWaste {
    return Intl.message(
      'Déchets de construction non dangereux en mélange (DIB)',
      name: 'otherMixedConstructionWaste',
      desc: '',
      args: [],
    );
  }

  /// `Consommation électrique des produits vendus`
  String get productElectricityUsageTitle {
    return Intl.message(
      'Consommation électrique des produits vendus',
      name: 'productElectricityUsageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Les produits vendus par l'organisation entrainent une consommation électrique par l'utilisateur et donc des émissions CO₂.`
  String get productElectricityUsageDesc {
    return Intl.message(
      'Les produits vendus par l\'organisation entrainent une consommation électrique par l\'utilisateur et donc des émissions CO₂.',
      name: 'productElectricityUsageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Autres sources d'émissions`
  String get otherEmissions {
    return Intl.message(
      'Autres sources d\'émissions',
      name: 'otherEmissions',
      desc: '',
      args: [],
    );
  }

  /// `KWh (PCI)`
  String get unitKWh {
    return Intl.message(
      'KWh (PCI)',
      name: 'unitKWh',
      desc: '',
      args: [],
    );
  }

  /// `km.passager`
  String get unitKmPassenger {
    return Intl.message(
      'km.passager',
      name: 'unitKmPassenger',
      desc: '',
      args: [],
    );
  }

  /// `litres`
  String get unitLiters {
    return Intl.message(
      'litres',
      name: 'unitLiters',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get unitKg {
    return Intl.message(
      'kg',
      name: 'unitKg',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get unitKm {
    return Intl.message(
      'km',
      name: 'unitKm',
      desc: '',
      args: [],
    );
  }

  /// `tonnes`
  String get unitTons {
    return Intl.message(
      'tonnes',
      name: 'unitTons',
      desc: '',
      args: [],
    );
  }

  /// `unités`
  String get unit {
    return Intl.message(
      'unités',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `m²`
  String get unitSquareMeter {
    return Intl.message(
      'm²',
      name: 'unitSquareMeter',
      desc: '',
      args: [],
    );
  }

  /// `€`
  String get unitEur {
    return Intl.message(
      '€',
      name: 'unitEur',
      desc: '',
      args: [],
    );
  }

  /// `tCO₂e`
  String get unitTonsCO2e {
    return Intl.message(
      'tCO₂e',
      name: 'unitTonsCO2e',
      desc: '',
      args: [],
    );
  }

  /// `personnes`
  String get unitEmployees {
    return Intl.message(
      'personnes',
      name: 'unitEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Êtes-vous sûrs ?`
  String get validationDialogTitle {
    return Intl.message(
      'Êtes-vous sûrs ?',
      name: 'validationDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Soit {nbReturnFlights} aller-retours Paris – New York`
  String flightEquivalent(Object nbReturnFlights) {
    return Intl.message(
      'Soit $nbReturnFlights aller-retours Paris – New York',
      name: 'flightEquivalent',
      desc: '',
      args: [nbReturnFlights],
    );
  }

  /// `Scope {scopeNumber} ({tonsCO2e} tCO₂e)`
  String scopeFootprint(Object scopeNumber, Object tonsCO2e) {
    return Intl.message(
      'Scope $scopeNumber ($tonsCO2e tCO₂e)',
      name: 'scopeFootprint',
      desc: '',
      args: [scopeNumber, tonsCO2e],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translation> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translation> load(Locale locale) => Translation.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
