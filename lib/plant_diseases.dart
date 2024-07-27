// plant_diseases.dart

import 'disease_model.dart';

final List<Disease> diseases = [
  Disease(
    name: "Alternaria Leaf Spot",
    description: "eaf spot is characterized by small, dark, circular spots with concentric rings (target-like spots) on leaves, which can cause leaf yellowing and drop. In severe cases, the spots can coalesce, leading to large dead areas on the leaf.",
    conditions: "Warm and humid conditions favor the growth and spread of Alternaria fungi. Poor air circulation can exacerbate the problem, as it keeps the foliage wet for extended periods. High moisture levels, including heavy dew, rainfall, or overhead irrigation, can promote fungal growth.",
    mechanicalTreatment: "Remove and destroy infected plant debris to reduce sources of inoculum. Ensure good air circulation around plants by proper spacing and pruning. Water plants at the base to avoid wetting foliage and reduce leaf wetness duration.",
    chemicalTreatment: "Chlorothalonil:Usage: Apply every 7-10 days during conditions favorable for disease development.Application: Follow label instructions for specific crops and timing.Effectiveness: Controls a broad spectrum of fungal pathogens, including Alternaria.Copper-Based Fungicides (e.g., Copper Hydroxide, Copper Oxychloride):Usage: Apply at the first sign of disease and repeat applications every 7-10 days as necessary.Application: Use according to the manufacturer's instructions.Effectiveness: Provides protection against many fungal and bacterial diseases.Mancozeb:Usage: Apply as a preventative treatment or at the first sign of symptoms.Application: Follow label directions for dosage and application frequency.Effectiveness: Effective against a variety of fungal pathogens, including Alternaria.Azoxystrobin:Usage: Apply as a foliar spray, typically every 7-14 days depending on disease pressure.Application: Use according to the label instructions for specific crops.Effectiveness: A systemic fungicide that provides both protective and curative action against Alternaria.Difenoconazole:Usage: Apply as a foliar spray at the first sign of disease.Application: Follow the label for specific crops and timing.Effectiveness: Effective in controlling Alternaria and other fungal pathogens.",
    source: "https://en.wikipedia.org/wiki/Alternaria_leaf_spot",
  ),
  Disease(
  name: "Anthracnose",
  description: "Anthracnose is a fungal disease that tends to attack plants in the spring when the weather is cool and wet, primarily on leaves and twigs. The fungi overwinter in dead twigs and fallen leaves. Cool, rainy weather creates perfect conditions for the spores to spread. Dry and hot weather stop the progression of the disease that may begin again once the weather conditions become optimal. The problem can be cyclic but is rarely fatal. Anthracnose fungus infects many deciduous and evergreen trees and shrubs, as well as fruits, vegetables, and grass. Anthracnose is noticeable along the leaves and the veins as small lesions. These dark, sunken lesions may also be found on stems, flowers, and fruits. In order to distinguish between anthracnose and other leaf spot diseases, you should carefully examine the undersides of leaves for a number of small tan to brown dots, about the size of a pinhead.",
  conditions: "Anthracnose symptoms vary by plant host and due to weather conditions. On landscape trees, the fungi infect developing shoots and expanding leaves. Small beige, brown, black, or black spots later appear on infected twigs of hosts such as elm, oak, and sycamore.",
  mechanicalTreatment:"Anthracnose control begins with practicing good sanitation. Picking up and disposing of all diseased plant parts, including twigs and leaves, from the ground or from around the plant, is important. This keeps the fungus from overwintering near the plant. Proper pruning techniques to rid trees and plants of old and dead wood also helps with the prevention of anthracnose fungus. Keeping plants healthy by providing proper light, water, and fertilizer will strengthen the plant's ability to ward off a fungus attack. Stressed trees and plants have a difficult time recovering from anthracnose fungus. Chemical treatment is rarely used except when the disease involves newly transplanted plants or continual defoliation.",
  chemicalTreatment:"Chlorothalonil, Mancozeb, Copper-based fungicides.Chlorothalonil: Effective against a broad spectrum of fungal diseases, including Anthracnose. Commonly used on vegetables, fruits, and ornamentals. Apply according to label instructions, typically every 7-14 days during the growing season. Mancozeb: A broad-spectrum fungicide that is effective against Anthracnose. Often used on fruits, vegetables, and ornamental plants. Typically applied every 7-10 days, particularly during wet conditions when the disease is more prevalent. Copper-based fungicides: Effective in controlling Anthracnose on a variety of plants, including vegetables, fruits, and ornamental trees. Examples include Copper Hydroxide and Copper Oxychloride. Apply at the first sign of disease and repeat applications every 7-10 days as necessary.",
  source: "https://www.maine.gov/dacf/php/gotpests/diseases/anthracnose.htm#:~:text=Anthracnose%20is%20a%20group%20of,attacks%20only%20specific%20tree%20species."
  ),
  Disease(
  name: "Black Spot leaf disease",
  description: "Black spot is a fungal disease that primarily affects plants with fleshy leaves and stems. The disease manifests as round, black spots with fringed margins on the upper sides of leaves. These spots may enlarge and merge, causing significant damage. Infected leaves often turn yellow and drop prematurely, weakening the plant over time.",
  conditions: "Black spot thrives in warm, humid conditions and spreads rapidly as temperatures rise into the 70s (Fahrenheit).",
  mechanicalTreatment:"Remove diseased canes and leaves, keep foliage dry, and consider resistant rose varieties or fungicide application.",
  chemicalTreatment:"Fungicides, neem oil, and baking soda are effective treatments for black spot control. Fungicides are labeled for black spot control, while neem oil has antifungal properties. Baking soda and horticultural oil can be mixed to alter leaf surface pH.",
  source: "https://en.wikipedia.org/wiki/Black_spot_leaf_disease"
  ),
  Disease(
  name: "Botrytis Blight",
  description: "Botrytis blight, also known as gray mold, causes gray, fuzzy mold on flowers, leaves, and stems. Infected plant parts may become soft, brown, and decayed, often leading to the death of the affected tissues.",
  conditions: "Cool, damp conditions are ideal for the development of Botrytis cinerea. Overcrowded plants reduce air circulation, increasing humidity and moisture retention around plants.",
  mechanicalTreatment:"Remove affected plant parts and dispose of them to reduce sources of infection. Increase air circulation around plants by proper spacing and pruning. Avoid overhead watering and water early in the day to allow foliage to dry before nightfall.",
  chemicalTreatment:"Fungicides with fenhexamid, iprodione, or chlorothalonil can be effective. Apply as per label instructions.",
  source: "https://plantpathology.ca.uky.edu/files/ppfs-gen-19.pdf"
  ),
  Disease(
  name: "Chlorosis",
  description: "Chlorosis is a condition where leaves produce insufficient chlorophyll, turning yellow while the veins remain green. It can affect entire plants or individual leaves and is often a symptom of underlying issues.",
  conditions: "Nutrient deficiencies, particularly iron, manganese, or nitrogen, can cause chlorosis. Poor soil drainage can lead to root damage and impaired nutrient uptake.",
  mechanicalTreatment:"Correct nutrient deficiencies by using appropriate fertilizers tailored to the specific nutrient needs. Improve soil drainage to prevent waterlogging and root damage.",
  chemicalTreatment:"Fertilizers containing the deficient nutrient can correct the specific deficiency causing chlorosis. Iron chelates (e.g., Iron EDTA), manganese sulfate, and nitrogen-rich fertilizers are common treatments.",
  source: "https://en.wikipedia.org/wiki/Chlorosis"
  ),
  Disease(
  name: "Curl Leaf",
  description: "Curl leaf is a condition where leaves curl and distort. It can be caused by a variety of factors, including pests, diseases, and environmental stress.",
  conditions: "Pest infestations, such as aphids, mites, and thrips, can cause leaf curling. Viral infections can also lead to leaf curl symptoms. Environmental stress, such as drought, excessive watering, or nutrient imbalances, can result in leaf curling.",
  mechanicalTreatment:"Remove and destroy affected plant parts to reduce sources of pests and diseases. Implement proper pest control measures to manage infestations. Maintain optimal growing conditions, including proper watering and fertilization.",
  chemicalTreatment:"Pesticides, fungicides, and appropriate fertilization can help manage the underlying causes of curl leaf. Insecticidal soap or neem oil can be used for controlling pests. Fungicides can manage fungal infections, and balanced fertilizers can address nutrient imbalances.",
  source: "https://en.wikipedia.org/wiki/Leaf_curl"
  ),
  Disease(
  name: "Ash DieBack",
  description: "Ash Dieback, also known as Chalara or Chalara Dieback of Ash, is a serious disease affecting ash trees (Fraxinus species). It is caused by the fungal pathogen Hymenoscyphus fraxineus (formerly Chalara fraxinea). The disease leads to leaf loss, crown dieback, and bark lesions, and can ultimately kill affected trees. Young trees are particularly vulnerable, and mature trees can succumb after repeated infections.",
  conditions: "Ash Dieback spreads through spores that are released from infected leaves and leaf litter. These spores are carried by the wind and can travel over long distances, infecting new trees. The main conditions that favor the infection include:Moist, Cool Conditions: The fungus thrives in cool, damp environments.Leaf Litter: The presence of infected leaf litter on the ground provides a reservoir for the fungus.Open Wounds: The fungus can enter trees through wounds or natural openings in the bark.",
  mechanicalTreatment:"Mechanical treatment options for Ash Dieback are limited, but they can help manage the spread and impact of the disease:Removal of Infected Trees: Removing and destroying severely infected trees can help reduce the spread of the fungus.Sanitation: Collecting and destroying fallen leaves and debris around infected trees can reduce the spore load in the environment.Pruning: Pruning out infected branches can slow the progression of the disease, although it is not a cure.",
  chemicalTreatment:"Currently, there are no effective chemical treatments available for Ash Dieback. Fungicides have not been proven to control the disease effectively, especially given the difficulty in reaching the interior parts of large trees. Research is ongoing to find potential chemical controls, but none are currently recommended for widespread use.",
  source: "https://www.rhs.org.uk/disease/ash-dieback"
  ),
  Disease(
  name: "Downy Mildew",
  description: "Downy mildew is a fungal disease that causes yellow or white patches on the upper leaf surfaces, with corresponding fuzzy growth on the undersides. Infected leaves may curl, distort, and drop prematurely.",
  conditions: "Cool, moist conditions favor the development of downy mildew. Extended periods of leaf wetness, high humidity, and moderate temperatures (50-70°F) promote fungal growth and infection.",
  mechanicalTreatment:"Remove and destroy infected plant debris to reduce sources of inoculum. Improve air circulation around plants by proper spacing and pruning. Water plants early in the day to allow foliage to dry before nightfall.",
  chemicalTreatment:"Fungicides with metalaxyl, fosetyl-Al, or copper-based compounds can be effective. Apply as per label instructions.",
  source: "https://en.wikipedia.org/wiki/Downy_mildew"
  ),
  Disease(
  name: "Powdery Mildew",
  description: "Powdery mildew is a fungal disease that causes white or gray powdery spots on leaves, stems, and flowers. Infected leaves may curl, distort, and drop prematurely.",
  conditions: "Warm, dry conditions with high humidity favor the development of powdery mildew. Overcrowded plants and poor air circulation can increase susceptibility.",
  mechanicalTreatment:"Remove and destroy infected plant parts to reduce sources of inoculum. Improve air circulation around plants by proper spacing and pruning. Water plants at the base to avoid wetting foliage.",
  chemicalTreatment:"Fungicides with sulfur, potassium bicarbonate, or neem oil can be effective. Apply as per label instructions.",
  source: "https://en.wikipedia.org/wiki/Powdery_mildew"
  ),
  Disease(
  name: "Leaf Necrosis",
  description: "Leaf necrosis refers to the death of leaf tissue, often presenting as brown or black spots or patches. It can result from fungal or bacterial infections, chemical damage, or environmental stress.",
  conditions: "Fungal or bacterial infections can cause necrotic spots or patches on leaves. Chemical damage from herbicides, pesticides, or fertilizers can lead to necrosis.Environmental stress, such as drought, extreme temperatures, or nutrient imbalances, can cause leaf tissue to die.",
  mechanicalTreatment:"Remove and destroy affected leaves to reduce sources of inoculum.Improve air circulation around plants by proper spacing and pruning.Avoid overhead watering and water early in the day to allow foliage to dry before nightfall.",
  chemicalTreatment:"Fungicides containing chlorothalonil, mancozeb, or copper-based.compounds can be effective against fungal blight.Bactericides may be needed if bacterial blight is present.Daconil (chlorothalonil): Provides broad-spectrum control against many fungal pathogens.Mancozeb: Effective against a wide range of fungal diseases.Copper fungicides(e.g., Bordeaux mixture): Effective against many fungal and bacterial diseases.Streptomycin: An antibiotic effective against bacterial blight.",
  source: "https://hortsense.cahnrs.wsu.edu/fact-sheet/common-cultural-marginal-leaf-necrosis/#:~:text=Biology,excessive%20heat%2C%20and%20chemical%20injury."
  ),
  Disease(
    name: "Leaf Spot",
    description: "Leaf spot is a general term used to describe a variety of diseases caused by different pathogens such as fungi, bacteria, and sometimes viruses. The disease is characterized by spots on the leaves that can vary in size, shape, and color depending on the causative agent. The spots are typically round and can be brown, black, or yellow with a darker margin. Severe infections can lead to premature leaf drop, reducing the plant's vigor and yield.",
    conditions: "Humidity and Moisture: High humidity and prolonged leaf wetness create an ideal environment for the development and spread of leaf spot pathogens.Temperature: Moderate temperatures (15-30°C) are typically conducive to leaf spot infections, though this can vary depending on the specific pathogen.Crowded Plantings: Dense foliage and poor air circulation can trap moisture and increase the risk of infection.Infected Plant Debris: Pathogens can survive in infected plant debris and soil, facilitating the spread of the disease.",
    mechanicalTreatment: "Sanitation: Remove and destroy infected leaves and plant debris to reduce sources of inoculum.Watering: Water plants early in the day to allow leaves to dry quickly, and avoid overhead irrigation.Spacing: Ensure adequate spacing between plants to improve air circulation.Resistant Varieties: Plant disease-resistant varieties when available.",
    chemicalTreatment: "Copper-Based Fungicides: Effective against many types of leaf spot diseases. Apply according to the manufacturer's instructions, usually before symptoms appear or at the first sign of disease.Chlorothalonil: A broad-spectrum fungicide that can control leaf spot diseases. Follow label directions for application rates and timing.Mancozeb: Another fungicide that is effective against leaf spot diseases. Apply as a preventative treatment or when symptoms first appear.Bacterial Leaf Spot: For bacterial infections, copper-based fungicides can be effective. Additionally, some antibiotics like streptomycin are sometimes used, though they are less common.Fungal Leaf Spot: Common fungicides like mancozeb, chlorothalonil, and thiophanate-methyl can be effective. Regular applications during the growing season may be necessary, particularly in humid or wet conditions.",
    source: "https://en.wikipedia.org/wiki/Leaf_spot",
  ),
  Disease(
    name: "Mosaic Virus",
    description: "Mosaic viruses are plant viruses that cause mottling, discoloration, and distortion of leaves in infected plants. They can be transmitted by aphids or contaminated seeds or cuttings, affecting various crops like roses, beans, tomatoes, potatoes, cucumbers, pumpkins, squash, melons, and peppers. Symptoms include yellow, white, or green stripes, wrinkled leaves, yellowing veins, stunted growth, mottled fruit, and dark green blisters on stems.",
    conditions: "Mosaic viruses, such as Tomato mosaic virus and Tobacco mosaic virus, are plant viruses that cause mottling, discoloration, and distortion of leaves. They can affect a variety of crops, including tomatoes, cucumbers, and peppers. Symptoms include yellowing, mottling, and stunted growth.",
    mechanicalTreatment: "No cure, but prevention involves removing infected plants and avoiding spread.",
    chemicalTreatment: "Mosaic viruses are incurable with chemicals. Preventive measures include maintaining garden hygiene, promptly removing infected plants, and controlling insect vectors like aphids. Specific fungicides are not recommended due to the varied nature of mosaic viruses.",
    source: "https://en.wikipedia.org/wiki/Mosaic_virus",
  ),
  Disease(
    name: "Powdery Mildew",
    description: "Powdery mildew is a fungal disease characterized by white, powdery fungal growth on the upper and lower leaf surfaces, stems, flowers, and fruits. Infected plant parts may become distorted and stunted.",
    conditions: "Warm, dry conditions with high humidity (but not leaf wetness) favor the development of powdery mildew. Overcrowded plants with poor air circulation are more susceptible to the disease.",
    mechanicalTreatment: "Remove and destroy infected plant parts to reduce sources of inoculum. Improve air circulation around plants by proper spacing and pruning. Avoid overhead watering and water early in the day to allow foliage to dry before nightfall.",
    chemicalTreatment: "Fungicides with sulfur, potassium bicarbonate, or myclobutanil can be effective. Sulfur provides effective control when applied preventatively. Kaligreen (potassium bicarbonate) disrupts fungal cell walls. Rally (myclobutanil) provides curative and protective action.",
    source: "https://en.wikipedia.org/wiki/Powdery_mildew",
  ),
  Disease(
    name: "Rust",
    description: "Rust is a fungal disease characterized by orange, yellow, or brown pustules on the undersides of leaves. Infected leaves may become distorted, yellow, and drop prematurely. Severe infections can weaken the plant over time.",
    conditions: "Moderate temperatures (50-75°F) and high humidity favor the development of rust. Extended periods of leaf wetness and overcrowded plants with poor air circulation increase the risk of infection.",
    mechanicalTreatment: "Remove and destroy infected plant debris to reduce sources of inoculum. Improve air circulation around plants by proper spacing and pruning. Avoid overhead watering and water early in the day to allow foliage to dry before nightfall.",
    chemicalTreatment: "Fungicides with myclobutanil, azoxystrobin, or sulfur can be effective. Rally (myclobutanil) provides curative and protective action. Heritage (azoxystrobin) controls rust and other diseases. Sulfur provides control when applied preventatively.",
    source: "https://en.wikipedia.org/wiki/Rust_(fungus)",
  ),
  Disease(
    name: "Septoria Leaf Spot",
    description: "Septoria leaf spot is a fungal disease caused by the pathogen Septoria lycopersici, commonly affecting tomato plants. It is characterized by small, water-soaked spots that turn brown and are surrounded by a yellow halo. The spots eventually coalesce, causing significant damage to the foliage. Severe infections can lead to defoliation, reducing the plant's ability to photosynthesize and thus diminishing fruit yield and quality.",
    conditions: "Humidity and Moisture: High humidity and prolonged periods of leaf wetness favor the development and spread of Septoria leaf spot.Temperature: Moderate temperatures (20-25°C) are optimal for the growth and infection of Septoria lycopersici.Plant Debris: The pathogen overwinters in infected plant debris and soil, facilitating infection during the growing season.Overhead Irrigation: Splashing water can spread the spores from infected to healthy leaves.",
    mechanicalTreatment: "Sanitation: Remove and destroy infected leaves and plant debris to reduce sources of inoculum.Watering: Water plants at the base to keep foliage dry and avoid overhead irrigation.Crop Rotation: Rotate crops with non-host plants to reduce soilborne inoculum.Resistant Varieties: Plant disease-resistant tomato varieties when available.",
    chemicalTreatment: "Chlorothalonil: A broad-spectrum fungicide effective against Septoria leaf spot. Apply according to the manufacturer's instructions, typically every 7-10 days during favorable conditions for the disease.Copper-Based Fungicides: Effective against a range of fungal diseases, including Septoria leaf spot. Follow label directions for application rates and timing.Mancozeb: Another fungicide effective in controlling Septoria leaf spot. Regular applications during the growing season may be necessary.Fungicide Sprays: Use fungicides such as chlorothalonil, copper-based fungicides, or mancozeb as a preventative measure or at the first sign of disease. Reapply as per the manufacturer's instructions, usually every 7-10 days, especially in humid conditions.Rotation of Fungicides: To prevent the development of resistance, rotate between different fungicides with different modes of action.",
    source: "https://extension.wvu.edu/lawn-gardening-pests/plant-disease/fruit-vegetable-diseases/septoria-leaf-spot",
  ),
  Disease(
    name: "Sooty Mould",
    description: "Sooty mould is a collective term for various ascomycete fungi that grow on the honeydew secreted by aphids, whiteflies, scale insects, and other plant-sucking insects. The mould itself is not parasitic but can cause indirect damage by blocking sunlight and interfering with photosynthesis, leading to reduced plant vigour and growth.",
    conditions: "Presence of Honeydew: Sooty mould thrives on the sugary excretions (honeydew) produced by sap-sucking insects such as aphids, whiteflies, scale insects, and mealybugs.Humidity and Moisture: High humidity and moisture levels favour the growth of sooty mould.Poor Air Circulation: Environments with limited air circulation can contribute to the development of sooty mould as they often remain damp.",
    mechanicalTreatment: "Washing the Plant: Use a strong spray of water to wash off the honeydew and mould from the leaves. This can be done with a garden hose or a spray bottle filled with water.Pruning: Remove heavily infested and mould-covered plant parts to reduce the spread and improve air circulation.Manual Cleaning: For smaller plants, you can wipe the leaves with a damp cloth to remove the mould.",
    chemicalTreatment: "Insecticides: Since sooty mould is a secondary infection caused by insect pests, treating the pests is crucial. Use insecticides such as neem oil, horticultural oil, or insecticidal soap to control the population of sap-sucking insects.Fungicides: In severe cases, fungicides can be applied to help manage sooty mould. Look for products containing copper, sulphur, or potassium bicarbonate.Insect Growth Regulators (IGRs): These can help manage insect populations by disrupting their growth and reproduction cycles, thereby reducing honeydew production.",
    source: "https://www.rhs.org.uk/biodiversity/sooty-moulds",
  ),
];
