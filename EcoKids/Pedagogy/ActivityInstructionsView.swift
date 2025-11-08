import SwiftUI

var activity: Activity =
Activity(imageTitleActivity: "avatar-5",
         nameTitleActivity: "Le jeu du tri en mouvement",
         imageActivity: "img-activity",
         durationActivity: "10-15 minutes",
         objectiveActivity: "associer geste + \n apprentissage du tri.",
         stepActivity: ["\r 1. Placer 3 cerceaux (ou papiers colorés) au sol représentant les poubelles. \r \n 2. L’adulte montre une carte/image (ex : banane, bouteille, journal) \r \n 3. L’enfant doit courir et se placer dans le bon cerceau."],
         counterActivity: 0.0,
         variante: "plusieurs enfants → jeu collectif, chacun doit trouver sa “bonne poubelle”.",
         isFinished: false,
         stickers: "Planete",
         summary: ["Tu sais que la lumière consomme de l’énergie. \r \n L’éteindre c’est aider la Terre !", "Tu sais que l’eau est précieuse ? \r \n Fermer le robinet, c’est la protéger !", "Tu sais que les déchets peuvent être triés ? \r \n Bien trier, c’est donner une nouvelle vie aux objets !", "Tu sais que les plantes adorent l’eau de pluie ? \r \n Les arroser avec, c’est les rendre heureuses !"],
         medal: "medail")


struct ActivityInstructionsView: View {
    @Environment(User.self) private var user
    
    //permet de changer de tab quand on termine une activité
    @Binding var onGoingTab: Int
    
    let selectedActivity: ActivityChoice
    
    var body: some View {
        
        // BACKGROUND BEIGE
        
        ZStack {
            Color.fondBeige
                .ignoresSafeArea()
            
            // SENS DU SCROLL & EVITE LA SUPERPOSITION (ZSTACK)
            
            VStack() {
                
                // SECTION 1 : EN TETE
                
                // -> avatar
                HStack {
                    Image(user.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    // -> nom de l'activité
                    VStack {
                        Text("ACTIVITÉ")
                            .font(
                                .custom("Baloo-Regular", size:40))
                        
                        Text(activity.nameTitleActivity)
                            .font(
                                .custom("ComicNeue-Bold", size:20))
                    }
                }
                
                // SEPARATEUR
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 3)
                    .padding(10)
                
                // SECTION 2 : IMAGE
                
                Image(activity.imageActivity)
                    .resizable()
                    .frame(height: 100)
                
                
                // SECTION 3 : DESCRIPTION JEU
                
                // -> background blanc
                ZStack {
                    Rectangle()
                    
                    //                            .frame(width: 370, height: 470)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                    // SENS DU SCROLL & EVITE LA SUPERPOSITION (ZSTACK)
                    
                    VStack (alignment: .leading) {
                        
                        // -> durée
                        VStack() {
                            HStack {
                                Text("   ⏱ Durée : \(activity.durationActivity)")
                                    .font(
                                        .custom("ComicNeue-Bold", size:18))
                                    .padding(.leading)
                            }
                        } .padding(5)
                        
                        // -> objectifs
                        VStack() {
                            HStack {
                                Text("   🎯 Objectif : \(activity.objectiveActivity)")
                                    .font(
                                        .custom("ComicNeue-Bold", size:18))
                                    .multilineTextAlignment(.center)
                                    .padding(.leading)
                            }
                        } .padding(5)
                        
                        // -> Objectifs ForEach
                        VStack(alignment: .leading) {
                            Text("📝 Déroulé :")
                                .font(
                                    .custom("ComicNeue-Bold", size:18))
                                .padding(.leading, 40)
                            ForEach (activity.stepActivity, id: \.self) {
                                step in
                                Text(step)
                                    .font(
                                        .custom("ComicNeue-Bold", size:18))
                            }.padding(.leading, 20)
                                .padding(.trailing, 20)
                        }
                        
                        // VARIANTE
                        HStack {
                            Text("🌟 Variante : \(activity.variante)")
                                .font(
                                    .custom("ComicNeue", size:15))
                                .multilineTextAlignment(.center)
                                .padding(.leading)
                        } .padding(10)
                        
                        
                        // NAVIGATIONLINK
                        
                        HStack {
                            NavigationLink(destination: ActivitiesView(onGoingTab: $onGoingTab)) {
                                Spacer()
                                Text("J’ai fait l’activité !")
                                    .font(
                                        .custom("ComicNeue-Bold", size:25)
                                    )
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                Spacer()
                            }
                        } /*.navigationTitle("ACTIVITES")*/
                    }
                    .padding(.vertical, 10)
                    
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    ActivityInstructionsView(onGoingTab: .constant(0), selectedActivity: ActivityChoice(image: "La chasse au tri dans la maison", name: "La chasse au tri dans la maison"))
        .environment(faisem)
}
