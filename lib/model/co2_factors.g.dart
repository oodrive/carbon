// File generated with get_co2_factors.sh script, do not manually edit

class Co2Factor {
  final double factor;
  final String source;

  const Co2Factor(this.factor, this.source);
}

const naturalGasKey = 'naturalGas';
const naturalGas = Co2Factor(0.000244, 'Base Carbone ADEME > Gaz naturel');
const bioGasKey = 'bioGas';
const bioGas = Co2Factor(0.0000163, 'Base Carbone ADEME > Biométhane > Issu de la filière STEU > Injecté dans les réseau > France');
const fuelOilKey = 'fuelOil';
const fuelOil = Co2Factor(0.00319, 'Base Carbone ADEME > Fioul domestique');
const firewoodKey = 'firewood';
const firewood = Co2Factor(0.000114, 'Base Carbone ADEME > Bois bûche > 20% d\'humidité');
const carKey = 'car';
const car = Co2Factor(0.000192, 'Base Carbone ADEME > Voiture > 2018 > Motorisation moyenne');
const electricCarKey = 'electricCar';
const electricCar = Co2Factor(0.000139, 'Base Carbone ADEME > Voiture particulière > Electrique > Haut de gamme - Berline > France');
const motorbikeKey = 'motorbike';
const motorbike = Co2Factor(0.0000644, 'Base Carbone ADEME > Cyclomoteur > 2018 > Mixte');
const petrolKey = 'petrol';
const petrol = Co2Factor(0.00111, 'Base Carbone ADEME > Essence > E85');
const dieselKey = 'diesel';
const diesel = Co2Factor(0.00264, 'Base Carbone ADEME > Gazole > B30');
const lpgKey = 'lpg';
const lpg = Co2Factor(0.00186, 'Base Carbone ADEME > GPL pour véhicule routier');
const tgvKey = 'tgv';
const tgv = Co2Factor(0.00000173, 'Base Carbone ADEME > TGV > 2019');
const terKey = 'ter';
const ter = Co2Factor(0.0000248, 'Base Carbone ADEME > TER > Traction moyenne > 2019');
const rerKey = 'rer';
const rer = Co2Factor(0.0000041, 'Base Carbone ADEME > RER et transilien > Ile de France > 2019 > IledeFrance');
const subwayKey = 'subway';
const subway = Co2Factor(0.0000025, 'Base Carbone ADEME > Métro > Ile de France > 2019 > IledeFrance');
const shortHaulPlaneKey = 'shortHaulPlane';
const shortHaulPlane = Co2Factor(0.000258, 'Base Carbone ADEME > Avion passagers > AVEC trainées > Court courrier, 2018');
const mediumHaulPlaneKey = 'mediumHaulPlane';
const mediumHaulPlane = Co2Factor(0.000187, 'Base Carbone ADEME > Avion passagers > AVEC trainées > Moyen courrier, 2018');
const longHaulPlaneKey = 'longHaulPlane';
const longHaulPlane = Co2Factor(0.000152, 'Base Carbone ADEME > Avion passagers > AVEC trainées > Long courrier, 2018');
const officeConsumablesKey = 'officeConsumables';
const officeConsumables = Co2Factor(0.000917, 'Base Carbone ADEME > Consommables bureautiques');
const officeSuppliesKey = 'officeSupplies';
const officeSupplies = Co2Factor(0.000367, 'Base Carbone ADEME > Petites fournitures');
const agriculturalProductsKey = 'agriculturalProducts';
const agriculturalProducts = Co2Factor(2.3, 'Base Carbone ADEME > Service > Produits agricoles et de la mer');
const transformedFoodProductsKey = 'transformedFoodProducts';
const transformedFoodProducts = Co2Factor(1, 'Base Carbone ADEME > Service > Produit agro-alimentaires transformés');
const mineralProductsKey = 'mineralProducts';
const mineralProducts = Co2Factor(1.8, 'Base Carbone ADEME > Service > Produit minéraux (ciment, verre, etc.)');
const plasticKey = 'plastic';
const plastic = Co2Factor(0.8, 'Base Carbone ADEME > Service > Plastiques et caoutchouc');
const paperKey = 'paper';
const paper = Co2Factor(0.9, 'Base Carbone ADEME > Service > Papier et carton');
const woodKey = 'wood';
const wood = Co2Factor(0.5, 'Base Carbone ADEME > Service > Bois et article en bois');
const clothesKey = 'clothes';
const clothes = Co2Factor(0.6, 'Base Carbone ADEME > Service > Textile et habillement');
const furnitureKey = 'furniture';
const furniture = Co2Factor(0.6, 'Base Carbone ADEME > Service > Meubles et autres biens manufacturés');
const chemicalProductsKey = 'chemicalProducts';
const chemicalProducts = Co2Factor(1.6, 'Base Carbone ADEME > Service > Produits chimiques');
const pharmaceuticalProductsKey = 'pharmaceuticalProducts';
const pharmaceuticalProducts = Co2Factor(0.5, 'Base Carbone ADEME > Service > Produits pharmaceutiques');
const metalsKey = 'metals';
const metals = Co2Factor(1.7, 'Base Carbone ADEME > Service > Métaux (aluminium, cuivre, acier, etc.)');
const metalProductsKey = 'metalProducts';
const metalProducts = Co2Factor(0.6, 'Base Carbone ADEME > Service > Produits métalliques, sauf machines et équipements');
const machinesKey = 'machines';
const machines = Co2Factor(0.7, 'Base Carbone ADEME > Service > Machines et équipements');
const computerProductsKey = 'computerProducts';
const computerProducts = Co2Factor(0.4, 'Base Carbone ADEME > Service > Produits informatiques, électroniques et optiques');
const transportationEquipmentKey = 'transportationEquipment';
const transportationEquipment = Co2Factor(0.7, 'Base Carbone ADEME > Service > Matériel de transport');
const officeKey = 'office';
const office = Co2Factor(0.65, 'Base Carbone ADEME > Bâtiments de bureaux');
const screen21inchesKey = 'screen21inches';
const screen21inches = Co2Factor(0.222, 'Base Carbone ADEME > Ecran > 21, 5 pouces');
const screen23inchesKey = 'screen23inches';
const screen23inches = Co2Factor(0.248, 'Base Carbone ADEME > Ecran > 23, 8 pouces');
const printerKey = 'printer';
const printer = Co2Factor(0.0879, 'Base Carbone ADEME > Imprimante > multi-fonction');
const photocopiersKey = 'photocopiers';
const photocopiers = Co2Factor(2.935, 'Base Carbone ADEME > Photocopieurs');
const desktopComputerKey = 'desktopComputer';
const desktopComputer = Co2Factor(0.169, 'Base Carbone ADEME > Ordinateur > Bureautique > fixe');
const laptopKey = 'laptop';
const laptop = Co2Factor(0.156, 'Base Carbone ADEME > Ordinateur > portable');
const rackKey = 'rack';
const rack = Co2Factor(0.5, 'Base Carbone ADEME > Racks (baies ou cabinets)');
const serverKey = 'server';
const server = Co2Factor(0.6, 'Base Carbone ADEME > Serveurs informatiques');
const smartphoneKey = 'smartphone';
const smartphone = Co2Factor(0.0391, 'Base Carbone ADEME > Smartphone > de plus de 5, 5 pouces');
const tabletKey = 'tablet';
const tablet = Co2Factor(0.0632, 'Base Carbone ADEME > Tablette > 9 à 11 pouces > classique');
const videoProjectorKey = 'videoProjector';
const videoProjector = Co2Factor(0.145, 'Base Carbone ADEME > Vidéo-projecteur');
const tvKey = 'tv';
const tv = Co2Factor(0.371, 'Base Carbone ADEME > Télévision > 40-49 pouces');
const vehiclesFabricationKey = 'vehiclesFabrication';
const vehiclesFabrication = Co2Factor(5.5, 'Base Carbone ADEME > Véhicules > fabrication');
const serviceConstructionKey = 'serviceConstruction';
const serviceConstruction = Co2Factor(0.36, 'Base Carbone ADEME > Service > Construction');
const serviceAssuranceBankKey = 'serviceAssuranceBank';
const serviceAssuranceBank = Co2Factor(0.11, 'Base Carbone ADEME > Service > Assurance, services bancaires, conseil et honoraires');
const serviceMailKey = 'serviceMail';
const serviceMail = Co2Factor(0.13, 'Base Carbone ADEME > Service > Courrier');
const serviceTelecommunicationsKey = 'serviceTelecommunications';
const serviceTelecommunications = Co2Factor(0.17, 'Base Carbone ADEME > Service > Télécommunications');
const serviceRestaurationKey = 'serviceRestauration';
const serviceRestauration = Co2Factor(0.32, 'Base Carbone ADEME > Service > Hébergement et restauration');
const servicePrintKey = 'servicePrint';
const servicePrint = Co2Factor(0.17, 'Base Carbone ADEME > Service > Services (imprimerie, publicité, architecture et ingénierie, maintenance multi-technique des bâtimen');
const serviceEditionKey = 'serviceEdition';
const serviceEdition = Co2Factor(0.28, 'Base Carbone ADEME > Service > Édition (livres, journaux, revues, etc.)');
const serviceMovieKey = 'serviceMovie';
const serviceMovie = Co2Factor(0.31, 'Base Carbone ADEME > Service > Films, enregistrement sonores, télévision et radio');
const serviceMachinesInstallationKey = 'serviceMachinesInstallation';
const serviceMachinesInstallation = Co2Factor(0.39, 'Base Carbone ADEME > Service > Réparation et installation de machines et d\'équipements');
const serviceLandTransportKey = 'serviceLandTransport';
const serviceLandTransport = Co2Factor(0.56, 'Base Carbone ADEME > Service > Transport terrestre');
const serviceMaritimeTransportKey = 'serviceMaritimeTransport';
const serviceMaritimeTransport = Co2Factor(0.59, 'Base Carbone ADEME > Service > Transport fluvial et maritime');
const serviceAirTransportKey = 'serviceAirTransport';
const serviceAirTransport = Co2Factor(1.19, 'Base Carbone ADEME > Service > Transport aérien');
const serviceTransportAuxiliariesKey = 'serviceTransportAuxiliaries';
const serviceTransportAuxiliaries = Co2Factor(0.17, 'Base Carbone ADEME > Service > Entreposage et services auxiliaires des transports');
const servicePublicAdministrationKey = 'servicePublicAdministration';
const servicePublicAdministration = Co2Factor(0.16, 'Base Carbone ADEME > Service > Administration publiques et défense, sécurité sociale obligatoire');
const serviceEducationKey = 'serviceEducation';
const serviceEducation = Co2Factor(0.12, 'Base Carbone ADEME > Service > Enseignement');
const serviceRADKey = 'serviceRAD';
const serviceRAD = Co2Factor(0.25, 'Base Carbone ADEME > Service > Recherche et développement');
const serviceHealthKey = 'serviceHealth';
const serviceHealth = Co2Factor(0.12, 'Base Carbone ADEME > Service > Activités pour la santé humaine');
const serviceSocialActionKey = 'serviceSocialAction';
const serviceSocialAction = Co2Factor(0.1, 'Base Carbone ADEME > Service > Action sociale');
const serviceArtisticActivitiesKey = 'serviceArtisticActivities';
const serviceArtisticActivities = Co2Factor(0.21, 'Base Carbone ADEME > Service > Activités créatives, artistiques, culturelles, bibliothèques, et organisation de jeux de hasard et d');
const serviceSportActivitiesKey = 'serviceSportActivities';
const serviceSportActivities = Co2Factor(0.27, 'Base Carbone ADEME > Service > Activités sportives, récréatives et de loisirs');
const serviceAssociationActivitiesKey = 'serviceAssociationActivities';
const serviceAssociationActivities = Co2Factor(0.22, 'Base Carbone ADEME > Service > Activités des organisations associatives');
const cardboardWasteKey = 'cardboardWaste';
const cardboardWaste = Co2Factor(0.737, 'Base Carbone ADEME > Emballages > Fin de vie moyenne filière - Impacts > Carton');
const glassWasteKey = 'glassWaste';
const glassWaste = Co2Factor(0.496, 'Base Carbone ADEME > Emballages > Fin de vie moyenne filière - Impacts > Verre');
const plasticPETBottleWasteKey = 'plasticPETBottleWaste';
const plasticPETBottleWaste = Co2Factor(1.106, 'Base Carbone ADEME > Emballages > Fin de vie moyenne filière - Impacts > Plastique rigide pétrosourcé PET bouteilles');
const otherPlasticWasteKey = 'otherPlasticWaste';
const otherPlasticWaste = Co2Factor(1.844, 'Base Carbone ADEME > Emballages > Fin de vie moyenne filière - Impacts > Autres plastiques et plastiques complexes');
const householdWasteKey = 'householdWaste';
const householdWaste = Co2Factor(0.386, 'Base Carbone ADEME > Ordures ménagères résiduelles > Fin de vie moyenne - Impacts');
const concreteWasteKey = 'concreteWaste';
const concreteWaste = Co2Factor(0.026, 'Base Carbone ADEME > Déchets du bâtiment > Fin de vie moyenne - Impacts > Béton, briques, tuiles et céramiques');
const otherMixedConstructionWasteKey = 'otherMixedConstructionWaste';
const otherMixedConstructionWaste = Co2Factor(0.087, 'Base Carbone ADEME > Déchets du bâtiment > Fin de vie moyenne - Impacts > Déchets non dangereux en mélange (DIB)');
const electricityFranceKey = 'electricityFrance';
const electricityFrance = Co2Factor(0.0000599, 'Base Carbone ADEME > Electricité > consommation > 2020 - mix moyen');
const electricitySouthAfricaKey = 'electricitySouthAfrica';
const electricitySouthAfrica = Co2Factor(0.000927, 'Base Carbone ADEME > Électricité > mix moyen > AfriqueduSud');
const electricityAlbaniaKey = 'electricityAlbania';
const electricityAlbania = Co2Factor(0.00000215, 'Base Carbone ADEME > Électricité > mix moyen > Albanie');
const electricityAlgeriaKey = 'electricityAlgeria';
const electricityAlgeria = Co2Factor(0.000548, 'Base Carbone ADEME > Électricité > mix moyen > Algérie');
const electricityGermanyKey = 'electricityGermany';
const electricityGermany = Co2Factor(0.000461, 'Base Carbone ADEME > Électricité > mix moyen > Allemagne');
const electricityAngolaKey = 'electricityAngola';
const electricityAngola = Co2Factor(0.00044, 'Base Carbone ADEME > Électricité > mix moyen > Angola');
const electricityNetherlandsAntillesKey = 'electricityNetherlandsAntilles';
const electricityNetherlandsAntilles = Co2Factor(0.000707, 'Base Carbone ADEME > Électricité > mix moyen > AntillesNéerlandaises');
const electricitySaudiArabiaKey = 'electricitySaudiArabia';
const electricitySaudiArabia = Co2Factor(0.000737, 'Base Carbone ADEME > Électricité > mix moyen > ArabieSaoudite');
const electricityArgentinaKey = 'electricityArgentina';
const electricityArgentina = Co2Factor(0.000367, 'Base Carbone ADEME > Électricité > mix moyen > Argentine');
const electricityArmeniaKey = 'electricityArmenia';
const electricityArmenia = Co2Factor(0.0000922, 'Base Carbone ADEME > Électricité > mix moyen > Arménie');
const electricityAustraliaKey = 'electricityAustralia';
const electricityAustralia = Co2Factor(0.000841, 'Base Carbone ADEME > Électricité > mix moyen > Australie');
const electricityAustriaKey = 'electricityAustria';
const electricityAustria = Co2Factor(0.000188, 'Base Carbone ADEME > Électricité > mix moyen > Autriche');
const electricityAzerbaijanKey = 'electricityAzerbaijan';
const electricityAzerbaijan = Co2Factor(0.000439, 'Base Carbone ADEME > Électricité > mix moyen > Azerbaïdjan');
const electricityBahrainKey = 'electricityBahrain';
const electricityBahrain = Co2Factor(0.00064, 'Base Carbone ADEME > Électricité > mix moyen > Bahreïn');
const electricityBangladeshKey = 'electricityBangladesh';
const electricityBangladesh = Co2Factor(0.000593, 'Base Carbone ADEME > Électricité > mix moyen > Bangladesh');
const electricityBelarusKey = 'electricityBelarus';
const electricityBelarus = Co2Factor(0.000449, 'Base Carbone ADEME > Électricité > mix moyen > Bélarus');
const electricityBelgiumKey = 'electricityBelgium';
const electricityBelgium = Co2Factor(0.00022, 'Base Carbone ADEME > Électricité > mix moyen > Belgique');
const electricityBeninKey = 'electricityBenin';
const electricityBenin = Co2Factor(0.00072, 'Base Carbone ADEME > Électricité > mix moyen > Bénin');
const electricityMyanmarKey = 'electricityMyanmar';
const electricityMyanmar = Co2Factor(0.000262, 'Base Carbone ADEME > Électricité > mix moyen > Birmanie');
const electricityBoliviaKey = 'electricityBolivia';
const electricityBolivia = Co2Factor(0.000423, 'Base Carbone ADEME > Électricité > mix moyen > Bolivie');
const electricityBosniaandHerzegovinaKey = 'electricityBosniaandHerzegovina';
const electricityBosniaandHerzegovina = Co2Factor(0.000723, 'Base Carbone ADEME > Électricité > mix moyen > Bosnie-Herzégovine');
const electricityBotswanaKey = 'electricityBotswana';
const electricityBotswana = Co2Factor(0.00252, 'Base Carbone ADEME > Électricité > mix moyen > Botswana');
const electricityBrazilKey = 'electricityBrazil';
const electricityBrazil = Co2Factor(0.0000868, 'Base Carbone ADEME > Électricité > mix moyen > Brésil');
const electricityBruneiDarussalamKey = 'electricityBruneiDarussalam';
const electricityBruneiDarussalam = Co2Factor(0.000717, 'Base Carbone ADEME > Électricité > mix moyen > BrunéiDarussalam');
const electricityBulgariaKey = 'electricityBulgaria';
const electricityBulgaria = Co2Factor(0.000535, 'Base Carbone ADEME > Électricité > mix moyen > Bulgarie');
const electricityCambodiaKey = 'electricityCambodia';
const electricityCambodia = Co2Factor(0.000804, 'Base Carbone ADEME > Électricité > mix moyen > Cambodge');
const electricityCameroonKey = 'electricityCameroon';
const electricityCameroon = Co2Factor(0.000207, 'Base Carbone ADEME > Électricité > mix moyen > Cameroun');
const electricityCanadaKey = 'electricityCanada';
const electricityCanada = Co2Factor(0.000186, 'Base Carbone ADEME > Électricité > mix moyen > Canada');
const electricityChileKey = 'electricityChile';
const electricityChile = Co2Factor(0.00041, 'Base Carbone ADEME > Électricité > mix moyen > Chili');
const electricityChinaKey = 'electricityChina';
const electricityChina = Co2Factor(0.000766, 'Base Carbone ADEME > Électricité > mix moyen > Chine');
const electricityCyprusKey = 'electricityCyprus';
const electricityCyprus = Co2Factor(0.000697, 'Base Carbone ADEME > Électricité > mix moyen > Chypre');
const electricityColombiaKey = 'electricityColombia';
const electricityColombia = Co2Factor(0.000176, 'Base Carbone ADEME > Électricité > mix moyen > Colombie');
const electricityCongoKey = 'electricityCongo';
const electricityCongo = Co2Factor(0.000142, 'Base Carbone ADEME > Électricité > mix moyen > Congo');
const electricityDPRofKoreanorthKey = 'electricityDPRofKoreanorth';
const electricityDPRofKoreanorth = Co2Factor(0.000465, 'Base Carbone ADEME > Électricité > mix moyen > Coréedunord');
const electricitySouthKoreaKey = 'electricitySouthKorea';
const electricitySouthKorea = Co2Factor(0.000533, 'Base Carbone ADEME > Électricité > mix moyen > Coréedusud');
const electricityCostaRicaKey = 'electricityCostaRica';
const electricityCostaRica = Co2Factor(0.0000557, 'Base Carbone ADEME > Électricité > mix moyen > Costarica');
const electricityCotedIvoireKey = 'electricityCotedIvoire';
const electricityCotedIvoire = Co2Factor(0.000445, 'Base Carbone ADEME > Électricité > mix moyen > CôtedIvoire');
const electricityCroatiaKey = 'electricityCroatia';
const electricityCroatia = Co2Factor(0.000236, 'Base Carbone ADEME > Électricité > mix moyen > Croatie');
const electricityCubaKey = 'electricityCuba';
const electricityCuba = Co2Factor(0.00101, 'Base Carbone ADEME > Électricité > mix moyen > Cuba');
const electricityDenmarkKey = 'electricityDenmark';
const electricityDenmark = Co2Factor(0.00036, 'Base Carbone ADEME > Électricité > mix moyen > Danemark');
const electricityDominicanRepublicKey = 'electricityDominicanRepublic';
const electricityDominicanRepublic = Co2Factor(0.000589, 'Base Carbone ADEME > Électricité > mix moyen > DominicaineRépublique');
const electricityEgyptKey = 'electricityEgypt';
const electricityEgypt = Co2Factor(0.00045, 'Base Carbone ADEME > Électricité > mix moyen > Égypte');
const electricityElSalvadorKey = 'electricityElSalvador';
const electricityElSalvador = Co2Factor(0.000223, 'Base Carbone ADEME > Électricité > mix moyen > ElSalvador');
const electricityUnitedArabEmiratesKey = 'electricityUnitedArabEmirates';
const electricityUnitedArabEmirates = Co2Factor(0.000598, 'Base Carbone ADEME > Électricité > mix moyen > ÉmiratsArabesUnis');
const electricityEcuadorKey = 'electricityEcuador';
const electricityEcuador = Co2Factor(0.000389, 'Base Carbone ADEME > Électricité > mix moyen > Équateur');
const electricityEritreaKey = 'electricityEritrea';
const electricityEritrea = Co2Factor(0.000646, 'Base Carbone ADEME > Électricité > mix moyen > Érythrée');
const electricitySpainKey = 'electricitySpain';
const electricitySpain = Co2Factor(0.000238, 'Base Carbone ADEME > Électricité > mix moyen > Espagne');
const electricityEstoniaKey = 'electricityEstonia';
const electricityEstonia = Co2Factor(0.00101, 'Base Carbone ADEME > Électricité > mix moyen > Estonie');
const electricityUnitedStatesKey = 'electricityUnitedStates';
const electricityUnitedStates = Co2Factor(0.000522, 'Base Carbone ADEME > Électricité > mix moyen > États-Unis');
const electricityEthiopiaKey = 'electricityEthiopia';
const electricityEthiopia = Co2Factor(0.00000701, 'Base Carbone ADEME > Électricité > mix moyen > Éthiopie');
const electricityFinlandKey = 'electricityFinland';
const electricityFinland = Co2Factor(0.000229, 'Base Carbone ADEME > Électricité > mix moyen > Finlande');
const electricitySyrianArabRepublicKey = 'electricitySyrianArabRepublic';
const electricitySyrianArabRepublic = Co2Factor(0.000594, 'Base Carbone ADEME > Électricité > mix moyen > Syrie');
const electricityGabonKey = 'electricityGabon';
const electricityGabon = Co2Factor(0.000383, 'Base Carbone ADEME > Électricité > mix moyen > Gabon');
const electricityGeorgiaKey = 'electricityGeorgia';
const electricityGeorgia = Co2Factor(0.0000687, 'Base Carbone ADEME > Électricité > mix moyen > Géorgie');
const electricityGhanaKey = 'electricityGhana';
const electricityGhana = Co2Factor(0.000259, 'Base Carbone ADEME > Électricité > mix moyen > Ghana');
const electricityGibraltarKey = 'electricityGibraltar';
const electricityGibraltar = Co2Factor(0.000762, 'Base Carbone ADEME > Électricité > mix moyen > Gibraltar');
const electricityGreeceKey = 'electricityGreece';
const electricityGreece = Co2Factor(0.000718, 'Base Carbone ADEME > Électricité > mix moyen > Grèce');
const electricityGuatemalaKey = 'electricityGuatemala';
const electricityGuatemala = Co2Factor(0.000286, 'Base Carbone ADEME > Électricité > mix moyen > Guatemala');
const electricityHaitiKey = 'electricityHaiti';
const electricityHaiti = Co2Factor(0.000538, 'Base Carbone ADEME > Électricité > mix moyen > Haïti');
const electricityHondurasKey = 'electricityHonduras';
const electricityHonduras = Co2Factor(0.000332, 'Base Carbone ADEME > Électricité > mix moyen > Honduras');
const electricityHungaryKey = 'electricityHungary';
const electricityHungary = Co2Factor(0.000317, 'Base Carbone ADEME > Électricité > mix moyen > Hongrie');
const electricityIndiaKey = 'electricityIndia';
const electricityIndia = Co2Factor(0.000912, 'Base Carbone ADEME > Électricité > mix moyen > Inde');
const electricityIndonesiaKey = 'electricityIndonesia';
const electricityIndonesia = Co2Factor(0.000709, 'Base Carbone ADEME > Électricité > mix moyen > Indonésie');
const electricityIraqKey = 'electricityIraq';
const electricityIraq = Co2Factor(0.001, 'Base Carbone ADEME > Électricité > mix moyen > Iraq');
const electricityIrelandKey = 'electricityIreland';
const electricityIreland = Co2Factor(0.000458, 'Base Carbone ADEME > Électricité > mix moyen > Irlande');
const electricityIcelandKey = 'electricityIceland';
const electricityIceland = Co2Factor(0.000000183, 'Base Carbone ADEME > Électricité > mix moyen > Islande');
const electricityIsraelKey = 'electricityIsrael';
const electricityIsrael = Co2Factor(0.000689, 'Base Carbone ADEME > Électricité > mix moyen > Israël');
const electricityItalyKey = 'electricityItaly';
const electricityItaly = Co2Factor(0.000406, 'Base Carbone ADEME > Électricité > mix moyen > Italie');
const electricityJamaicaKey = 'electricityJamaica';
const electricityJamaica = Co2Factor(0.000711, 'Base Carbone ADEME > Électricité > mix moyen > Jamaïque');
const electricityJapanKey = 'electricityJapan';
const electricityJapan = Co2Factor(0.000416, 'Base Carbone ADEME > Électricité > mix moyen > Japon');
const electricityJordanKey = 'electricityJordan';
const electricityJordan = Co2Factor(0.000566, 'Base Carbone ADEME > Électricité > mix moyen > Jordanie');
const electricityKazakhstanKey = 'electricityKazakhstan';
const electricityKazakhstan = Co2Factor(0.000403, 'Base Carbone ADEME > Électricité > mix moyen > Kazakstan');
const electricityKenyaKey = 'electricityKenya';
const electricityKenya = Co2Factor(0.000274, 'Base Carbone ADEME > Électricité > mix moyen > Kenya');
const electricityKyrgyzstanKey = 'electricityKyrgyzstan';
const electricityKyrgyzstan = Co2Factor(0.0000591, 'Base Carbone ADEME > Électricité > mix moyen > Kirghizistan');
const electricityKosovoKey = 'electricityKosovo';
const electricityKosovo = Co2Factor(0.00129, 'Base Carbone ADEME > Électricité > mix moyen > Kosovo');
const electricityKuwaitKey = 'electricityKuwait';
const electricityKuwait = Co2Factor(0.000842, 'Base Carbone ADEME > Électricité > mix moyen > Koweït');
const electricityLatviaKey = 'electricityLatvia';
const electricityLatvia = Co2Factor(0.00012, 'Base Carbone ADEME > Électricité > mix moyen > Lettonie');
const electricityLebanonKey = 'electricityLebanon';
const electricityLebanon = Co2Factor(0.000709, 'Base Carbone ADEME > Électricité > mix moyen > Liban');
const electricityLibyaKey = 'electricityLibya';
const electricityLibya = Co2Factor(0.000885, 'Base Carbone ADEME > Électricité > mix moyen > Libye');
const electricityLithuaniaKey = 'electricityLithuania';
const electricityLithuania = Co2Factor(0.000337, 'Base Carbone ADEME > Électricité > mix moyen > Lituanie');
const electricityLuxembourgKey = 'electricityLuxembourg';
const electricityLuxembourg = Co2Factor(0.00041, 'Base Carbone ADEME > Électricité > mix moyen > Luxembourg');
const electricityFYRofMacedoniaKey = 'electricityFYRofMacedonia';
const electricityFYRofMacedonia = Co2Factor(0.000685, 'Base Carbone ADEME > Électricité > mix moyen > Macédonie');
const electricityMalaysiaKey = 'electricityMalaysia';
const electricityMalaysia = Co2Factor(0.000727, 'Base Carbone ADEME > Électricité > mix moyen > Malaisie');
const electricityMaltaKey = 'electricityMalta';
const electricityMalta = Co2Factor(0.000872, 'Base Carbone ADEME > Électricité > mix moyen > Malte');
const electricityMoroccoKey = 'electricityMorocco';
const electricityMorocco = Co2Factor(0.000718, 'Base Carbone ADEME > Électricité > mix moyen > Maroc');
const electricityMexicoKey = 'electricityMexico';
const electricityMexico = Co2Factor(0.000455, 'Base Carbone ADEME > Électricité > mix moyen > Mexique');
const electricityRepublicofMoldovaKey = 'electricityRepublicofMoldova';
const electricityRepublicofMoldova = Co2Factor(0.000517, 'Base Carbone ADEME > Électricité > mix moyen > Moldavie');
const electricityMongoliaKey = 'electricityMongolia';
const electricityMongolia = Co2Factor(0.000949, 'Base Carbone ADEME > Électricité > mix moyen > Mongolie');
const electricityMontenegroKey = 'electricityMontenegro';
const electricityMontenegro = Co2Factor(0.000405, 'Base Carbone ADEME > Électricité > mix moyen > Montenegro');
const electricityMozambiqueKey = 'electricityMozambique';
const electricityMozambique = Co2Factor(0.000000648, 'Base Carbone ADEME > Électricité > mix moyen > Mozambique');
const electricityNamibiaKey = 'electricityNamibia';
const electricityNamibia = Co2Factor(0.000197, 'Base Carbone ADEME > Électricité > mix moyen > Namibie');
const electricityNepalKey = 'electricityNepal';
const electricityNepal = Co2Factor(0.00000106, 'Base Carbone ADEME > Électricité > mix moyen > Népal');
const electricityNicaraguaKey = 'electricityNicaragua';
const electricityNicaragua = Co2Factor(0.00046, 'Base Carbone ADEME > Électricité > mix moyen > Nicaragua');
const electricityNigeriaKey = 'electricityNigeria';
const electricityNigeria = Co2Factor(0.000405, 'Base Carbone ADEME > Électricité > mix moyen > Nigéria');
const electricityNorwayKey = 'electricityNorway';
const electricityNorway = Co2Factor(0.0000167, 'Base Carbone ADEME > Électricité > mix moyen > Norvège');
const electricityNewZealandKey = 'electricityNewZealand';
const electricityNewZealand = Co2Factor(0.00015, 'Base Carbone ADEME > Électricité > mix moyen > Nouvelle-Zélande');
const electricityOmanKey = 'electricityOman';
const electricityOman = Co2Factor(0.000794, 'Base Carbone ADEME > Électricité > mix moyen > Oman');
const electricityUzbekistanKey = 'electricityUzbekistan';
const electricityUzbekistan = Co2Factor(0.00055, 'Base Carbone ADEME > Électricité > mix moyen > Ouzbékistan');
const electricityPakistanKey = 'electricityPakistan';
const electricityPakistan = Co2Factor(0.000425, 'Base Carbone ADEME > Électricité > mix moyen > Pakistan');
const electricityPanamaKey = 'electricityPanama';
const electricityPanama = Co2Factor(0.000298, 'Base Carbone ADEME > Électricité > mix moyen > Panama');
const electricityNetherlandsKey = 'electricityNetherlands';
const electricityNetherlands = Co2Factor(0.000415, 'Base Carbone ADEME > Électricité > mix moyen > Pays-Bas');
const electricityPeruKey = 'electricityPeru';
const electricityPeru = Co2Factor(0.000289, 'Base Carbone ADEME > Électricité > mix moyen > Pérou');
const electricityPhilippinesKey = 'electricityPhilippines';
const electricityPhilippines = Co2Factor(0.000481, 'Base Carbone ADEME > Électricité > mix moyen > Philippines');
const electricityPolandKey = 'electricityPoland';
const electricityPoland = Co2Factor(0.000781, 'Base Carbone ADEME > Électricité > mix moyen > Pologne');
const electricityPortugalKey = 'electricityPortugal';
const electricityPortugal = Co2Factor(0.000255, 'Base Carbone ADEME > Électricité > mix moyen > Portugal');
const electricityQatarKey = 'electricityQatar';
const electricityQatar = Co2Factor(0.000494, 'Base Carbone ADEME > Électricité > mix moyen > Qatar');
const electricityDemRepofCongoKey = 'electricityDemRepofCongo';
const electricityDemRepofCongo = Co2Factor(0.00000291, 'Base Carbone ADEME > Électricité > mix moyen > RépDémDuCongo');
const electricityCzechRepublicKey = 'electricityCzechRepublic';
const electricityCzechRepublic = Co2Factor(0.000589, 'Base Carbone ADEME > Électricité > mix moyen > RépubliqueTchèque');
const electricityRomaniaKey = 'electricityRomania';
const electricityRomania = Co2Factor(0.000413, 'Base Carbone ADEME > Électricité > mix moyen > Roumanie');
const electricityUnitedKingdomKey = 'electricityUnitedKingdom';
const electricityUnitedKingdom = Co2Factor(0.000457, 'Base Carbone ADEME > Électricité > mix moyen > Royaume-Uni');
const electricityRussianFederationKey = 'electricityRussianFederation';
const electricityRussianFederation = Co2Factor(0.000384, 'Base Carbone ADEME > Électricité > mix moyen > Russie');
const electricitySenegalKey = 'electricitySenegal';
const electricitySenegal = Co2Factor(0.000637, 'Base Carbone ADEME > Électricité > mix moyen > Sénégal');
const electricitySerbiaKey = 'electricitySerbia';
const electricitySerbia = Co2Factor(0.000718, 'Base Carbone ADEME > Électricité > mix moyen > Serbie');
const electricitySingaporeKey = 'electricitySingapore';
const electricitySingapore = Co2Factor(0.000499, 'Base Carbone ADEME > Électricité > mix moyen > Singapour');
const electricitySlovakRepublicKey = 'electricitySlovakRepublic';
const electricitySlovakRepublic = Co2Factor(0.000197, 'Base Carbone ADEME > Électricité > mix moyen > Slovaquie');
const electricitySloveniaKey = 'electricitySlovenia';
const electricitySlovenia = Co2Factor(0.000325, 'Base Carbone ADEME > Électricité > mix moyen > Slovénie');
const electricitySudanKey = 'electricitySudan';
const electricitySudan = Co2Factor(0.000344, 'Base Carbone ADEME > Électricité > mix moyen > Soudan');
const electricitySriLankaKey = 'electricitySriLanka';
const electricitySriLanka = Co2Factor(0.000379, 'Base Carbone ADEME > Électricité > mix moyen > SriLanka');
const electricitySwedenKey = 'electricitySweden';
const electricitySweden = Co2Factor(0.0000296, 'Base Carbone ADEME > Électricité > mix moyen > Suède');
const electricitySwitzerlandKey = 'electricitySwitzerland';
const electricitySwitzerland = Co2Factor(0.0000273, 'Base Carbone ADEME > Électricité > mix moyen > Suisse');
const electricityTajikistanKey = 'electricityTajikistan';
const electricityTajikistan = Co2Factor(0.0000143, 'Base Carbone ADEME > Électricité > mix moyen > Tadjikistan');
const electricityChineseTaipeiKey = 'electricityChineseTaipei';
const electricityChineseTaipei = Co2Factor(0.000624, 'Base Carbone ADEME > Électricité > mix moyen > Taïwan');
const electricityUnitedRepofTanzaniaKey = 'electricityUnitedRepofTanzania';
const electricityUnitedRepofTanzania = Co2Factor(0.000329, 'Base Carbone ADEME > Électricité > mix moyen > Tanzanie');
const electricityThailandKey = 'electricityThailand';
const electricityThailand = Co2Factor(0.000513, 'Base Carbone ADEME > Électricité > mix moyen > Thaïlande');
const electricityTogoKey = 'electricityTogo';
const electricityTogo = Co2Factor(0.000195, 'Base Carbone ADEME > Électricité > mix moyen > Togo');
const electricityTrinidadandTobagoKey = 'electricityTrinidadandTobago';
const electricityTrinidadandTobago = Co2Factor(0.0007, 'Base Carbone ADEME > Électricité > mix moyen > Trinité-et-Tobago');
const electricityTunisiaKey = 'electricityTunisia';
const electricityTunisia = Co2Factor(0.000463, 'Base Carbone ADEME > Électricité > mix moyen > Tunisie');
const electricityTurkmenistanKey = 'electricityTurkmenistan';
const electricityTurkmenistan = Co2Factor(0.000954, 'Base Carbone ADEME > Électricité > mix moyen > Turkménistan');
const electricityTurkeyKey = 'electricityTurkey';
const electricityTurkey = Co2Factor(0.00046, 'Base Carbone ADEME > Électricité > mix moyen > Turquie');
const electricityUkraineKey = 'electricityUkraine';
const electricityUkraine = Co2Factor(0.000392, 'Base Carbone ADEME > Électricité > mix moyen > Ukraine');
const electricityUruguayKey = 'electricityUruguay';
const electricityUruguay = Co2Factor(0.000081, 'Base Carbone ADEME > Électricité > mix moyen > Uruguay');
const electricityVenezuelaKey = 'electricityVenezuela';
const electricityVenezuela = Co2Factor(0.000264, 'Base Carbone ADEME > Électricité > mix moyen > Venezuela');
const electricityVietnamKey = 'electricityVietnam';
const electricityVietnam = Co2Factor(0.000432, 'Base Carbone ADEME > Électricité > mix moyen > ViêtNam');
const electricityYemenKey = 'electricityYemen';
const electricityYemen = Co2Factor(0.000655, 'Base Carbone ADEME > Électricité > mix moyen > Yémen');
const electricityZambiaKey = 'electricityZambia';
const electricityZambia = Co2Factor(0.00000268, 'Base Carbone ADEME > Électricité > mix moyen > Zambie');
const electricityZimbabweKey = 'electricityZimbabwe';
const electricityZimbabwe = Co2Factor(0.00066, 'Base Carbone ADEME > Électricité > mix moyen > Zimbabwe');
