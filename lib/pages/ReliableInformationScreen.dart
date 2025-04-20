/*import 'package:flutter/material.dart';

class ReliableInformationScreen extends StatelessWidget {
  const ReliableInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reliable Information"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildButton("Dyshidrosis", DyshidrosisScreen(), context),
            _buildButton("Monkey Pox", MonkeyPoxScreen(), context),
            _buildButton("Neurodermatitis", NeurodermatitisScreen(), context),
            _buildButton("Atopic Dermatitis", AtopicDermatitisScreen(), context),
            _buildButton("Contact Dermatitis", ContactDermatitisScreen(), context),
            _buildButton("Hand Eczema", HandEczemaScreen(), context),
            _buildButton("Nummular Dermatitis", NummularDermatitisScreen(), context),
            _buildButton("Seborrheic Dermatitis", SeborrheicDermatitisScreen(), context),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Widget screen, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.blueGrey,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

// تعريف شاشة Dyshidrosis
class DyshidrosisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dyshidrosis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Dyshidrosis Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Dyshidrotic eczema is a skin condition that causes small blisters on the palms of hands, soles of the feet and edges of the fingers and toes. While the actual cause of dyshidrotic eczema isn’t known, it is more common in people who have another form of eczema and tends to run in families, suggesting a genetic component.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who gets dyshidrotic eczema and why?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "This common form of eczema, also called pompholyx (which means 'bubble' in ancient Greek), foot-and-hand eczema, palmoplantar eczema and vesicular eczema, is found more frequently in women than in men. Dyshidrotic eczema is most common in younger adults, typically between the ages of 20 and 40. People can have a single flare-up of dyshidrotic eczema, but it’s more common for it to come and go over long periods of time. Metals, particularly nickel, are a common trigger. Stress can also cause a flare. Laundry detergent can cause a flare. The condition is also linked to seasonal allergies like hay fever, and to hot, humid weather. Sweaty palms can trigger the rash, as can doing a job such as hairstyling or healthcare that entails frequently getting the hands wet. Any external trigger or irritant that impacts your immune system can affect your skin, too. Hand dermatitis includes not only dyshidrotic eczema but may also refer to a wider range of skin conditions that are triggered by environmental irritants and allergens; atopic dermatitis may also lead to outbreaks of eczema along the skin of your hands.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "What are the symptoms of dyshidrotic eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Flares happen only on the hands and feet and usually begin with a rash of painful, deep-seated blisters called vesicles, although sometimes itching and burning sensations begin first. As blisters heal, the skin dries and often reddens and peels. This leaves it tender and dry and sometimes creates painful fissures or cracks. Skin can also become infected. Severe cases of dyshidrotic eczema can sometimes lead to large blisters.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "How is dyshidrotic eczema diagnosed?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Dermatologists can usually diagnose dyshidrotic eczema with a skin exam and medical history. Many cases improve quickly with a short course of topical corticosteroids combined with soaking or applying cool compresses to affected areas a few times a day to help dry out blisters. Because this form of eczema is sometimes linked to a fungal infection on the hands or feet, your dermatologist may prescribe an anti-fungal medication if needed.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "How is dyshidrotic eczema treated?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Knowing your triggers and maintaining a regular skincare routine can help prevent and manage dyshidrotic eczema flares. Helpful steps can include:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "- Wash the affected skin with a mild cleanser and gently pat dry.\n"
              "- Apply a heavy cream with ingredients like ceramides to help repair the skin barrier.\n"
              "- Remove rings and other jewelry when you wash your hands so water doesn’t linger on your skin.\n"
              "- Wash then moisturize hands or feet immediately after coming into contact with a potential trigger.\n"
              "- Use stress management techniques.\n"
              "- Keep fingernails short to help prevent scratching from breaking the skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Areas of dyshidrotic eczema are also at risk for bacterial skin infections, which can delay or prevent healing. If you develop swelling, crusting, pain or pus-filled blisters, visit your dermatologist to check for bacterial infection, which requires treatment with oral antibiotics. Some people with eczema use patch testing with an allergist to identify possible triggers.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "When dyshidrotic eczema is severe or flares happen often, dermatologists may prescribe light therapy, topical calcineurin inhibitors (TCIs), corticosteroids or oral steroids. Occasionally, botulinum toxin injections are used to control the sweaty hands and feet that can trigger the condition. Consult with your healthcare provider to determine the best course of treatment for your individual symptoms.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: https://nationaleczema.org/eczema/types-of-eczema/dyshidrotic-eczema/",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// تعريف شاشة Monkey Pox
class MonkeyPoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monkey Pox"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mpox and Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Mpox (previously known as Monkeypox) is a rare infection that appears on the skin as raised spots, which turn into small blisters filled with fluid. These blisters eventually form scabs, which later fall off. The skin symptoms of mpox have the potential to be confused with infected eczema, particularly eczema herpeticum, which is a serious viral herpes infection.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Children and adolescents with a history or presence of atopic eczema are at risk of more severe mpox. If you suspect that you or your child has mpox – or eczema herpeticum – please seek immediate same day medical advice.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Mpox Vaccine (MVA-BN) and Cautions for People with Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The vaccine recommended to protect against mpox is a third generation Modified Vaccinia Ankara (MVA) vaccine, which was first developed in the 1950s for the prevention of smallpox. For most people, the mpox vaccine has a favourable safety profile.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "People with atopic eczema, though, may be more likely to experience certain side effects from the vaccine. These include more intense local skin reactions (such as the skin becoming red or darker than usual, depending on skin tone, swelling and itching) and other general symptoms (such as headache, muscle pain, feeling sick or tired), as well as a flare-up or worsening of their eczema. In rare cases, people with atopic eczema have experienced serious reactions to the vaccine with widespread infection of the skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "National Eczema Society and the UKHSA recommend that people with atopic eczema seek a risk assessment before taking the vaccine in order to balance the risk from exposure to mpox and the risk of possible side effects from vaccination.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "What Does Monkeypox Look and Feel Like?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The disease most commonly starts with fever, then painful lymph nodes and a rash that typically develops one to three days after the fever begins, according to the CDC.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "The rash is the most significant feature of monkeypox, spreading into small, fluid-filled blisters. They become round and hard, like pimples, and then scab.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "You may also have headache, muscle aches, chills, and exhaustion that begin between seven to 14 days after exposure but can develop between five to 21 days post-exposure.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "You are no longer infectious once your scabs have healed, dropped off, and healthy new skin has grown where the lesions were located. That usually takes two to four weeks, according to Robinson.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Children under 8 years old, people who are pregnant or immunocompromised, and individuals with a history of atopic dermatitis or eczema may be at increased risk for severe outcomes from monkeypox.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "What To Do for Suspected Monkeypox",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "If you think you’ve been exposed, notify your medical provider, and monitor yourself for symptoms for 21 days after your last close contact with an infected individual.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "You may have to isolate yourself from other members of your household to limit the spread of the disease, including from pets. This means not having close contact, including touching or other physical contact, no prolonged face-to-face encounters, and not engaging in sex.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "If you have a fever or a growing rash, see your medical health care professional in person.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The most common treatment for monkeypox includes supportive care, such as hydration and treatment of secondary bacterial infections.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "There’s also an approved vaccine called Jynneos for monkeypox and antivirals that doctors may use in certain situations immediately after patient exposure, but these are not widely available in the United States. They are available from the government’s national stockpile of medicines.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "The treatments have been shown to be pretty good at preventing severe illness. The earlier you get them, the better. Early treatment can prevent you from having symptoms or at least making sure that your symptoms are relatively mild.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: https://eczema.org/blog/monkeypox-and-eczema/",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// تعريف الشاشات الأخرى (يمكنك إضافة تفاصيل لكل شاشة)
class NeurodermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neurodermatitis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Neurodermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Neurodermatitis, also known as lichen simplex chronicus, is a chronic skin condition that causes extremely itchy patches of skin. Scratching can become habitual, making the condition worse and leading to thickened, leathery skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Neurodermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Intense itching, especially when relaxing or trying to sleep.\n"
              "- Thick, leathery patches of skin that can be red, brown, or gray.\n"
              "- Scratching can lead to open wounds, infection, and scarring.\n"
              "- It commonly affects feet, ankles, hands, wrists, neck, scalp, and genital areas.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who Gets Neurodermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "It is most common in adults aged 30-50, and more frequently occurs in women. People with contact dermatitis, atopic dermatitis, psoriasis, and anxiety disorders are at higher risk.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment for Neurodermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Topical corticosteroids and non-steroidal creams to reduce itching.\n"
              "- Occlusive treatments (plastic wrap, zinc oxide gauze) to prevent scratching.\n"
              "- Medicated patches with lidocaine or capsaicin.\n"
              "- Oral antihistamines or anti-anxiety medications to curb nighttime scratching.\n"
              "- Cognitive behavioral therapy, relaxation techniques, and stress management.\n"
              "- Daily moisturizing and wearing loose-fitting clothing to reduce irritation.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class AtopicDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atopic Dermatitis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Atopic Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Atopic eczema, also known as atopic dermatitis, is the most common form of eczema. It mainly affects children but can also occur in adults. The condition leads to itchy, red, dry, and cracked skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Commonly Affected Areas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Backs or fronts of the knees\n"
              "- Outside or inside of the elbows\n"
              "- Around the neck\n"
              "- Hands\n"
              "- Cheeks\n"
              "- Scalp",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Causes of Atopic Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The exact cause is unknown, but it is often linked to genetic and environmental factors. It commonly occurs in people with allergies and is associated with asthma and hay fever.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Self-care techniques such as avoiding triggers and reducing scratching.\n"
              "- Daily use of emollients (moisturizers) to manage dryness.\n"
              "- Topical corticosteroids to reduce swelling and itching during flare-ups.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who is Affected?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Approximately 1 in 5 children in the UK has atopic eczema. In many cases, it improves by adolescence, but it can persist into adulthood.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: NHS Inform",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Dermatitis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Contact Dermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Contact dermatitis is an inflammatory skin disease caused by direct contact with an irritant or allergen. It results in redness, swelling, itching, and sometimes blisters.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Types of Contact Dermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- **Allergic Contact Dermatitis**: Caused by an immune reaction to allergens like poison ivy or fragrances.\n"
              "- **Irritant Contact Dermatitis**: Caused by exposure to irritating substances like soaps or hair dye.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Itchy rash, dry or scaly patches.\n"
              "- Skin redness, swelling, and possible blistering.\n"
              "- Can appear anywhere in contact with irritants or allergens.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Common Triggers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Metals (nickel, gold, cobalt)\n"
              "- Fragrances and topical medicines\n"
              "- Rubber and latex products\n"
              "- Preservatives (formaldehyde, parabens)\n"
              "- Plants like poison ivy\n"
              "- Hair dyes",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Diagnosis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "A dermatologist may diagnose contact dermatitis through a physical examination or patch testing to identify allergens. In some cases, a skin biopsy may be done.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Avoid known triggers and wear protective clothing if exposure is unavoidable.\n"
              "- Use mild cleansers and frequent moisturizing to repair the skin barrier.\n"
              "- Over-the-counter hydrocortisone creams or prescribed topical medications.\n"
              "- Biologic or oral prescription medications may be used for severe cases.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Difference Between Contact Dermatitis and Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Unlike atopic dermatitis, contact dermatitis is not hereditary or linked to conditions like hay fever or asthma. It occurs only after skin contact with an irritant or allergen.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class HandEczemaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hand Eczema"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Hand Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Hand eczema, also known as hand dermatitis, is a common type of eczema that affects about 10% of the U.S. population. It is caused by genetics, contact allergens, and irritating substances.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Hand Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Cracked, peeling, or scaly skin\n"
              "- Redness and inflammation\n"
              "- Itchy and painful skin\n"
              "- Dryness, leading to flaking",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Identify and avoid triggers\n"
              "- Use fragrance-free cleansers and lukewarm water\n"
              "- Apply thick moisturizers like petroleum jelly\n"
              "- Wear protective gloves when handling chemicals\n"
              "- Use prescribed treatments such as corticosteroids or biologics",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Home Care Tips",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Moisturize hands immediately after washing\n"
              "- Avoid antibacterial hand sanitizers with alcohol\n"
              "- Use cotton gloves for household chores\n"
              "- Use waterproof gloves when handling wet substances",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Best Moisturizers for Hand Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Ointments with high oil content\n"
              "- Avoid lotions with high water content\n"
              "- Apply moisturizer after each hand wash",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class NummularDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nummular Dermatitis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Nummular Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Nummular eczema, also known as discoid eczema or nummular dermatitis, is a skin condition that presents as scattered, coin-shaped patches. These patches can be itchy, inflamed, and sometimes oozing.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who Gets Nummular Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Can occur at any age, but is more common in males.\n"
              "- Triggers include dry skin, insect bites, scrapes, and chemical burns.\n"
              "- Can be associated with other types of eczema, such as contact dermatitis.\n"
              "- Poor blood circulation in the legs can be a contributing factor.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Nummular Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Coin-shaped lesions on arms, legs, torso, and hands.\n"
              "- Itching and burning sensations.\n"
              "- Lesions may ooze liquid or crust over.\n"
              "- Skin may appear red, pinkish, or brown with inflammation.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Proper diagnosis is key, as it can resemble psoriasis or ringworm.\n"
              "- Dermatologists may use a skin scraping test for confirmation.\n"
              "- Treated with mid- to high-potency topical corticosteroids.\n"
              "- Topical antibiotics may be necessary for secondary infections.\n"
              "- Astringent compresses can help dry out oozing lesions.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class SeborrheicDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seborrheic Dermatitis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Seborrheic Dermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Seborrheic dermatitis is a chronic form of eczema that commonly affects areas with oil-producing glands like the scalp, nose, and upper back. It can cause dandruff, itching, and inflamed skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who Gets Seborrheic Dermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Common in infants and adults aged 30-60.\n"
              "- More prevalent in males.\n"
              "- Some cases are chronic, with flare-ups throughout life.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Causes and Triggers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Overgrowth of Malassezia yeast leading to inflammation.\n"
              "- Stress and hormonal changes.\n"
              "- Harsh detergents, chemicals, and weather changes.\n"
              "- Certain medical conditions like HIV and Parkinson’s disease.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Seborrheic Dermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Flaky skin or dandruff.\n"
              "- Greasy scales on irritated skin.\n"
              "- Redness or discoloration.\n"
              "- Itching and possible hair loss in severe cases.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Use shampoos with pyrithione zinc, selenium sulfide, or ketoconazole.\n"
              "- Maintain a skincare routine with mild cleansers and moisturizers.\n"
              "- For severe cases, dermatologists may prescribe antifungal or steroid treatments.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reliable Information',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ReliableInformationScreen(),
    );
  }
}

class ReliableInformationScreen extends StatelessWidget {
  const ReliableInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reliable Information"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildButton("Dyshidrosis", DyshidrosisScreen(), context),
            _buildButton("Monkey Pox", MonkeyPoxScreen(), context),
            _buildButton("Neurodermatitis", NeurodermatitisScreen(), context),
            _buildButton("Atopic Dermatitis", AtopicDermatitisScreen(), context),
            _buildButton("Contact Dermatitis", ContactDermatitisScreen(), context),
            _buildButton("Hand Eczema", HandEczemaScreen(), context),
            _buildButton("Nummular Dermatitis", NummularDermatitisScreen(), context),
            _buildButton("Seborrheic Dermatitis", SeborrheicDermatitisScreen(), context),
            _buildButton("Research Papers", ResearchLinksScreen(), context), // زر جديد للبحث
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Widget screen, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.blueGrey,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

// تعريف شاشة Dyshidrosis
class DyshidrosisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dyshidrosis"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Dyshidrosis Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Dyshidrotic eczema is a skin condition that causes small blisters on the palms of hands, soles of the feet and edges of the fingers and toes. While the actual cause of dyshidrotic eczema isn’t known, it is more common in people who have another form of eczema and tends to run in families, suggesting a genetic component.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who gets dyshidrotic eczema and why?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "This common form of eczema, also called pompholyx (which means 'bubble' in ancient Greek), foot-and-hand eczema, palmoplantar eczema and vesicular eczema, is found more frequently in women than in men. Dyshidrotic eczema is most common in younger adults, typically between the ages of 20 and 40. People can have a single flare-up of dyshidrotic eczema, but it’s more common for it to come and go over long periods of time. Metals, particularly nickel, are a common trigger. Stress can also cause a flare. Laundry detergent can cause a flare. The condition is also linked to seasonal allergies like hay fever, and to hot, humid weather. Sweaty palms can trigger the rash, as can doing a job such as hairstyling or healthcare that entails frequently getting the hands wet. Any external trigger or irritant that impacts your immune system can affect your skin, too. Hand dermatitis includes not only dyshidrotic eczema but may also refer to a wider range of skin conditions that are triggered by environmental irritants and allergens; atopic dermatitis may also lead to outbreaks of eczema along the skin of your hands.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "What are the symptoms of dyshidrotic eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Flares happen only on the hands and feet and usually begin with a rash of painful, deep-seated blisters called vesicles, although sometimes itching and burning sensations begin first. As blisters heal, the skin dries and often reddens and peels. This leaves it tender and dry and sometimes creates painful fissures or cracks. Skin can also become infected. Severe cases of dyshidrotic eczema can sometimes lead to large blisters.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "How is dyshidrotic eczema diagnosed?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Dermatologists can usually diagnose dyshidrotic eczema with a skin exam and medical history. Many cases improve quickly with a short course of topical corticosteroids combined with soaking or applying cool compresses to affected areas a few times a day to help dry out blisters. Because this form of eczema is sometimes linked to a fungal infection on the hands or feet, your dermatologist may prescribe an anti-fungal medication if needed.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "How is dyshidrotic eczema treated?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Knowing your triggers and maintaining a regular skincare routine can help prevent and manage dyshidrotic eczema flares. Helpful steps can include:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "- Wash the affected skin with a mild cleanser and gently pat dry.\n"
              "- Apply a heavy cream with ingredients like ceramides to help repair the skin barrier.\n"
              "- Remove rings and other jewelry when you wash your hands so water doesn’t linger on your skin.\n"
              "- Wash then moisturize hands or feet immediately after coming into contact with a potential trigger.\n"
              "- Use stress management techniques.\n"
              "- Keep fingernails short to help prevent scratching from breaking the skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Areas of dyshidrotic eczema are also at risk for bacterial skin infections, which can delay or prevent healing. If you develop swelling, crusting, pain or pus-filled blisters, visit your dermatologist to check for bacterial infection, which requires treatment with oral antibiotics. Some people with eczema use patch testing with an allergist to identify possible triggers.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "When dyshidrotic eczema is severe or flares happen often, dermatologists may prescribe light therapy, topical calcineurin inhibitors (TCIs), corticosteroids or oral steroids. Occasionally, botulinum toxin injections are used to control the sweaty hands and feet that can trigger the condition. Consult with your healthcare provider to determine the best course of treatment for your individual symptoms.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: https://nationaleczema.org/eczema/types-of-eczema/dyshidrotic-eczema/",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// تعريف شاشة Monkey Pox
class MonkeyPoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monkey Pox"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mpox and Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Mpox (previously known as Monkeypox) is a rare infection that appears on the skin as raised spots, which turn into small blisters filled with fluid. These blisters eventually form scabs, which later fall off. The skin symptoms of mpox have the potential to be confused with infected eczema, particularly eczema herpeticum, which is a serious viral herpes infection.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Children and adolescents with a history or presence of atopic eczema are at risk of more severe mpox. If you suspect that you or your child has mpox – or eczema herpeticum – please seek immediate same day medical advice.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Mpox Vaccine (MVA-BN) and Cautions for People with Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The vaccine recommended to protect against mpox is a third generation Modified Vaccinia Ankara (MVA) vaccine, which was first developed in the 1950s for the prevention of smallpox. For most people, the mpox vaccine has a favourable safety profile.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "People with atopic eczema, though, may be more likely to experience certain side effects from the vaccine. These include more intense local skin reactions (such as the skin becoming red or darker than usual, depending on skin tone, swelling and itching) and other general symptoms (such as headache, muscle pain, feeling sick or tired), as well as a flare-up or worsening of their eczema. In rare cases, people with atopic eczema have experienced serious reactions to the vaccine with widespread infection of the skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "National Eczema Society and the UKHSA recommend that people with atopic eczema seek a risk assessment before taking the vaccine in order to balance the risk from exposure to mpox and the risk of possible side effects from vaccination.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "What Does Monkeypox Look and Feel Like?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The disease most commonly starts with fever, then painful lymph nodes and a rash that typically develops one to three days after the fever begins, according to the CDC.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "The rash is the most significant feature of monkeypox, spreading into small, fluid-filled blisters. They become round and hard, like pimples, and then scab.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "You may also have headache, muscle aches, chills, and exhaustion that begin between seven to 14 days after exposure but can develop between five to 21 days post-exposure.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "You are no longer infectious once your scabs have healed, dropped off, and healthy new skin has grown where the lesions were located. That usually takes two to four weeks, according to Robinson.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Children under 8 years old, people who are pregnant or immunocompromised, and individuals with a history of atopic dermatitis or eczema may be at increased risk for severe outcomes from monkeypox.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "What To Do for Suspected Monkeypox",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "If you think you’ve been exposed, notify your medical provider, and monitor yourself for symptoms for 21 days after your last close contact with an infected individual.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "You may have to isolate yourself from other members of your household to limit the spread of the disease, including from pets. This means not having close contact, including touching or other physical contact, no prolonged face-to-face encounters, and not engaging in sex.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "If you have a fever or a growing rash, see your medical health care professional in person.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The most common treatment for monkeypox includes supportive care, such as hydration and treatment of secondary bacterial infections.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "There’s also an approved vaccine called Jynneos for monkeypox and antivirals that doctors may use in certain situations immediately after patient exposure, but these are not widely available in the United States. They are available from the government’s national stockpile of medicines.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "The treatments have been shown to be pretty good at preventing severe illness. The earlier you get them, the better. Early treatment can prevent you from having symptoms or at least making sure that your symptoms are relatively mild.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: https://eczema.org/blog/monkeypox-and-eczema/",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// تعريف الشاشات الأخرى (يمكنك إضافة تفاصيل لكل شاشة)
class NeurodermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neurodermatitis"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Neurodermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Neurodermatitis, also known as lichen simplex chronicus, is a chronic skin condition that causes extremely itchy patches of skin. Scratching can become habitual, making the condition worse and leading to thickened, leathery skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Neurodermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Intense itching, especially when relaxing or trying to sleep.\n"
              "- Thick, leathery patches of skin that can be red, brown, or gray.\n"
              "- Scratching can lead to open wounds, infection, and scarring.\n"
              "- It commonly affects feet, ankles, hands, wrists, neck, scalp, and genital areas.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who Gets Neurodermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "It is most common in adults aged 30-50, and more frequently occurs in women. People with contact dermatitis, atopic dermatitis, psoriasis, and anxiety disorders are at higher risk.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment for Neurodermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Topical corticosteroids and non-steroidal creams to reduce itching.\n"
              "- Occlusive treatments (plastic wrap, zinc oxide gauze) to prevent scratching.\n"
              "- Medicated patches with lidocaine or capsaicin.\n"
              "- Oral antihistamines or anti-anxiety medications to curb nighttime scratching.\n"
              "- Cognitive behavioral therapy, relaxation techniques, and stress management.\n"
              "- Daily moisturizing and wearing loose-fitting clothing to reduce irritation.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class AtopicDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atopic Dermatitis"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Atopic Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Atopic eczema, also known as atopic dermatitis, is the most common form of eczema. It mainly affects children but can also occur in adults. The condition leads to itchy, red, dry, and cracked skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Commonly Affected Areas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Backs or fronts of the knees\n"
              "- Outside or inside of the elbows\n"
              "- Around the neck\n"
              "- Hands\n"
              "- Cheeks\n"
              "- Scalp",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Causes of Atopic Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The exact cause is unknown, but it is often linked to genetic and environmental factors. It commonly occurs in people with allergies and is associated with asthma and hay fever.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Self-care techniques such as avoiding triggers and reducing scratching.\n"
              "- Daily use of emollients (moisturizers) to manage dryness.\n"
              "- Topical corticosteroids to reduce swelling and itching during flare-ups.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who is Affected?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Approximately 1 in 5 children in the UK has atopic eczema. In many cases, it improves by adolescence, but it can persist into adulthood.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: NHS Inform",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Dermatitis"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Contact Dermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Contact dermatitis is an inflammatory skin disease caused by direct contact with an irritant or allergen. It results in redness, swelling, itching, and sometimes blisters.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Types of Contact Dermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- **Allergic Contact Dermatitis**: Caused by an immune reaction to allergens like poison ivy or fragrances.\n"
              "- **Irritant Contact Dermatitis**: Caused by exposure to irritating substances like soaps or hair dye.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Itchy rash, dry or scaly patches.\n"
              "- Skin redness, swelling, and possible blistering.\n"
              "- Can appear anywhere in contact with irritants or allergens.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Common Triggers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Metals (nickel, gold, cobalt)\n"
              "- Fragrances and topical medicines\n"
              "- Rubber and latex products\n"
              "- Preservatives (formaldehyde, parabens)\n"
              "- Plants like poison ivy\n"
              "- Hair dyes",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Diagnosis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "A dermatologist may diagnose contact dermatitis through a physical examination or patch testing to identify allergens. In some cases, a skin biopsy may be done.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Avoid known triggers and wear protective clothing if exposure is unavoidable.\n"
              "- Use mild cleansers and frequent moisturizing to repair the skin barrier.\n"
              "- Over-the-counter hydrocortisone creams or prescribed topical medications.\n"
              "- Biologic or oral prescription medications may be used for severe cases.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Difference Between Contact Dermatitis and Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Unlike atopic dermatitis, contact dermatitis is not hereditary or linked to conditions like hay fever or asthma. It occurs only after skin contact with an irritant or allergen.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class HandEczemaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hand Eczema"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Hand Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Hand eczema, also known as hand dermatitis, is a common type of eczema that affects about 10% of the U.S. population. It is caused by genetics, contact allergens, and irritating substances.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Hand Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Cracked, peeling, or scaly skin\n"
              "- Redness and inflammation\n"
              "- Itchy and painful skin\n"
              "- Dryness, leading to flaking",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Identify and avoid triggers\n"
              "- Use fragrance-free cleansers and lukewarm water\n"
              "- Apply thick moisturizers like petroleum jelly\n"
              "- Wear protective gloves when handling chemicals\n"
              "- Use prescribed treatments such as corticosteroids or biologics",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Home Care Tips",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Moisturize hands immediately after washing\n"
              "- Avoid antibacterial hand sanitizers with alcohol\n"
              "- Use cotton gloves for household chores\n"
              "- Use waterproof gloves when handling wet substances",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Best Moisturizers for Hand Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Ointments with high oil content\n"
              "- Avoid lotions with high water content\n"
              "- Apply moisturizer after each hand wash",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class NummularDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nummular Dermatitis"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Nummular Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Nummular eczema, also known as discoid eczema or nummular dermatitis, is a skin condition that presents as scattered, coin-shaped patches. These patches can be itchy, inflamed, and sometimes oozing.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who Gets Nummular Eczema?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Can occur at any age, but is more common in males.\n"
              "- Triggers include dry skin, insect bites, scrapes, and chemical burns.\n"
              "- Can be associated with other types of eczema, such as contact dermatitis.\n"
              "- Poor blood circulation in the legs can be a contributing factor.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Nummular Eczema",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Coin-shaped lesions on arms, legs, torso, and hands.\n"
              "- Itching and burning sensations.\n"
              "- Lesions may ooze liquid or crust over.\n"
              "- Skin may appear red, pinkish, or brown with inflammation.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Proper diagnosis is key, as it can resemble psoriasis or ringworm.\n"
              "- Dermatologists may use a skin scraping test for confirmation.\n"
              "- Treated with mid- to high-potency topical corticosteroids.\n"
              "- Topical antibiotics may be necessary for secondary infections.\n"
              "- Astringent compresses can help dry out oozing lesions.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class SeborrheicDermatitisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seborrheic Dermatitis"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Seborrheic Dermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Seborrheic dermatitis is a chronic form of eczema that commonly affects areas with oil-producing glands like the scalp, nose, and upper back. It can cause dandruff, itching, and inflamed skin.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Who Gets Seborrheic Dermatitis?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Common in infants and adults aged 30-60.\n"
              "- More prevalent in males.\n"
              "- Some cases are chronic, with flare-ups throughout life.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Causes and Triggers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Overgrowth of Malassezia yeast leading to inflammation.\n"
              "- Stress and hormonal changes.\n"
              "- Harsh detergents, chemicals, and weather changes.\n"
              "- Certain medical conditions like HIV and Parkinson’s disease.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Symptoms of Seborrheic Dermatitis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Flaky skin or dandruff.\n"
              "- Greasy scales on irritated skin.\n"
              "- Redness or discoloration.\n"
              "- Itching and possible hair loss in severe cases.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Treatment and Management",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Use shampoos with pyrithione zinc, selenium sulfide, or ketoconazole.\n"
              "- Maintain a skincare routine with mild cleansers and moisturizers.\n"
              "- For severe cases, dermatologists may prescribe antifungal or steroid treatments.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Reference: National Eczema Association",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
/*
//مشكلة عدم فتح اللينكات
// تعريف شاشة ResearchLinksScreen
class ResearchLinksScreen extends StatelessWidget {
  final List<Map<String, String>> researchPapers = [
    {"title": "A Comprehensive Review of the Treatment of Atopic Eczema", "url": "https://pmc.ncbi.nlm.nih.gov/articles/PMC4773205/"},
    {"title": "A new era of atopic eczema research: Advances and highlights", "url": "https://onlinelibrary.wiley.com/doi/10.1111/all.15058"},
    {"title": "Topical treatments for atopic dermatitis", "url": "https://www.jacionline.org/article/S0091-6749%2823%2901113-2/fulltext"},
    {"title": "Atopic dermatitis guidelines 2023", "url": "https://www.annallergy.org/article/S1081-1206%2823%2901455-2/fulltext"},
    {"title": "Understanding the lived experience of eczema", "url": "https://www.morethanskindeep-eczema.org/uploads/1/2/5/3/125377765/mtsd_report_-_digital_file.pdf"},
    {"title": "Global Report on Atopic Dermatitis 2022", "url": "https://www.eczemacouncil.org/assets/docs/global-report-on-atopic-dermatitis-2022.pdf"},
    {"title": "What Is Eczema?", "url": "https://www.researchgate.net/publication/360486241_What_Is_Eczema"},
    {"title": "Atopic Dermatitis (Eczema) - JAMA Network", "url": "https://jamanetwork.com/journals/jama/fullarticle/2800427"},
    {"title": "Eczema and its Management", "url": "https://eczema.org/wp-content/uploads/Healthcare-Professionals-Guide-June-2018.pdf"},
    {"title": "Eczema Area and Severity Index", "url": "https://en.wikipedia.org/wiki/Eczema_Area_and_Severity_Index"},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eczema Research Papers"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: researchPapers.length,
        itemBuilder: (context, index) {
          final paper = researchPapers[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                paper["title"]!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.open_in_new),
              onTap: () async {
                final url = Uri.parse(paper["url"]!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Could not open ${paper['title']}")),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
*/
class ResearchLinksScreen extends StatelessWidget {
  final List<Map<String, String>> researchPapers = [
    {"title": "A Comprehensive Review of the Treatment of Atopic Eczema", "url": "https://pmc.ncbi.nlm.nih.gov/articles/PMC4773205/"},
    {"title": "A new era of atopic eczema research: Advances and highlights", "url": "https://onlinelibrary.wiley.com/doi/10.1111/all.15058"},
    {"title": "Topical treatments for atopic dermatitis", "url": "https://www.jacionline.org/article/S0091-6749%2823%2901113-2/fulltext"},
    {"title": "Atopic dermatitis guidelines 2023", "url": "https://www.annallergy.org/article/S1081-1206%2823%2901455-2/fulltext"},
    {"title": "Understanding the lived experience of eczema", "url": "https://www.morethanskindeep-eczema.org/uploads/1/2/5/3/125377765/mtsd_report_-_digital_file.pdf"},
    {"title": "Global Report on Atopic Dermatitis 2022", "url": "https://www.eczemacouncil.org/assets/docs/global-report-on-atopic-dermatitis-2022.pdf"},
    {"title": "What Is Eczema?", "url": "https://www.researchgate.net/publication/360486241_What_Is_Eczema"},
    {"title": "Atopic Dermatitis (Eczema) - JAMA Network", "url": "https://jamanetwork.com/journals/jama/fullarticle/2800427"},
    {"title": "Eczema and its Management", "url": "https://eczema.org/wp-content/uploads/Healthcare-Professionals-Guide-June-2018.pdf"},
    {"title": "Eczema Area and Severity Index", "url": "https://en.wikipedia.org/wiki/Eczema_Area_and_Severity_Index"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eczema Research Papers"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: researchPapers.length,
        itemBuilder: (context, index) {
          final paper = researchPapers[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                paper["title"]!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.open_in_new),
              onTap: () async {
                final url = Uri.parse(paper["url"]!);
                try {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to open URL: ${paper['title']}")),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
