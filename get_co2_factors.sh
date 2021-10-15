#!/bin/sh

query_ademe_base_carbone () {
    Q=`echo $1 | sed 's/ /%20/g'`
    API_URL="https://koumoul.com/s/data-fair/api/v1/datasets/base-carbone(r)/lines?format=json&q=$Q&qs=Valide+g%C3%A9n%C3%A9rique&q_mode=simple&Type_Ligne_in=El%C3%A9ment&size=1&select=Nom_base_fran%C3%A7ais,Nom_fronti%C3%A8re_fran%C3%A7ais,Nom_attribut_fran%C3%A7ais,Total_poste_non_d%C3%A9compos%C3%A9,Sous-localisation_g%C3%A9ographique_fran%C3%A7ais,Sous-localisation_g%C3%A9ographique_anglais&sampling=neighbors"

    curl -s "$API_URL" > result.json

    FACTOR=`cat result.json | grep "Total_poste_non_décomposé" | sed 's/.*: "//' | sed 's/",//' | sed 's/,/./' | sed 's/^-//' | sed 's/E/\\*10\\^/'`
    FACTOR=`echo "$FACTOR / 1000" | bc -l | sed 's/0*$//' | sed 's/^\./0\./' | sed 's/\.$//'`
    
    BASE=`cat result.json | grep "Nom_base_français" | sed 's/.*: "//' | sed 's/",//' | sed 's/,/, /g' | sed 's/  / /g' | sed "s/'/\\\\\\'/g"`
    FRONTIER=`cat result.json | grep "Nom_frontière_français" | sed 's/.*: "//' | sed 's/",//' | sed 's/,/, /g' | sed 's/  / /g' | sed "s/'/\\\\\\'/g"`
    ATTRIBUTE=`cat result.json | grep "Nom_attribut_français" | sed 's/.*: "//' | sed 's/",//' | sed 's/,/, /g' | sed 's/  / /g' | sed "s/'/\\\\\\'/g"`
    SUB_LOCATION=`cat result.json | grep "Sous-localisation_géographique_français" | sed 's/.*: "//' | sed 's/",//' | sed 's/ //g' | sed "s/'//g" | sed 's/\.//g' | sed 's/(//g' | sed 's/)//g'`

    SOURCE="Base Carbone ADEME > $BASE"
    if ! [ -z "$FRONTIER" ] ; then
        SOURCE="$SOURCE > $FRONTIER"
    fi
    if ! [ -z "$ATTRIBUTE" ] ; then
        SOURCE="$SOURCE > $ATTRIBUTE"
    fi
    if ! [ -z "$SUB_LOCATION" ] ; then
        SOURCE="$SOURCE > $SUB_LOCATION"
    fi

    COUNTRY_VAR=`cat result.json | grep "Sous-localisation_géographique_anglais" | sed 's/.*: "//' | sed 's/",//' | sed 's/ //g' | sed "s/'//g" | sed 's/\.//g' | sed 's/(//g' | sed 's/)//g' | sed 's/ô/o/g'`

    rm result.json
}

add_const_to_dart_file () {
    echo "const $1Key = '$1';" >> ./lib/model/co2_factors.g.dart
    echo "const $1 = Co2Factor($FACTOR, '$SOURCE');" >> ./lib/model/co2_factors.g.dart
}

ademe_base_carbone () {
    query_ademe_base_carbone "$2"
    add_const_to_dart_file "$1"
}

ademe_base_carbone_electricity_country () {
    query_ademe_base_carbone "$1"
    add_const_to_dart_file "electricity$COUNTRY_VAR"
}

echo "// File generated with get_co2_factors.sh script, do not manually edit

class Co2Factor {
  final double factor;
  final String source;

  const Co2Factor(this.factor, this.source);
}
" > ./lib/model/co2_factors.g.dart

# Heat generation
ademe_base_carbone "naturalGas" "gaz naturel"
ademe_base_carbone "bioGas" "Biomethane kWhPCI"
ademe_base_carbone "fuelOil" "Fioul domestique litre"
ademe_base_carbone "firewood" "Bois buche kg"

# Owned transport consumption
ademe_base_carbone "car" "Voiture motorisation moyenne"
ademe_base_carbone "electricCar" "Voiture Berline Electrique"
ademe_base_carbone "motorbike" "Cyclomoteur"
ademe_base_carbone "petrol" "essence E85"
ademe_base_carbone "diesel" "gazole B30"
ademe_base_carbone "lpg" "GPL vehicule routier litre"

# Transport
ademe_base_carbone "tgv" "TGV 2019"
ademe_base_carbone "ter" "TER 2019"
ademe_base_carbone "rer" "RER et transilien 2019 Ile de France"
ademe_base_carbone "subway" "Metro 2019 Ile de France"
ademe_base_carbone "shortHaulPlane" "court courrier AVEC trainees"
ademe_base_carbone "mediumHaulPlane" "moyen courrier AVEC trainees"
ademe_base_carbone "longHaulPlane" "long courrier AVEC trainees"

# Goods
ademe_base_carbone "officeConsumables" "Consommables bureautiques"
ademe_base_carbone "officeSupplies" "Petites fournitures"
ademe_base_carbone "agriculturalProducts" "Service Produits agricoles"
ademe_base_carbone "transformedFoodProducts" "Service Produit transformes"
ademe_base_carbone "mineralProducts" "Service Produit mineraux"
ademe_base_carbone "plastic" "Service Plastiques"
ademe_base_carbone "paper" "Service Papier"
ademe_base_carbone "wood" "Service Bois"
ademe_base_carbone "clothes" "Service Textile"
ademe_base_carbone "furniture" "Service Meubles"
ademe_base_carbone "chemicalProducts" "Service Produits chimiques"
ademe_base_carbone "pharmaceuticalProducts" "Service Produits pharmaceutiques"
ademe_base_carbone "metals" "Service Metaux"
ademe_base_carbone "metalProducts" "Service Produits m%C3%A9talliques"
ademe_base_carbone "machines" "Service Machines %C3%A9quipements"
ademe_base_carbone "computerProducts" "Service Produits informatiques"
ademe_base_carbone "transportationEquipment" "Service Mat%C3%A9riel de transport"
ademe_base_carbone "office" "Batiments de bureaux"
ademe_base_carbone "screen21inches" "Ecran 21,5 pouces"
ademe_base_carbone "screen23inches" "Ecran 23,8 pouces"
ademe_base_carbone "printer" "Imprimante multi-fonction"
ademe_base_carbone "photocopiers" "Photocopieurs"
ademe_base_carbone "desktopComputer" "Ordinateur fixe"
ademe_base_carbone "laptop" "Ordinateur portable"
ademe_base_carbone "rack" "Racks"
ademe_base_carbone "server" "Serveurs informatiques"
ademe_base_carbone "smartphone" "Smartphone 5,5 pouces"
ademe_base_carbone "tablet" "Tablette classique"
ademe_base_carbone "videoProjector" "Video-projecteur"
ademe_base_carbone "tv" "Television 40-49 pouces"
ademe_base_carbone "vehiclesFabrication" "Vehicules fabrication"

# Services
ademe_base_carbone "serviceConstruction" "Service Construction"
ademe_base_carbone "serviceAssuranceBank" "Service Assurance bancaires"
ademe_base_carbone "serviceMail" "Service Courrier"
ademe_base_carbone "serviceTelecommunications" "Service Telecommunications"
ademe_base_carbone "serviceRestauration" "Service Hebergement restauration"
ademe_base_carbone "servicePrint" "Services imprimerie publicite"
ademe_base_carbone "serviceEdition" "Service edition"
ademe_base_carbone "serviceMovie" "Service Films"
ademe_base_carbone "serviceMachinesInstallation" "Service Reparation"
ademe_base_carbone "serviceLandTransport" "Service Transport terrestre"
ademe_base_carbone "serviceMaritimeTransport" "Service Transport maritime"
ademe_base_carbone "serviceAirTransport" "Service Transport aerien"
ademe_base_carbone "serviceTransportAuxiliaries" "Service auxiliaires transports"
ademe_base_carbone "servicePublicAdministration" "Service Administration publiques"
ademe_base_carbone "serviceEducation" "Service Enseignement"
ademe_base_carbone "serviceRAD" "Service Recherche developpement"
ademe_base_carbone "serviceHealth" "Service sante humaine"
ademe_base_carbone "serviceSocialAction" "Service Action sociale"
ademe_base_carbone "serviceArtisticActivities" "Service Activites artistiques"
ademe_base_carbone "serviceSportActivities" "Service Activites sportives"
ademe_base_carbone "serviceAssociationActivities" "Service Activites associatives"

# Waste
ademe_base_carbone "paperWaste" "Papier fin de vie moyenne"
ademe_base_carbone "cardboardWaste" "Carton fin de vie moyenne"
ademe_base_carbone "mineralsWaste" "min%C3%A9raux fin de vie moyenne"
ademe_base_carbone "plasticWaste" "Plastique fin de vie moyenne"
ademe_base_carbone "householdWaste" "Ordures menageres fin de vie moyenne"
ademe_base_carbone "waterWaste" "Traitement des eaux"

# Electricity
ademe_base_carbone "electricityFrance" "2020 - mix moyen"
ademe_base_carbone_electricity_country "electricite Afrique du Sud"
ademe_base_carbone_electricity_country "electricite Albanie"
ademe_base_carbone_electricity_country "electricite Algerie"
ademe_base_carbone_electricity_country "electricite Allemagne"
ademe_base_carbone_electricity_country "electricite Angola"
ademe_base_carbone_electricity_country "electricite Antilles Neerlandaises"
ademe_base_carbone_electricity_country "electricite Arabie Saoudite"
ademe_base_carbone_electricity_country "electricite Argentine"
ademe_base_carbone_electricity_country "electricite Armenie"
ademe_base_carbone_electricity_country "electricite Australie"
ademe_base_carbone_electricity_country "electricite Autriche"
ademe_base_carbone_electricity_country "electricite Azerba%C3%AFdjan"
ademe_base_carbone_electricity_country "electricite Bahre%C3%AFn"
ademe_base_carbone_electricity_country "electricite Bangladesh"
ademe_base_carbone_electricity_country "electricite Belarus"
ademe_base_carbone_electricity_country "electricite Belgique"
ademe_base_carbone_electricity_country "electricite Benin"
ademe_base_carbone_electricity_country "electricite Birmanie"
ademe_base_carbone_electricity_country "electricite Bolivie"
ademe_base_carbone_electricity_country "electricite Bosnie-Herzegovine"
ademe_base_carbone_electricity_country "electricite Botswana"
ademe_base_carbone_electricity_country "electricite Bresil"
ademe_base_carbone_electricity_country "electricite Brunei Darussalam"
ademe_base_carbone_electricity_country "electricite Bulgarie"
ademe_base_carbone_electricity_country "electricite Cambodge"
ademe_base_carbone_electricity_country "electricite Cameroun"
ademe_base_carbone_electricity_country "electricite Canada"
ademe_base_carbone_electricity_country "electricite hors france Chili"
ademe_base_carbone_electricity_country "electricite Chine"
ademe_base_carbone_electricity_country "electricite Chypre"
ademe_base_carbone_electricity_country "electricite Colombie"
ademe_base_carbone_electricity_country "electricite Congo"
ademe_base_carbone_electricity_country "electricite north korea"
ademe_base_carbone_electricity_country "electricite Coree du sud"
ademe_base_carbone_electricity_country "electricite Costa rica"
ademe_base_carbone_electricity_country "electricite Cote d'Ivoire"
ademe_base_carbone_electricity_country "electricite Croatie"
ademe_base_carbone_electricity_country "electricite Cuba"
ademe_base_carbone_electricity_country "electricite Danemark"
ademe_base_carbone_electricity_country "electricite Dominicaine. Republique"
ademe_base_carbone_electricity_country "electricite egypte"
ademe_base_carbone_electricity_country "electricite El Salvador"
ademe_base_carbone_electricity_country "electricite emirats Arabes Unis"
ademe_base_carbone_electricity_country "electricite equateur"
ademe_base_carbone_electricity_country "electricite erythree"
ademe_base_carbone_electricity_country "electricite Espagne"
ademe_base_carbone_electricity_country "electricite Estonie"
ademe_base_carbone_electricity_country "electricite etats-Unis"
ademe_base_carbone_electricity_country "electricite ethiopie"
ademe_base_carbone_electricity_country "electricite Finlande"
ademe_base_carbone_electricity_country "electricite Syrie"
ademe_base_carbone_electricity_country "electricite Gabon"
ademe_base_carbone_electricity_country "electricite Georgia"
ademe_base_carbone_electricity_country "electricite Ghana"
ademe_base_carbone_electricity_country "electricite Gibraltar"
ademe_base_carbone_electricity_country "electricite Grece"
ademe_base_carbone_electricity_country "electricite Guatemala"
ademe_base_carbone_electricity_country "electricite Ha%C3%AFti"
ademe_base_carbone_electricity_country "electricite Honduras"
ademe_base_carbone_electricity_country "electricite Hongrie"
ademe_base_carbone_electricity_country "electricite Inde"
ademe_base_carbone_electricity_country "electricite Indonesie"
ademe_base_carbone_electricity_country "electricite Iraq"
ademe_base_carbone_electricity_country "electricite Irlande"
ademe_base_carbone_electricity_country "electricite Islande"
ademe_base_carbone_electricity_country "electricite Israel"
ademe_base_carbone_electricity_country "electricite Italie"
ademe_base_carbone_electricity_country "electricite Jama%C3%AFque"
ademe_base_carbone_electricity_country "electricite Japon"
ademe_base_carbone_electricity_country "electricite Jordanie"
ademe_base_carbone_electricity_country "electricite Kazakstan"
ademe_base_carbone_electricity_country "electricite Kenya"
ademe_base_carbone_electricity_country "electricite Kirghizistan"
ademe_base_carbone_electricity_country "electricite Kosovo"
ademe_base_carbone_electricity_country "electricite Kowe%C3%AFt"
ademe_base_carbone_electricity_country "electricite Lettonie"
ademe_base_carbone_electricity_country "electricite Liban"
ademe_base_carbone_electricity_country "electricite Libye"
ademe_base_carbone_electricity_country "electricite Lituanie"
ademe_base_carbone_electricity_country "electricite Luxembourg"
ademe_base_carbone_electricity_country "electricite Macedonie"
ademe_base_carbone_electricity_country "electricite Malaisie"
ademe_base_carbone_electricity_country "electricite Malte"
ademe_base_carbone_electricity_country "electricite Maroc"
ademe_base_carbone_electricity_country "electricite Mexique"
ademe_base_carbone_electricity_country "electricite Moldavie"
ademe_base_carbone_electricity_country "electricite Mongolie"
ademe_base_carbone_electricity_country "electricite Montenegro"
ademe_base_carbone_electricity_country "electricite Mozambique"
ademe_base_carbone_electricity_country "electricite Namibie"
ademe_base_carbone_electricity_country "electricite Nepal"
ademe_base_carbone_electricity_country "electricite Nicaragua"
ademe_base_carbone_electricity_country "electricite Nigeria"
ademe_base_carbone_electricity_country "electricite Norway"
ademe_base_carbone_electricity_country "electricite new zealand"
ademe_base_carbone_electricity_country "electricite Oman"
ademe_base_carbone_electricity_country "electricite Ouzbekistan"
ademe_base_carbone_electricity_country "electricite Pakistan"
ademe_base_carbone_electricity_country "electricite Panama"
ademe_base_carbone_electricity_country "electricite Netherlands"
ademe_base_carbone_electricity_country "electricite Perou"
ademe_base_carbone_electricity_country "electricite Philippines"
ademe_base_carbone_electricity_country "electricite Pologne"
ademe_base_carbone_electricity_country "electricite Portugal"
ademe_base_carbone_electricity_country "electricite Qatar"
ademe_base_carbone_electricity_country "electricite Rep. Dem. Du Congo"
ademe_base_carbone_electricity_country "electricite Republique Tcheque"
ademe_base_carbone_electricity_country "electricite Roumanie"
ademe_base_carbone_electricity_country "electricite Royaume Uni"
ademe_base_carbone_electricity_country "electricite Russie"
ademe_base_carbone_electricity_country "electricite Senegal"
ademe_base_carbone_electricity_country "electricite Serbie"
ademe_base_carbone_electricity_country "electricite Singapour"
ademe_base_carbone_electricity_country "electricite Slovaquie"
ademe_base_carbone_electricity_country "electricite Slovenie"
ademe_base_carbone_electricity_country "electricite Soudan"
ademe_base_carbone_electricity_country "electricite Sri Lanka"
ademe_base_carbone_electricity_country "electricite Sweden"
ademe_base_carbone_electricity_country "electricite switzerland"
ademe_base_carbone_electricity_country "electricite Tadjikistan"
ademe_base_carbone_electricity_country "electricite Ta%C3%AFwan"
ademe_base_carbone_electricity_country "electricite Tanzanie"
ademe_base_carbone_electricity_country "electricite Tha%C3%AFlande"
ademe_base_carbone_electricity_country "electricite Togo"
ademe_base_carbone_electricity_country "electricite Trinite et Tobago"
ademe_base_carbone_electricity_country "electricite Tunisie"
ademe_base_carbone_electricity_country "electricite Turkmenistan"
ademe_base_carbone_electricity_country "electricite Turquie"
ademe_base_carbone_electricity_country "electricite Ukraine"
ademe_base_carbone_electricity_country "electricite Uruguay"
ademe_base_carbone_electricity_country "electricite Venezuela"
ademe_base_carbone_electricity_country "electricite Viet Nam"
ademe_base_carbone_electricity_country "electricite Yemen"
ademe_base_carbone_electricity_country "electricite Zambie"
ademe_base_carbone_electricity_country "electricite Zimbabwe"
