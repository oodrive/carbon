import 'dart:math';

import 'package:carbon/translations/gen/l10n.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'criteria.dart';

part 'organization.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Organization extends HiveObject {
  Organization({this.name = '', this.year = 0});

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  @HiveField(0)
  String id = Random().nextInt(999999999).toString();

  @HiveField(1)
  String name;

  @HiveField(2)
  int year;

  /// Beware: non-growable list due to Hive
  @HiveField(3)
  List<Site> sites = <Site>[];

  void addSite(Site site) {
    sites = sites + [site];
  }

  double tCO2e() => sites.fold<double>(0, (previousValue, s) => previousValue + s.tCO2e());

  double scope1tCO2e() => sites.fold<double>(0, (previousValue, s) => previousValue + s.scope1.tCO2e());
  double scope2tCO2e() => sites.fold<double>(0, (previousValue, s) => previousValue + s.scope2.tCO2e());
  double scope3tCO2e() => sites.fold<double>(0, (previousValue, s) => previousValue + s.scope3.tCO2e());
}

@JsonSerializable()
@HiveType(typeId: 1)
class Site extends HiveObject {
  Site({this.name = ''});

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
  Map<String, dynamic> toJson() => _$SiteToJson(this);

  @HiveField(0)
  String id = Random().nextInt(999999999).toString();

  @HiveField(1)
  String name;

  @HiveField(2)
  Scope1 scope1 = Scope1();

  @HiveField(3)
  Scope2 scope2 = Scope2();

  @HiveField(4)
  Scope3 scope3 = Scope3();

  List<Scope> getScopes() => <Scope>[scope1, scope2, scope3];

  double tCO2e() => scope1.tCO2e() + scope2.tCO2e() + scope3.tCO2e();
}

abstract class Scope {
  String name(BuildContext context);
  String description(BuildContext context);
  Map<Criteria, List<Emission>> getCriteriaMap();

  double tCO2e() {
    double tCO2e = 0;

    getCriteriaMap().forEach((c, emissions) {
      for (final Emission e in emissions) {
        tCO2e += c.tCO2e(e);
      }
    });

    return tCO2e;
  }
}

@JsonSerializable()
@HiveType(typeId: 2)
class Scope1 extends HiveObject with Scope {
  Scope1();

  factory Scope1.fromJson(Map<String, dynamic> json) => _$Scope1FromJson(json);
  Map<String, dynamic> toJson() => _$Scope1ToJson(this);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(0)
  List<Emission> heatGeneration = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(1)
  List<Emission> electricityProduction = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(2)
  List<Emission> ownedTransport = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(3)
  List<Emission> otherEmissions = List<Emission>.empty(growable: true);

  @override
  String name(BuildContext context) => Translation.current.scopeNumber('1');

  @override
  String description(BuildContext context) => Translation.current.scope1Description;

  @override
  Map<Criteria, List<Emission>> getCriteriaMap() => {
        HeatGenerationCriteria.instance: heatGeneration,
        ElectricityProductionCriteria.instance: electricityProduction,
        OwnedTransportCriteria.instance: ownedTransport,
        OtherEmissionsCriteria.instance: otherEmissions,
      };
}

@JsonSerializable()
@HiveType(typeId: 3)
class Scope2 extends HiveObject with Scope {
  Scope2();

  factory Scope2.fromJson(Map<String, dynamic> json) => _$Scope2FromJson(json);
  Map<String, dynamic> toJson() => _$Scope2ToJson(this);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(0)
  List<Emission> electricityPurchase = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(1)
  List<Emission> otherEmissions = List<Emission>.empty(growable: true);

  @override
  String name(BuildContext context) => Translation.current.scopeNumber('2');

  @override
  String description(BuildContext context) => Translation.current.scope2Description;

  @override
  Map<Criteria, List<Emission>> getCriteriaMap() => {
        ElectricityPurchaseCriteria.instance: electricityPurchase,
        OtherEmissionsCriteria.instance: otherEmissions,
      };
}

@JsonSerializable()
@HiveType(typeId: 4)
class Scope3 extends HiveObject with Scope {
  Scope3();

  factory Scope3.fromJson(Map<String, dynamic> json) => _$Scope3FromJson(json);
  Map<String, dynamic> toJson() => _$Scope3ToJson(this);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(0)
  List<Emission> businessTravel = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(1)
  List<Emission> employeeCommuting = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(2)
  List<Emission> homeworkingEmissions = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(3)
  List<Emission> dataCenter = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(4)
  List<Emission> services = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(5)
  List<Emission> goods = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(6)
  List<Emission> capitalGoods = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(7)
  List<Emission> waste = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(8)
  List<Emission> productElectricityUsage = List<Emission>.empty(growable: true);

  @JsonKey(defaultValue: <Emission>[])
  @HiveField(9)
  List<Emission> otherEmissions = List<Emission>.empty(growable: true);

  @override
  String name(BuildContext context) => Translation.current.scopeNumber('3');

  @override
  String description(BuildContext context) => Translation.current.scope3Description;

  @override
  Map<Criteria, List<Emission>> getCriteriaMap() => {
        BusinessTravelCriteria.instance: businessTravel,
        EmployeeCommutingCriteria.instance: employeeCommuting,
        HomeworkingCriteria.instance: homeworkingEmissions,
        DataCenterCriteria.instance: dataCenter,
        ServicesCriteria.instance: services,
        GoodsCriteria.instance: goods,
        CapitalGoodsCriteria.instance: capitalGoods,
        WasteCriteria.instance: waste,
        ProductElectricityUsageCriteria.instance: productElectricityUsage,
        OtherEmissionsCriteria.instance: otherEmissions,
      };
}

@JsonSerializable()
@HiveType(typeId: 5)
class Emission extends HiveObject {
  Emission({this.type = ''});

  factory Emission.fromJson(Map<String, dynamic> json) => _$EmissionFromJson(json);
  Map<String, dynamic> toJson() => _$EmissionToJson(this);

  @HiveField(0)
  String type;

  @HiveField(1)
  double quantity = 0;

  @JsonKey(defaultValue: 1)
  @HiveField(2)
  int amortizationPeriod = 1;

  @JsonKey(defaultValue: 1)
  @HiveField(3)
  double adjustmentCoefficient = 1;

  @JsonKey(defaultValue: '')
  @HiveField(4)
  String note = '';
}

@JsonSerializable()
class OrganizationList extends HiveObject {
  OrganizationList(this.organizations);

  factory OrganizationList.fromJson(Map<String, dynamic> json) => _$OrganizationListFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationListToJson(this);

  List<Organization> organizations;
}

class OrganizationsState extends ChangeNotifier {
  OrganizationsState(this._box);

  final Box<Organization> _box;

  List<Organization> get organizations {
    final orgas = _box.values.toList();

    // Clean up emissions with obsolete keys
    for (final orga in orgas) {
      for (final site in orga.sites) {
        for (final scope in site.getScopes()) {
          for (final criteria in scope.getCriteriaMap().entries) {
            criteria.value.removeWhere((e) => !criteria.key.typeCo2Factors().containsKey(e.type));
          }
        }
      }
    }

    return orgas;
  }

  Future<void> add(Organization newOrga) async {
    await addAll([newOrga]);
  }

  Future<void> addAll(List<Organization> newOrganizations) async {
    // First we check if we need to delete the old one
    var previousOrganizations = organizations;
    for (final newOrga in newOrganizations) {
      for (final previousOrga in previousOrganizations) {
        if (previousOrga.id == newOrga.id) {
          await previousOrga.delete();
        }
      }
    }

    // We immediately notify and wait a bit in order to have a nicer animation
    notifyListeners();
    await Future<void>.delayed(300.milliseconds);

    // Now we add new orgas
    previousOrganizations = organizations;
    for (final newOrga in newOrganizations) {
      final previousYearOrga = previousOrganizations
          .firstOrNullWhere((otherOrga) => otherOrga.name == newOrga.name && otherOrga.year == newOrga.year - 1);
      if (previousYearOrga != null) {
        for (final site in previousYearOrga.sites) {
          // Automatically add previous sites and emissions that are not yet amortized
          final newSite = Site(name: site.name);

          //TODO not sure why it is needed, seems to be a Hive issue
          newOrga.addSite(newSite);

          for (int scopeIdx = 0; scopeIdx < 3; scopeIdx++) {
            final criteriaEntries = site.getScopes()[scopeIdx].getCriteriaMap().entries;
            for (int emissionListIdx = 0; emissionListIdx < criteriaEntries.length; emissionListIdx++) {
              for (final emission in criteriaEntries.elementAt(emissionListIdx).value) {
                if (emission.amortizationPeriod > 1) {
                  final newEmission = Emission(type: emission.type)
                    ..quantity = emission.quantity
                    ..amortizationPeriod = emission.amortizationPeriod
                    ..note = emission.note;
                  newSite.getScopes()[scopeIdx].getCriteriaMap().values.elementAt(emissionListIdx).add(newEmission);
                }
              }
            }
          }
        }
      }

      await _box.add(newOrga);
    }
    notifyListeners();
  }

  Future<void> delete(Organization orga) async {
    await orga.delete();
    notifyListeners();
  }

  Future<void> update() async {
    for (final item in organizations) {
      await item.save();
    }
    notifyListeners();
  }
}
