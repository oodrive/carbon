import 'package:carbon/translations/gen/l10n.dart';
import 'package:flutter/widgets.dart';

import 'co2_factors.g.dart';
import 'organization.dart';

extension Co2FactorExtension on Co2Factor {
  Co2Factor divideBy(double number) => Co2Factor(factor / number, source);
}

abstract class Criteria {
  String getTitle(BuildContext context);
  String getDescription(BuildContext context);
  String? getAdvice(BuildContext context);
  Map<String, String> typeLabels(BuildContext context);
  Map<String, Co2Factor> typeCo2Factors();
  Map<String, String> typeUnits(BuildContext context);
  bool hasAmortizationPeriod() => false;

  double tCO2e(Emission c) => (c.quantity * typeCo2Factors()[c.type]!.factor * c.adjustmentCoefficient) / c.amortizationPeriod;
}

class HeatGenerationCriteria extends Criteria {
  static final instance = HeatGenerationCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.heatGenerationTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.heatGenerationDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.heatGenerationAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        naturalGasKey: Translation.current.naturalGas,
        bioGasKey: Translation.current.bioGas,
        fuelOilKey: Translation.current.fuelOil,
        firewoodKey: Translation.current.firewood,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        naturalGasKey: naturalGas,
        bioGasKey: bioGas,
        fuelOilKey: fuelOil,
        firewoodKey: firewood,
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        naturalGasKey: Translation.current.unitKWh,
        bioGasKey: Translation.current.unitKWh,
        fuelOilKey: Translation.current.unitLiters,
        firewoodKey: Translation.current.unitKg,
      };
}

//TODO is it really useful? what about clean electricity production?
class ElectricityProductionCriteria extends HeatGenerationCriteria {
  static final instance = ElectricityProductionCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.electricityProductionTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.electricityProductionDesc;

  @override
  String? getAdvice(BuildContext context) => null;
}

class OwnedTransportCriteria extends Criteria {
  static final instance = OwnedTransportCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.ownedTransportTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.ownedTransportDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.ownedTransportAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        carKey: Translation.current.carDistance,
        electricCarKey: Translation.current.electricCarDistance,
        motorbikeKey: Translation.current.motorbikeDistance,
        petrolKey: Translation.current.petrol,
        dieselKey: Translation.current.diesel,
        lpgKey: Translation.current.lpg,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        carKey: car,
        electricCarKey: electricCar,
        motorbikeKey: motorbike,
        petrolKey: petrol,
        dieselKey: diesel,
        lpgKey: lpg,
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        carKey: Translation.current.unitKm,
        electricCarKey: Translation.current.unitKm,
        motorbikeKey: Translation.current.unitKm,
        petrolKey: Translation.current.unitLiters,
        dieselKey: Translation.current.unitLiters,
        lpgKey: Translation.current.unitLiters,
      };
}

class ElectricityPurchaseCriteria extends Criteria {
  static final instance = ElectricityPurchaseCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.electricityPurchaseTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.electricityPurchaseDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.electricityPurchaseAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        electricityFranceKey: Translation.current.countryFrance,
        electricitySouthAfricaKey: Translation.current.countrySouthAfrica,
        electricityAlbaniaKey: Translation.current.countryAlbania,
        electricityAlgeriaKey: Translation.current.countryAlgeria,
        electricityGermanyKey: Translation.current.countryGermany,
        electricityAngolaKey: Translation.current.countryAngola,
        electricityNetherlandsAntillesKey: Translation.current.countryNetherlandsAntilles,
        electricitySaudiArabiaKey: Translation.current.countrySaudiArabia,
        electricityArgentinaKey: Translation.current.countryArgentina,
        electricityArmeniaKey: Translation.current.countryArmenia,
        electricityAustraliaKey: Translation.current.countryAustralia,
        electricityAustriaKey: Translation.current.countryAustria,
        electricityAzerbaijanKey: Translation.current.countryAzerbaijan,
        electricityBahrainKey: Translation.current.countryBahrain,
        electricityBangladeshKey: Translation.current.countryBangladesh,
        electricityBelarusKey: Translation.current.countryBelarus,
        electricityBelgiumKey: Translation.current.countryBelgium,
        electricityBeninKey: Translation.current.countryBenin,
        electricityMyanmarKey: Translation.current.countryMyanmar,
        electricityBoliviaKey: Translation.current.countryBolivia,
        electricityBosniaandHerzegovinaKey: Translation.current.countryBosniaandHerzegovina,
        electricityBotswanaKey: Translation.current.countryBotswana,
        electricityBrazilKey: Translation.current.countryBrazil,
        electricityBruneiDarussalamKey: Translation.current.countryBruneiDarussalam,
        electricityBulgariaKey: Translation.current.countryBulgaria,
        electricityCambodiaKey: Translation.current.countryCambodia,
        electricityCameroonKey: Translation.current.countryCameroon,
        electricityCanadaKey: Translation.current.countryCanada,
        electricityChileKey: Translation.current.countryChile,
        electricityChinaKey: Translation.current.countryChina,
        electricityCyprusKey: Translation.current.countryCyprus,
        electricityColombiaKey: Translation.current.countryColombia,
        electricityCongoKey: Translation.current.countryCongo,
        electricityDPRofKoreanorthKey: Translation.current.countryDPRofKoreanorth,
        electricitySouthKoreaKey: Translation.current.countrySouthKorea,
        electricityCostaRicaKey: Translation.current.countryCostaRica,
        electricityCotedIvoireKey: Translation.current.countryCotedIvoire,
        electricityCroatiaKey: Translation.current.countryCroatia,
        electricityCubaKey: Translation.current.countryCuba,
        electricityDenmarkKey: Translation.current.countryDenmark,
        electricityDominicanRepublicKey: Translation.current.countryDominicanRepublic,
        electricityEgyptKey: Translation.current.countryEgypt,
        electricityElSalvadorKey: Translation.current.countryElSalvador,
        electricityUnitedArabEmiratesKey: Translation.current.countryUnitedArabEmirates,
        electricityEcuadorKey: Translation.current.countryEcuador,
        electricityEritreaKey: Translation.current.countryEritrea,
        electricitySpainKey: Translation.current.countrySpain,
        electricityEstoniaKey: Translation.current.countryEstonia,
        electricityUnitedStatesKey: Translation.current.countryUnitedStates,
        electricityEthiopiaKey: Translation.current.countryEthiopia,
        electricityFinlandKey: Translation.current.countryFinland,
        electricitySyrianArabRepublicKey: Translation.current.countrySyrianArabRepublic,
        electricityGabonKey: Translation.current.countryGabon,
        electricityGeorgiaKey: Translation.current.countryGeorgia,
        electricityGhanaKey: Translation.current.countryGhana,
        electricityGibraltarKey: Translation.current.countryGibraltar,
        electricityGreeceKey: Translation.current.countryGreece,
        electricityGuatemalaKey: Translation.current.countryGuatemala,
        electricityHaitiKey: Translation.current.countryHaiti,
        electricityHondurasKey: Translation.current.countryHonduras,
        electricityHungaryKey: Translation.current.countryHungary,
        electricityIndiaKey: Translation.current.countryIndia,
        electricityIndonesiaKey: Translation.current.countryIndonesia,
        electricityIraqKey: Translation.current.countryIraq,
        electricityIrelandKey: Translation.current.countryIreland,
        electricityIcelandKey: Translation.current.countryIceland,
        electricityIsraelKey: Translation.current.countryIsrael,
        electricityItalyKey: Translation.current.countryItaly,
        electricityJamaicaKey: Translation.current.countryJamaica,
        electricityJapanKey: Translation.current.countryJapan,
        electricityJordanKey: Translation.current.countryJordan,
        electricityKazakhstanKey: Translation.current.countryKazakhstan,
        electricityKenyaKey: Translation.current.countryKenya,
        electricityKyrgyzstanKey: Translation.current.countryKyrgyzstan,
        electricityKosovoKey: Translation.current.countryKosovo,
        electricityKuwaitKey: Translation.current.countryKuwait,
        electricityLatviaKey: Translation.current.countryLatvia,
        electricityLebanonKey: Translation.current.countryLebanon,
        electricityLibyaKey: Translation.current.countryLibya,
        electricityLithuaniaKey: Translation.current.countryLithuania,
        electricityLuxembourgKey: Translation.current.countryLuxembourg,
        electricityFYRofMacedoniaKey: Translation.current.countryFYRofMacedonia,
        electricityMalaysiaKey: Translation.current.countryMalaysia,
        electricityMaltaKey: Translation.current.countryMalta,
        electricityMoroccoKey: Translation.current.countryMorocco,
        electricityMexicoKey: Translation.current.countryMexico,
        electricityRepublicofMoldovaKey: Translation.current.countryRepublicofMoldova,
        electricityMongoliaKey: Translation.current.countryMongolia,
        electricityMontenegroKey: Translation.current.countryMontenegro,
        electricityMozambiqueKey: Translation.current.countryMozambique,
        electricityNamibiaKey: Translation.current.countryNamibia,
        electricityNepalKey: Translation.current.countryNepal,
        electricityNicaraguaKey: Translation.current.countryNicaragua,
        electricityNigeriaKey: Translation.current.countryNigeria,
        electricityNorwayKey: Translation.current.countryNorway,
        electricityNewZealandKey: Translation.current.countryNewZealand,
        electricityOmanKey: Translation.current.countryOman,
        electricityUzbekistanKey: Translation.current.countryUzbekistan,
        electricityPakistanKey: Translation.current.countryPakistan,
        electricityPanamaKey: Translation.current.countryPanama,
        electricityNetherlandsKey: Translation.current.countryNetherlands,
        electricityPeruKey: Translation.current.countryPeru,
        electricityPhilippinesKey: Translation.current.countryPhilippines,
        electricityPolandKey: Translation.current.countryPoland,
        electricityPortugalKey: Translation.current.countryPortugal,
        electricityQatarKey: Translation.current.countryQatar,
        electricityDemRepofCongoKey: Translation.current.countryDemRepofCongo,
        electricityCzechRepublicKey: Translation.current.countryCzechRepublic,
        electricityRomaniaKey: Translation.current.countryRomania,
        electricityUnitedKingdomKey: Translation.current.countryUnitedKingdom,
        electricityRussianFederationKey: Translation.current.countryRussianFederation,
        electricitySenegalKey: Translation.current.countrySenegal,
        electricitySerbiaKey: Translation.current.countrySerbia,
        electricitySingaporeKey: Translation.current.countrySingapore,
        electricitySlovakRepublicKey: Translation.current.countrySlovakRepublic,
        electricitySloveniaKey: Translation.current.countrySlovenia,
        electricitySudanKey: Translation.current.countrySudan,
        electricitySriLankaKey: Translation.current.countrySriLanka,
        electricitySwedenKey: Translation.current.countrySweden,
        electricitySwitzerlandKey: Translation.current.countrySwitzerland,
        electricityTajikistanKey: Translation.current.countryTajikistan,
        electricityChineseTaipeiKey: Translation.current.countryChineseTaipei,
        electricityUnitedRepofTanzaniaKey: Translation.current.countryUnitedRepofTanzania,
        electricityThailandKey: Translation.current.countryThailand,
        electricityTogoKey: Translation.current.countryTogo,
        electricityTrinidadandTobagoKey: Translation.current.countryTrinidadandTobago,
        electricityTunisiaKey: Translation.current.countryTunisia,
        electricityTurkmenistanKey: Translation.current.countryTurkmenistan,
        electricityTurkeyKey: Translation.current.countryTurkey,
        electricityUkraineKey: Translation.current.countryUkraine,
        electricityUruguayKey: Translation.current.countryUruguay,
        electricityVenezuelaKey: Translation.current.countryVenezuela,
        electricityVietnamKey: Translation.current.countryVietnam,
        electricityYemenKey: Translation.current.countryYemen,
        electricityZambiaKey: Translation.current.countryZambia,
        electricityZimbabweKey: Translation.current.countryZimbabwe,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        electricityFranceKey: electricityFrance,
        electricitySouthAfricaKey: electricitySouthAfrica,
        electricityAlbaniaKey: electricityAlbania,
        electricityAlgeriaKey: electricityAlgeria,
        electricityGermanyKey: electricityGermany,
        electricityAngolaKey: electricityAngola,
        electricityNetherlandsAntillesKey: electricityNetherlandsAntilles,
        electricitySaudiArabiaKey: electricitySaudiArabia,
        electricityArgentinaKey: electricityArgentina,
        electricityArmeniaKey: electricityArmenia,
        electricityAustraliaKey: electricityAustralia,
        electricityAustriaKey: electricityAustria,
        electricityAzerbaijanKey: electricityAzerbaijan,
        electricityBahrainKey: electricityBahrain,
        electricityBangladeshKey: electricityBangladesh,
        electricityBelarusKey: electricityBelarus,
        electricityBelgiumKey: electricityBelgium,
        electricityBeninKey: electricityBenin,
        electricityMyanmarKey: electricityMyanmar,
        electricityBoliviaKey: electricityBolivia,
        electricityBosniaandHerzegovinaKey: electricityBosniaandHerzegovina,
        electricityBotswanaKey: electricityBotswana,
        electricityBrazilKey: electricityBrazil,
        electricityBruneiDarussalamKey: electricityBruneiDarussalam,
        electricityBulgariaKey: electricityBulgaria,
        electricityCambodiaKey: electricityCambodia,
        electricityCameroonKey: electricityCameroon,
        electricityCanadaKey: electricityCanada,
        electricityChileKey: electricityChile,
        electricityChinaKey: electricityChina,
        electricityCyprusKey: electricityCyprus,
        electricityColombiaKey: electricityColombia,
        electricityCongoKey: electricityCongo,
        electricityDPRofKoreanorthKey: electricityDPRofKoreanorth,
        electricitySouthKoreaKey: electricitySouthKorea,
        electricityCostaRicaKey: electricityCostaRica,
        electricityCotedIvoireKey: electricityCotedIvoire,
        electricityCroatiaKey: electricityCroatia,
        electricityCubaKey: electricityCuba,
        electricityDenmarkKey: electricityDenmark,
        electricityDominicanRepublicKey: electricityDominicanRepublic,
        electricityEgyptKey: electricityEgypt,
        electricityElSalvadorKey: electricityElSalvador,
        electricityUnitedArabEmiratesKey: electricityUnitedArabEmirates,
        electricityEcuadorKey: electricityEcuador,
        electricityEritreaKey: electricityEritrea,
        electricitySpainKey: electricitySpain,
        electricityEstoniaKey: electricityEstonia,
        electricityUnitedStatesKey: electricityUnitedStates,
        electricityEthiopiaKey: electricityEthiopia,
        electricityFinlandKey: electricityFinland,
        electricitySyrianArabRepublicKey: electricitySyrianArabRepublic,
        electricityGabonKey: electricityGabon,
        electricityGeorgiaKey: electricityGeorgia,
        electricityGhanaKey: electricityGhana,
        electricityGibraltarKey: electricityGibraltar,
        electricityGreeceKey: electricityGreece,
        electricityGuatemalaKey: electricityGuatemala,
        electricityHaitiKey: electricityHaiti,
        electricityHondurasKey: electricityHonduras,
        electricityHungaryKey: electricityHungary,
        electricityIndiaKey: electricityIndia,
        electricityIndonesiaKey: electricityIndonesia,
        electricityIraqKey: electricityIraq,
        electricityIrelandKey: electricityIreland,
        electricityIcelandKey: electricityIceland,
        electricityIsraelKey: electricityIsrael,
        electricityItalyKey: electricityItaly,
        electricityJamaicaKey: electricityJamaica,
        electricityJapanKey: electricityJapan,
        electricityJordanKey: electricityJordan,
        electricityKazakhstanKey: electricityKazakhstan,
        electricityKenyaKey: electricityKenya,
        electricityKyrgyzstanKey: electricityKyrgyzstan,
        electricityKosovoKey: electricityKosovo,
        electricityKuwaitKey: electricityKuwait,
        electricityLatviaKey: electricityLatvia,
        electricityLebanonKey: electricityLebanon,
        electricityLibyaKey: electricityLibya,
        electricityLithuaniaKey: electricityLithuania,
        electricityLuxembourgKey: electricityLuxembourg,
        electricityFYRofMacedoniaKey: electricityFYRofMacedonia,
        electricityMalaysiaKey: electricityMalaysia,
        electricityMaltaKey: electricityMalta,
        electricityMoroccoKey: electricityMorocco,
        electricityMexicoKey: electricityMexico,
        electricityRepublicofMoldovaKey: electricityRepublicofMoldova,
        electricityMongoliaKey: electricityMongolia,
        electricityMontenegroKey: electricityMontenegro,
        electricityMozambiqueKey: electricityMozambique,
        electricityNamibiaKey: electricityNamibia,
        electricityNepalKey: electricityNepal,
        electricityNicaraguaKey: electricityNicaragua,
        electricityNigeriaKey: electricityNigeria,
        electricityNorwayKey: electricityNorway,
        electricityNewZealandKey: electricityNewZealand,
        electricityOmanKey: electricityOman,
        electricityUzbekistanKey: electricityUzbekistan,
        electricityPakistanKey: electricityPakistan,
        electricityPanamaKey: electricityPanama,
        electricityNetherlandsKey: electricityNetherlands,
        electricityPeruKey: electricityPeru,
        electricityPhilippinesKey: electricityPhilippines,
        electricityPolandKey: electricityPoland,
        electricityPortugalKey: electricityPortugal,
        electricityQatarKey: electricityQatar,
        electricityDemRepofCongoKey: electricityDemRepofCongo,
        electricityCzechRepublicKey: electricityCzechRepublic,
        electricityRomaniaKey: electricityRomania,
        electricityUnitedKingdomKey: electricityUnitedKingdom,
        electricityRussianFederationKey: electricityRussianFederation,
        electricitySenegalKey: electricitySenegal,
        electricitySerbiaKey: electricitySerbia,
        electricitySingaporeKey: electricitySingapore,
        electricitySlovakRepublicKey: electricitySlovakRepublic,
        electricitySloveniaKey: electricitySlovenia,
        electricitySudanKey: electricitySudan,
        electricitySriLankaKey: electricitySriLanka,
        electricitySwedenKey: electricitySweden,
        electricitySwitzerlandKey: electricitySwitzerland,
        electricityTajikistanKey: electricityTajikistan,
        electricityChineseTaipeiKey: electricityChineseTaipei,
        electricityUnitedRepofTanzaniaKey: electricityUnitedRepofTanzania,
        electricityThailandKey: electricityThailand,
        electricityTogoKey: electricityTogo,
        electricityTrinidadandTobagoKey: electricityTrinidadandTobago,
        electricityTunisiaKey: electricityTunisia,
        electricityTurkmenistanKey: electricityTurkmenistan,
        electricityTurkeyKey: electricityTurkey,
        electricityUkraineKey: electricityUkraine,
        electricityUruguayKey: electricityUruguay,
        electricityVenezuelaKey: electricityVenezuela,
        electricityVietnamKey: electricityVietnam,
        electricityYemenKey: electricityYemen,
        electricityZambiaKey: electricityZambia,
        electricityZimbabweKey: electricityZimbabwe,
      };

  @override
  Map<String, String> typeUnits(BuildContext context) =>
      typeCo2Factors().map((key, value) => MapEntry(key, Translation.current.unitKWh));
}

class BusinessTravelCriteria extends Criteria {
  static final instance = BusinessTravelCriteria();
  static const premiumLongHaulPlaneKey = 'premiumLongHaulPlane';

  @override
  String getTitle(BuildContext context) => Translation.current.businessTravelTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.businessTravelDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.businessTravelAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        tgvKey: Translation.current.tgv,
        terKey: Translation.current.ter,
        rerKey: Translation.current.rer,
        subwayKey: Translation.current.subway,
        shortHaulPlaneKey: Translation.current.shortHaulPlane,
        mediumHaulPlaneKey: Translation.current.mediumHaulPlane,
        longHaulPlaneKey: Translation.current.longHaulPlane,
        premiumLongHaulPlaneKey: Translation.current.premiumLongHaulPlane,
        carKey: Translation.current.taxi,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        tgvKey: tgv,
        terKey: ter,
        rerKey: rer,
        subwayKey: subway,
        shortHaulPlaneKey: shortHaulPlane,
        mediumHaulPlaneKey: mediumHaulPlane,
        longHaulPlaneKey: longHaulPlane,
        premiumLongHaulPlaneKey:
            Co2Factor(longHaulPlane.factor * 2, "ADEME, Base Carbone + facteur d'émission ICAO Carbon Emissions Calculator"),
        carKey: car, //TODO add car construction and upstream emissions?
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        tgvKey: Translation.current.unitKmPassenger,
        terKey: Translation.current.unitKmPassenger,
        rerKey: Translation.current.unitKmPassenger,
        subwayKey: Translation.current.unitKmPassenger,
        shortHaulPlaneKey: Translation.current.unitKmPassenger,
        mediumHaulPlaneKey: Translation.current.unitKmPassenger,
        longHaulPlaneKey: Translation.current.unitKmPassenger,
        premiumLongHaulPlaneKey: Translation.current.unitKmPassenger,
        carKey: Translation.current.unitKm,
      };
}

class EmployeeCommutingCriteria extends Criteria {
  static final instance = EmployeeCommutingCriteria();
  static const employeeNumberIleDeFranceKey = 'employeeNumberIleDeFrance';
  static const employeeNumberProvinceKey = 'employeeNumberProvince';

  @override
  String getTitle(BuildContext context) => Translation.current.employeeCommutingTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.employeeCommutingDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.employeeCommutingAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        employeeNumberIleDeFranceKey: Translation.current.employeeNumberIleDeFrance,
        employeeNumberProvinceKey: Translation.current.employeeNumberProvince,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        // working days * average distance * 2 (return) * (public transport + car + motorbike)
        employeeNumberIleDeFranceKey: Co2Factor(
          220 * 10.7 * 2 * (((subway.factor + rer.factor) / 2) * 0.432 + car.factor * 0.415 + motorbike.factor * 0.031),
          'ADEME Base Carbone + https://www.insee.fr/fr/statistiques/2555642#tableau-Figure_1 + https://www.institutparisregion.fr/fileadmin/NewEtudes/Etude_813/NR_542_web.pdf',
        ),
        employeeNumberProvinceKey: Co2Factor(
          220 * 11.1 * 2 * (((subway.factor + rer.factor) / 2) * 0.076 + car.factor * 0.779 + motorbike.factor * 0.016),
          'ADEME Base Carbone + https://www.insee.fr/fr/statistiques/2555642#tableau-Figure_1 + https://www.institutparisregion.fr/fileadmin/NewEtudes/Etude_813/NR_542_web.pdf',
        ),
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        employeeNumberIleDeFranceKey: Translation.current.unitEmployees,
        employeeNumberProvinceKey: Translation.current.unitEmployees,
      };
}

class HomeworkingCriteria extends ElectricityPurchaseCriteria {
  static final instance = HomeworkingCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.homeworkingTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.homeworkingDesc;

  @override
  String? getAdvice(BuildContext context) => null;
}

class DataCenterCriteria extends ElectricityPurchaseCriteria {
  static final instance = DataCenterCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.dataCenterTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.dataCenterDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.dataCenterAdvice;
}

class ServicesCriteria extends Criteria {
  static final instance = ServicesCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.servicesTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.servicesDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.servicesAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        serviceConstructionKey: Translation.current.serviceConstruction,
        serviceAssuranceBankKey: Translation.current.serviceAssuranceBank,
        serviceMailKey: Translation.current.serviceMail,
        serviceTelecommunicationsKey: Translation.current.serviceTelecommunications,
        serviceRestaurationKey: Translation.current.serviceRestauration,
        servicePrintKey: Translation.current.servicePrint,
        serviceEditionKey: Translation.current.serviceEdition,
        serviceMovieKey: Translation.current.serviceMovie,
        serviceMachinesInstallationKey: Translation.current.serviceMachinesInstallation,
        serviceLandTransportKey: Translation.current.serviceLandTransport,
        serviceMaritimeTransportKey: Translation.current.serviceMaritimeTransport,
        serviceAirTransportKey: Translation.current.serviceAirTransport,
        serviceTransportAuxiliariesKey: Translation.current.serviceTransportAuxiliaries,
        servicePublicAdministrationKey: Translation.current.servicePublicAdministration,
        serviceEducationKey: Translation.current.serviceEducation,
        serviceRADKey: Translation.current.serviceRAD,
        serviceHealthKey: Translation.current.serviceHealth,
        serviceSocialActionKey: Translation.current.serviceSocialAction,
        serviceArtisticActivitiesKey: Translation.current.serviceArtisticActivities,
        serviceSportActivitiesKey: Translation.current.serviceSportActivities,
        serviceAssociationActivitiesKey: Translation.current.serviceAssociationActivities,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        serviceConstructionKey: serviceConstruction.divideBy(1000),
        serviceAssuranceBankKey: serviceAssuranceBank.divideBy(1000),
        serviceMailKey: serviceMail.divideBy(1000),
        serviceTelecommunicationsKey: serviceTelecommunications.divideBy(1000),
        serviceRestaurationKey: serviceRestauration.divideBy(1000),
        servicePrintKey: servicePrint.divideBy(1000),
        serviceEditionKey: serviceEdition.divideBy(1000),
        serviceMovieKey: serviceMovie.divideBy(1000),
        serviceMachinesInstallationKey: serviceMachinesInstallation.divideBy(1000),
        serviceLandTransportKey: serviceLandTransport.divideBy(1000),
        serviceMaritimeTransportKey: serviceMaritimeTransport.divideBy(1000),
        serviceAirTransportKey: serviceAirTransport.divideBy(1000),
        serviceTransportAuxiliariesKey: serviceTransportAuxiliaries.divideBy(1000),
        servicePublicAdministrationKey: servicePublicAdministration.divideBy(1000),
        serviceEducationKey: serviceEducation.divideBy(1000),
        serviceRADKey: serviceRAD.divideBy(1000),
        serviceHealthKey: serviceHealth.divideBy(1000),
        serviceSocialActionKey: serviceSocialAction.divideBy(1000),
        serviceArtisticActivitiesKey: serviceArtisticActivities.divideBy(1000),
        serviceSportActivitiesKey: serviceSportActivities.divideBy(1000),
        serviceAssociationActivitiesKey: serviceAssociationActivities.divideBy(1000),
      };

  @override
  Map<String, String> typeUnits(BuildContext context) =>
      typeCo2Factors().map((key, value) => MapEntry(key, Translation.current.unitEur));
}

class GoodsCriteria extends Criteria {
  static final instance = GoodsCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.goodsTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.goodsDesc;

  @override
  String? getAdvice(BuildContext context) => null;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        officeConsumablesKey: Translation.current.officeConsumables,
        officeSuppliesKey: Translation.current.officeSupplies,
        agriculturalProductsKey: Translation.current.agriculturalProducts,
        transformedFoodProductsKey: Translation.current.transformedFoodProducts,
        mineralProductsKey: Translation.current.mineralProducts,
        plasticKey: Translation.current.plastic,
        paperKey: Translation.current.paper,
        woodKey: Translation.current.wood,
        clothesKey: Translation.current.clothes,
        furnitureKey: Translation.current.furniture,
        chemicalProductsKey: Translation.current.chemicalProducts,
        pharmaceuticalProductsKey: Translation.current.pharmaceuticalProducts,
        metalsKey: Translation.current.metals,
        metalProductsKey: Translation.current.metalProducts,
        machinesKey: Translation.current.machines,
        computerProductsKey: Translation.current.computerProducts,
        transportationEquipmentKey: Translation.current.transportationEquipment,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        officeConsumablesKey: officeConsumables,
        officeSuppliesKey: officeSupplies,
        agriculturalProductsKey: agriculturalProducts.divideBy(1000),
        transformedFoodProductsKey: transformedFoodProducts.divideBy(1000),
        mineralProductsKey: mineralProducts.divideBy(1000),
        plasticKey: plastic.divideBy(1000),
        paperKey: paper.divideBy(1000),
        woodKey: wood.divideBy(1000),
        clothesKey: clothes.divideBy(1000),
        furnitureKey: furniture.divideBy(1000),
        chemicalProductsKey: chemicalProducts.divideBy(1000),
        pharmaceuticalProductsKey: pharmaceuticalProducts.divideBy(1000),
        metalsKey: metals.divideBy(1000),
        metalProductsKey: metalProducts.divideBy(1000),
        machinesKey: machines.divideBy(1000),
        computerProductsKey: computerProducts.divideBy(1000),
        transportationEquipmentKey: transportationEquipment.divideBy(1000),
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        officeConsumablesKey: Translation.current.unitEur,
        officeSuppliesKey: Translation.current.unitEur,
        agriculturalProductsKey: Translation.current.unitEur,
        transformedFoodProductsKey: Translation.current.unitEur,
        mineralProductsKey: Translation.current.unitEur,
        plasticKey: Translation.current.unitEur,
        paperKey: Translation.current.unitEur,
        woodKey: Translation.current.unitEur,
        clothesKey: Translation.current.unitEur,
        furnitureKey: Translation.current.unitEur,
        chemicalProductsKey: Translation.current.unitEur,
        pharmaceuticalProductsKey: Translation.current.unitEur,
        metalsKey: Translation.current.unitEur,
        metalProductsKey: Translation.current.unitEur,
        machinesKey: Translation.current.unitEur,
        computerProductsKey: Translation.current.unitEur,
        transportationEquipmentKey: Translation.current.unitEur,
      };
}

class CapitalGoodsCriteria extends Criteria {
  static final instance = CapitalGoodsCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.capitalGoodsTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.capitalGoodsDesc;

  @override
  String? getAdvice(BuildContext context) => Translation.current.capitalGoodsAdvice;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        officeKey: Translation.current.office,
        screen21inchesKey: Translation.current.screen21inches,
        screen23inchesKey: Translation.current.screen23inches,
        printerKey: Translation.current.printer,
        photocopiersKey: Translation.current.photocopiers,
        desktopComputerKey: Translation.current.desktopComputer,
        laptopKey: Translation.current.laptop,
        rackKey: Translation.current.rack,
        serverKey: Translation.current.server,
        smartphoneKey: Translation.current.smartphone,
        tabletKey: Translation.current.tablet,
        videoProjectorKey: Translation.current.videoProjector,
        tvKey: Translation.current.tv,
        carKey: Translation.current.car,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        officeKey: office,
        screen21inchesKey: screen21inches,
        screen23inchesKey: screen23inches,
        printerKey: printer,
        photocopiersKey: photocopiers,
        desktopComputerKey: desktopComputer,
        laptopKey: laptop,
        rackKey: rack,
        serverKey: server,
        smartphoneKey: smartphone,
        tabletKey: tablet,
        videoProjectorKey: videoProjector,
        tvKey: tv,
        carKey: Co2Factor(car.factor * 1.2, car.source), // TODO add truck and other goods
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        officeKey: Translation.current.unitSquareMeter,
        screen21inchesKey: Translation.current.unit,
        screen23inchesKey: Translation.current.unit,
        printerKey: Translation.current.unit,
        photocopiersKey: Translation.current.unit,
        desktopComputerKey: Translation.current.unit,
        laptopKey: Translation.current.unit,
        rackKey: Translation.current.unit,
        serverKey: Translation.current.unit,
        smartphoneKey: Translation.current.unit,
        tabletKey: Translation.current.unit,
        videoProjectorKey: Translation.current.unit,
        tvKey: Translation.current.unit,
        carKey: Translation.current.unit,
      };

  @override
  bool hasAmortizationPeriod() => true;
}

class WasteCriteria extends Criteria {
  static final instance = WasteCriteria();
  static const glassWasteKey = 'glassWaste';
  static const metalWasteKey = 'metalWaste';

  @override
  String getTitle(BuildContext context) => Translation.current.wasteTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.wasteDesc;

  @override
  String? getAdvice(BuildContext context) => null;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        paperWasteKey: Translation.current.paperWaste,
        cardboardWasteKey: Translation.current.cardboardWaste,
        glassWasteKey: Translation.current.glassWaste,
        metalWasteKey: Translation.current.metalWaste,
        plasticWasteKey: Translation.current.plasticWaste,
        householdWasteKey: Translation.current.householdWaste,
        waterWasteKey: Translation.current.waterWaste,
      }; //TODO add construction waste

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        paperWasteKey: paperWaste,
        cardboardWasteKey: cardboardWaste,
        glassWasteKey: mineralsWaste,
        metalWasteKey: mineralsWaste,
        plasticWasteKey: plasticWaste,
        householdWasteKey: householdWaste,
        waterWasteKey: waterWaste,
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        paperWasteKey: Translation.current.unitTons,
        cardboardWasteKey: Translation.current.unitTons,
        glassWasteKey: Translation.current.unitTons,
        metalWasteKey: Translation.current.unitTons,
        plasticWasteKey: Translation.current.unitTons,
        householdWasteKey: Translation.current.unitTons,
        waterWasteKey: Translation.current.unitCubicMeter,
      };
}

class ProductElectricityUsageCriteria extends ElectricityPurchaseCriteria {
  static final instance = ProductElectricityUsageCriteria();

  @override
  String getTitle(BuildContext context) => Translation.current.productElectricityUsageTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.productElectricityUsageDesc;

  @override
  String? getAdvice(BuildContext context) => null;
}

class OtherEmissionsCriteria extends Criteria {
  static final instance = OtherEmissionsCriteria();
  static const otherEmissionsKey = 'otherEmissions';

  @override
  String getTitle(BuildContext context) => Translation.current.otherCriteriaTitle;

  @override
  String getDescription(BuildContext context) => Translation.current.otherCriteriaDesc;

  @override
  String? getAdvice(BuildContext context) => null;

  @override
  Map<String, String> typeLabels(BuildContext context) => {
        otherEmissionsKey: Translation.current.otherEmissions,
      };

  @override
  Map<String, Co2Factor> typeCo2Factors() => {
        otherEmissionsKey: const Co2Factor(1, ''),
      };

  @override
  Map<String, String> typeUnits(BuildContext context) => {
        otherEmissionsKey: Translation.current.unitTonsCO2e,
      };

  @override
  bool hasAmortizationPeriod() => true;
}
