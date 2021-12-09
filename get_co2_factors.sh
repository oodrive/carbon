#!/bin/sh

query_ademe_base_carbone () {    
    curl -s -G "https://data.ademe.fr/data-fair/api/v1/datasets/base-carbone(r)/lines" \
    --data-urlencode "format=json" \
    --data-urlencode "q=$1" \
    --data-urlencode "qs=Valide+générique" \
    --data-urlencode "q_mode=simple" \
    --data-urlencode "Type_Ligne_in=Elément" \
    --data-urlencode "size=1" \
    --data-urlencode "select=Nom_base_français,Nom_frontière_français,Nom_attribut_français,Total_poste_non_décomposé,Sous-localisation_géographique_français,Sous-localisation_géographique_anglais" \
    --data-urlencode "sampling=neighbors" > result.json

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
ademe_base_carbone "metals" "Service Métaux"
ademe_base_carbone "metalProducts" "Service Produits métalliques"
ademe_base_carbone "machines" "Service Machines équipements"
ademe_base_carbone "computerProducts" "Service Produits informatiques"
ademe_base_carbone "transportationEquipment" "Service Matériel de transport"
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
ademe_base_carbone "cardboardWaste" "Emballages - Carton - Fin de vie moyenne filière"
ademe_base_carbone "glassWaste" "Emballages - Verre - Fin de vie moyenne filière"
ademe_base_carbone "plasticPETBottleWaste" "Emballages - Plastique rigide pétrosourcé PET bouteilles - Fin de vie moyenne filière"
ademe_base_carbone "otherPlasticWaste" "Emballages - Autres plastiques et plastiques complexes - Fin de vie moyenne filière"
ademe_base_carbone "householdWaste" "Ordures menagères résiduelles - fin de vie moyenne"
ademe_base_carbone "concreteWaste" "Déchets du bâtiment - Béton, briques, tuiles et céramiques - Fin de vie moyenne"
ademe_base_carbone "otherMixedConstructionWaste" "Déchets du bâtiment - Déchets non dangereux en mélange (DIB) - Fin de vie moyenne"

# Electricity
ademe_base_carbone "electricityFrance" "2020 - mix moyen"
ademe_base_carbone_electricity_country "electricité Afrique du Sud"
ademe_base_carbone_electricity_country "electricité Albanie"
ademe_base_carbone_electricity_country "electricité Algerie"
ademe_base_carbone_electricity_country "electricité Allemagne"
ademe_base_carbone_electricity_country "electricité Angola"
ademe_base_carbone_electricity_country "electricité Antilles Neerlandaises"
ademe_base_carbone_electricity_country "electricité Arabie Saoudite"
ademe_base_carbone_electricity_country "electricité Argentine"
ademe_base_carbone_electricity_country "electricité Armenie"
ademe_base_carbone_electricity_country "electricité Australie"
ademe_base_carbone_electricity_country "electricité Autriche"
ademe_base_carbone_electricity_country "electricité Azerbaïdjan"
ademe_base_carbone_electricity_country "electricité Bahreïn"
ademe_base_carbone_electricity_country "electricité Bangladesh"
ademe_base_carbone_electricity_country "electricité Belarus"
ademe_base_carbone_electricity_country "electricité Belgique"
ademe_base_carbone_electricity_country "electricité Benin"
ademe_base_carbone_electricity_country "electricité Birmanie"
ademe_base_carbone_electricity_country "electricité Bolivie"
ademe_base_carbone_electricity_country "electricité Bosnie-Herzegovine"
ademe_base_carbone_electricity_country "electricité Botswana"
ademe_base_carbone_electricity_country "electricité Bresil"
ademe_base_carbone_electricity_country "electricité Brunei Darussalam"
ademe_base_carbone_electricity_country "electricité Bulgarie"
ademe_base_carbone_electricity_country "electricité Cambodge"
ademe_base_carbone_electricity_country "electricité Cameroun"
ademe_base_carbone_electricity_country "electricité Canada"
ademe_base_carbone_electricity_country "electricité hors france Chili"
ademe_base_carbone_electricity_country "electricité Chine"
ademe_base_carbone_electricity_country "electricité Chypre"
ademe_base_carbone_electricity_country "electricité Colombie"
ademe_base_carbone_electricity_country "electricité Congo"
ademe_base_carbone_electricity_country "electricité north korea"
ademe_base_carbone_electricity_country "electricité Coree du sud"
ademe_base_carbone_electricity_country "electricité Costa rica"
ademe_base_carbone_electricity_country "electricité Cote d'Ivoire"
ademe_base_carbone_electricity_country "electricité Croatie"
ademe_base_carbone_electricity_country "electricité Cuba"
ademe_base_carbone_electricity_country "electricité Danemark"
ademe_base_carbone_electricity_country "electricité Dominicaine. Republique"
ademe_base_carbone_electricity_country "electricité egypte"
ademe_base_carbone_electricity_country "electricité El Salvador"
ademe_base_carbone_electricity_country "electricité emirats Arabes Unis"
ademe_base_carbone_electricity_country "electricité equateur"
ademe_base_carbone_electricity_country "electricité erythree"
ademe_base_carbone_electricity_country "electricité Espagne"
ademe_base_carbone_electricity_country "electricité Estonie"
ademe_base_carbone_electricity_country "electricité etats-Unis"
ademe_base_carbone_electricity_country "electricité ethiopie"
ademe_base_carbone_electricity_country "electricité Finlande"
ademe_base_carbone_electricity_country "electricité Syrie"
ademe_base_carbone_electricity_country "electricité Gabon"
ademe_base_carbone_electricity_country "electricité Georgia"
ademe_base_carbone_electricity_country "electricité Ghana"
ademe_base_carbone_electricity_country "electricité Gibraltar"
ademe_base_carbone_electricity_country "electricité Grece"
ademe_base_carbone_electricity_country "electricité Guatemala"
ademe_base_carbone_electricity_country "electricité Haïti"
ademe_base_carbone_electricity_country "electricité Honduras"
ademe_base_carbone_electricity_country "electricité Hongrie"
ademe_base_carbone_electricity_country "electricité Inde"
ademe_base_carbone_electricity_country "electricité Indonesie"
ademe_base_carbone_electricity_country "electricité Iraq"
ademe_base_carbone_electricity_country "electricité Irlande"
ademe_base_carbone_electricity_country "electricité Islande"
ademe_base_carbone_electricity_country "electricité Israel"
ademe_base_carbone_electricity_country "electricité Italie"
ademe_base_carbone_electricity_country "electricité Jamaïque"
ademe_base_carbone_electricity_country "electricité Japon"
ademe_base_carbone_electricity_country "electricité Jordanie"
ademe_base_carbone_electricity_country "electricité Kazakstan"
ademe_base_carbone_electricity_country "electricité Kenya"
ademe_base_carbone_electricity_country "electricité Kirghizistan"
ademe_base_carbone_electricity_country "electricité Kosovo"
ademe_base_carbone_electricity_country "electricité Koweït"
ademe_base_carbone_electricity_country "electricité Lettonie"
ademe_base_carbone_electricity_country "electricité Liban"
ademe_base_carbone_electricity_country "electricité Libye"
ademe_base_carbone_electricity_country "electricité Lituanie"
ademe_base_carbone_electricity_country "electricité Luxembourg"
ademe_base_carbone_electricity_country "electricité Macedonie"
ademe_base_carbone_electricity_country "electricité Malaisie"
ademe_base_carbone_electricity_country "electricité Malte"
ademe_base_carbone_electricity_country "electricité Maroc"
ademe_base_carbone_electricity_country "electricité Mexique"
ademe_base_carbone_electricity_country "electricité Moldavie"
ademe_base_carbone_electricity_country "electricité Mongolie"
ademe_base_carbone_electricity_country "electricité Montenegro"
ademe_base_carbone_electricity_country "electricité Mozambique"
ademe_base_carbone_electricity_country "electricité Namibie"
ademe_base_carbone_electricity_country "electricité Nepal"
ademe_base_carbone_electricity_country "electricité Nicaragua"
ademe_base_carbone_electricity_country "electricité Nigeria"
ademe_base_carbone_electricity_country "electricité Norway"
ademe_base_carbone_electricity_country "electricité new zealand"
ademe_base_carbone_electricity_country "electricité Oman"
ademe_base_carbone_electricity_country "electricité Ouzbekistan"
ademe_base_carbone_electricity_country "electricité Pakistan"
ademe_base_carbone_electricity_country "electricité Panama"
ademe_base_carbone_electricity_country "electricité Netherlands"
ademe_base_carbone_electricity_country "electricité Perou"
ademe_base_carbone_electricity_country "electricité Philippines"
ademe_base_carbone_electricity_country "electricité Pologne"
ademe_base_carbone_electricity_country "electricité Portugal"
ademe_base_carbone_electricity_country "electricité Qatar"
ademe_base_carbone_electricity_country "electricité Rep. Dem. Du Congo"
ademe_base_carbone_electricity_country "electricité Republique Tcheque"
ademe_base_carbone_electricity_country "electricité Roumanie"
ademe_base_carbone_electricity_country "electricité Royaume Uni"
ademe_base_carbone_electricity_country "electricité Russie"
ademe_base_carbone_electricity_country "electricité Senegal"
ademe_base_carbone_electricity_country "electricité Serbie"
ademe_base_carbone_electricity_country "electricité Singapour"
ademe_base_carbone_electricity_country "electricité Slovaquie"
ademe_base_carbone_electricity_country "electricité Slovenie"
ademe_base_carbone_electricity_country "electricité Soudan"
ademe_base_carbone_electricity_country "electricité Sri Lanka"
ademe_base_carbone_electricity_country "electricité Sweden"
ademe_base_carbone_electricity_country "electricité switzerland"
ademe_base_carbone_electricity_country "electricité Tadjikistan"
ademe_base_carbone_electricity_country "electricité Taïwan"
ademe_base_carbone_electricity_country "electricité Tanzanie"
ademe_base_carbone_electricity_country "electricité Thaïlande"
ademe_base_carbone_electricity_country "electricité Togo"
ademe_base_carbone_electricity_country "electricité Trinite et Tobago"
ademe_base_carbone_electricity_country "electricité Tunisie"
ademe_base_carbone_electricity_country "electricité Turkmenistan"
ademe_base_carbone_electricity_country "electricité Turquie"
ademe_base_carbone_electricity_country "electricité Ukraine"
ademe_base_carbone_electricity_country "electricité Uruguay"
ademe_base_carbone_electricity_country "electricité Venezuela"
ademe_base_carbone_electricity_country "electricité Viet Nam"
ademe_base_carbone_electricity_country "electricité Yemen"
ademe_base_carbone_electricity_country "electricité Zambie"
ademe_base_carbone_electricity_country "electricité Zimbabwe"
