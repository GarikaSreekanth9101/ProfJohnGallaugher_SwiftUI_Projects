//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    
    private let names: [String] = ["Ada Lovelace",
                                   "Admiral Grace Hopper",
                                   "The ENIAC Team",
                                   "Sister Mary Kenneth Keller",
                                   "Radia Perlman",
                                   "Annie Easley",
                                   "Karen Spärck Jones",
                                   "Limor Fried",
                                   "Mira Murati",
                                   "Juliana Rotich",
                                   "Dr. Lisa Su",
                                   "Joy Buolamwini",
                                   "Marita Cheng",
                                   "Jean Liu",
                                   "Tammarrian Rogers"
    ]
    private let bios: [String] = ["Ada Lovelace: Although she lived well before the invention of modern computers, Ada Lovelace is one of the most famous women in computer science history. Born Augusta Ada Byron, she was the only child of the famous poet Lord Byron who was not born out of wedlock. A few weeks after Ada’s birth, her parents separated, with her mathematically gifted mother taking sole custody of Ada. Her mother managed to steer her away from poetry and towards mathematics and science, but Ada’s understanding of the latter subjects was influenced by the imagination she inherited from her father.\nToday, the Countess of Lovelace is best known for her work on the Analytical Engine, a general-purpose computer designed by Charles Babbage. She is recognized as the first computer programmer for her notes on the machine.",
                                  "Admiral Grace Hopper: Grace Murray Hopper, dubbed “Amazing Grace” for reasons that will become obvious, was at the forefront of the relatively new field of computer science. She earned a master’s degree and Ph.D. from Yale in Mathematics in the early 1930s, taught for several years at Vasser College, where she had obtained her bachelor’s degrees in Mathematics and Physics, then joined the Navy in 1943 when the U.S. entered World War II. Because of her age and small frame, Hopper had to receive a special exemption to join the Navy.\nDuring her naval career, Grace attained the rank of rear admiral and worked on the Harvard Mark I and Mark II computers. Although she left active service in 1946, she remained a Navy reservist and even returned to active duty at the age of 60 to help standardize the Navy’s computer programming languages. She retired at the age of 79 as the oldest serving officer in the U.S. Armed Forces.\nIn the private sector, her team developed the first computer language compiler, A-0, as well as Flow-Matic, the first programming language to use English-like commands. She also worked on the UNIVAC I computer and helped popularize COBOL, the first standardized general business computer language. A College of Yale University is named in her honor.",
                                  "The ENIAC Team: If you read “Famous Women in Computer Science” and immediately think of the 2016 film “Hidden Figures,” you’re not alone. NASA was not the only organization hiring female mathematicians to serve as human computers. During World War II, some of the best and brightest were selected to calculate ballistic trajectories. Many later moved into technology careers, working on the UNIVAC I computer with Grace Hopper as well as ENIAC (Electronic Numerical Integrator and Computer), the world’s first general-purpose computer.\nOn the eve of its debut, ENIAC was non-operational. A group of women who had been working on the machine stayed late to fix it. Their names were Betty Jean Jennings Bartik, Kathleen McNulty, Mauchly Antonelli, Ruth Lichterman Teitelbaum, Frances Bilas Spence, Marlyn Wescoff Meltzer, and Frances Snyder Holberton. All deserve a place on the list of famous computer scientists, though they are best remembered for their collective work.",
                                  "Sister Mary Kenneth Keller: Giving Lord Byron’s daughter a run for her money in the category of “people you wouldn’t expect to be famous computer scientists” is Sister Mary Kenneth Keller. Keller was a nun of the Sisters of Charity of the Blessed Virgin Mary. In 1965 at Washington University, she became one of the first two people — and, notably, the first woman — to earn a doctorate in computer science.\nKeller also earned a Bachelor of Science in Mathematics and a Master of Science in Mathematics and conducted research at the University of Wisconsin, the University of Michigan, Dartmouth College, and Purdue. At Dartmouth, she helped develop the BASIC computer language that allowed even those not well-versed in mathematics to write computer code.",
                                  "Radia Perlman is commonly acknowledged as the “Mother of the Internet.” Perlman herself disputes this title, though, noting that many people contributed to the invention of the internet. Her own contributions were fundamental to the technology, though, as she developed the Spanning Tree Protocol (STP) that made the internet possible. It works as a sort of traffic pattern that includes multiple links between network points so that if one link fails, backups are always ready to ensure the data is still accessible. In 2000, she released “Interconnection,” a textbook that simplified network routing and bridging.\nPerlman earned her Ph.D. in Computer Science at MIT. Her mother was a mathematician/computer programmer like some of the women mentioned above. Interestingly, despite the contributions of such women, computer science still looked like a male-dominated field when Perlman attended MIT in the late 60s and 70s. She was one of about 50 female students in a class of 1,000. Over the course of her career, Perlman has held more than 80 patents related to internet technology, and she has received several awards recognizing her importance in the field of computer science. In 2014, Perlman was inducted into the Internet Hall of Fame.\nReady to watch a tech-talented protagonist put her computer science skills to work? Check out #WarGames, Eko’s new interactive series that’s loosely based on the 1983 movie “WarGames.” #WarGames puts a new spin on the original by replacing Matthew Broderick’s teen hacker with a female lead and updating the plot to reflect the modern political and technological landscape. You’ll even get to make your own contribution, as your viewing behavior affects key plot points and the main character’s development.",
                                  "Annie Easley made the jump from 'human computer' to computer programmer while working at the mid-century agency of what would become NASA. Running simulations at a freaking 'Reactor Lab,' she was one of only four African-American employees. She is well known for her work encouraging women and people of color to enter STEM fields.\nLater, her work as a programmer involved energy conversion systems. According to NASA, she developed and implemented code that led to the development of the battery used in the first hybrid cars. You're welcome, Prius drivers.",
                                  "Karen Spärck Jones: The search engines we use daily rely on the natural language processing discoveries made by one female computer scientist, Karen Spärck Jones. She was recruited to Cambridge into the Language Research Unit by another female professor, the computational linguist Margaret Masterman.\nJones' most notable achievements laid the groundwork for the sort of information retrieval we use today. She introduced the use of thesauri into language processing, allowing for computational recognition of similar words. And she also introduced the idea and methods of 'term weighing' in information retrieval, which helped queries determine which terms were the most relevant.",
                                  "Limor Fried: Limor Fried founded Adafruit Industries from her dorm room at MIT. A veteran of DIY hardware hacking, she wanted to make building electronics at home easier. In 2005, the 'maker culture' pioneer officially launched her online store and started selling all the tools and equipment any hacker could want. Today, Adafruit earns more than $40 million annually selling over a thousand different parts. The shop stocks most everything you need to overclock an old iMac, build an LCD display or light up a cosplay costume. The Adafruit website also hosts a variety of how-to guides for anyone looking to boost their circuit-bending skills. The company has over 100 employees who work out of a 50,000-square-foot factory in New York City. In 2016, the White House named Fried one of 10 'Champions of Change for Making.' She also received the O'Reilly Open Source Award at the Open Source Convention in 2013 and was the first 'lady engineer' featured on the cover of Wired magazine.",
                                  "Mira Murati has been recognized as one of the most influential women in business, technology, and artificial intelligence. She is the founder of Thinking Machines Labs, an early stage AI startup. Prior to this she served as both Chief Technology Officer and briefly as Chief Executive Officer of OpenAI, the parent firm of ChatGPT. Murati had previously served in technology leadership roles at Tesla and Leap Motion. She is also a strong advocate for for responsible and ethical AI deployment.",
                                  "Juliana Rotich is a Technologist, MIT Media Lab Director's Fellow, TED Senior Fellow and currently serves as Chair of World Economic Forum Global Agenda Council on Data Driven Development. Juliana is Co-founder of BRCK Inc.  A hardware company based in Kenya that makes BRCK and other devices. BRCK  is a self-powered mobile WiFi router that has on-board battery and storage, a backup generator for the internet. It provides redundant internet connectivity using wireless or ethernet backhaul. BRCK stands for “rugged internet for people and things”, and it takes its name from its sturdy boxy shape. Juliana is Co-founder of Ushahidi Inc, a non-profit tech company, born in Africa, which specializes in developing free and open source software for changing how information flows in the world. Ushahidi also acts a catalyst in innovation as part of the Making All Voices Count global challenge for development. She is an internationally sought after keynote speaker as well as strategic advisor to the councils of BASF, Microsoft 4Afrika and Waabeh Ltd. She is also a trustee of The iHub in Kenya and Bankinter Foundation for Entrepreneurship and Innovation in Spain.",
                                  "As CEO of Advanced Micro Devices (AMD), Lisa Su is credited with pulling the 50-year-old company out of a financial tailspin by expanding into the graphics and video games chip market. Through Su's leadership, AMD is the sole chip provider for both Microsoft's Xbox and Sony's PlayStation gaming consoles. As founder of IBM's Emerging Products group, she led a 10-person team focused on improving broadband access and improved battery life for cell devices. Su sits on the board of multiple trade organizations, including Analog Devices, the Global Semiconductor Alliance (GSA) and the U.S. Semiconductor Industry Association.",
                                  "Joy Buolamwini is a computer scientist and digital activist based at the MIT Media Lab. As founder of the Algorithmic Justice League, she identifies bias in artificial intelligence and develops practices for accountability. Buolamwini's TED Talk on algorithmic bias has been viewed over one million times. Her New York Times op-ed on the dangers of facial analysis technology galvanized lawmakers to investigate the risks posed by this technology. She received a $50,000 grant as the Grand Prize winner of a national contest inspired by the critically acclaimed film Hidden Figures.",
                                  "Marita Chang: Startups are meant to solve problems but most companies are not quite as impactful as the one founded by Australian native Marita Cheng. The Forbes Under 30 alum founded Aubot, a telepresence robot designed for kids with cancer to virtually attend school, and people with a disability to attend work. While attending the Google-funded Singularity University, Cheng cofounded Airpoly, an app that recognizes and relays objects in real-time for the visually impaired. Cheng also founded the non-profit Robogals, an international student-run organization for young women pursuing education and careers in engineering which has taught over 70,000 robotics workshops around the world.",
                                  "Goldman Sachs alum Jean Liu joined rideshare startup Didi Chuxing in 2014, China's largest mobile transportation platform. Didi is now in 400 cities across China and has been valued at $50 billion, making it one of the most valuable startups in the world. Liu won the turf war with Uber when she and Didi's chairman, Cheng Wei, got Uber to sell its China operation What more, Liu has ensured that women are given opportunities to rise to the top at Didi. Women occupied 37% of its tech positions in 2017. The company cleared 1.4 billion rides last year alone, more than Uber has ever done.",
                                  "Tammarrian Rogers: Snap is a lot more than a vanishing photo app these days, and Tammarrian Rogers is making the company's evolution run smoothly. As director of engineering, Rogers oversees the quality assurance, release management, localization, and IT teams responsible for the final experience and stability of the core Snapchat app as well as the building and maintenance of efficient workplace systems. She is one of the key Snap engineering leads overseeing the company's major Android stability initiative--a cross-functional project designed to improve both the coding experience for Snapchat Android developers and the customer experience for Snapchatters on Android. She is also CTO of OPTYVA, a consultancy and digital media group specializing in sustainability, business transformation, design and development, communications, and community development. During her 20-year career at Microsoft leading teams in the Office, Online Services, and Windows Divisions, she was responsible for overseeing numerous programs and initiatives designed to improve efficiencies and code quality. She spent her early career as a Hardware Engineer at Apple. She serves on or advises several boards including Ada Developers' Academy in Seattle, the Alternative Healthcare Access Campaign and Academic Sports Achievement Seattle."
    ]
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        
        VStack{
            //MARK: TOP View
            HStack {
                
                Button {
                    //TODO: Left Arrow Button Action
                    //Ternary Operator Approch
                    currentIndex = (currentIndex - 1 + names.count) % names.count //handling for negative value also
                } label: {
                    Image(systemName: "chevron.left.circle")
                }
                Spacer()
                Text(names[currentIndex])
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                Spacer()
                Button {
                    //TODO: Right Arrow Button Action
                    //Ternary Operator Approch
                    currentIndex = currentIndex >= names.count-1 ? 0 : currentIndex + 1
                    //General Approch
//                    currentIndex += 1
//                    if currentIndex >= names.count {
//                        currentIndex = 0
//                    }
                } label: {
                    Image(systemName: "chevron.right.circle")
                }
            }//HStack
            .bold()
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.cyan.opacity(0.5))
            
            Spacer()
            
            Image(names[currentIndex])
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 20)
                .padding()
            
            ScrollView{
                Text(bios[currentIndex])
                    .padding()
            }
            
            Spacer()
            
            //MARK: Bottom View
            HStack {
                
                Spacer()
                Button {
                    //TODO: Shuffle Button Action
                    var newIndex: Int
                    repeat {
                        newIndex = Int.random(in: 0...names.count - 1)
                    }while newIndex == currentIndex
                    currentIndex = newIndex
                    playSound(soundName: "theme")
                } label: {
                    Image(systemName: "shuffle")
                }
            }//HStack
            .bold()
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.cyan.opacity(0.5))
            
        }//VStack
        
    }
    
    func playSound(soundName: String){
        
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer.stop()
        }
        
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch{
            print("😡 ERROR: \(error.localizedDescription) creating audio player")
        }
        
    }
    
}

#Preview {
    ContentView()
}
