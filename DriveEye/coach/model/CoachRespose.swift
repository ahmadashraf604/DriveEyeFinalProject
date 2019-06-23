import Foundation
import UIKit

struct CoachRespose {
    let status: Bool
    let response: [Coach]
}

struct Coach {
    let coachingID: Int
    let title, responseDescription: String
    let image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case coachingID = "coachingId"
        case title
        case responseDescription = "description"
        case image
    }
    static func getAllCoaches() -> [Coach]{
        var coaches : [Coach] = []
        
        coaches.append(Coach(coachingID: 1, title: "Seat Belt", responseDescription: "Do you always wear your seat belt? You should. Statistics show that you're always safer in a car accident wearing a seat belt than not wearing one.Knowing is the first step in preventing.Follow these important seat belt safety tips – they could save your life:Always buckle up before driving or riding in a car. This goes for everyone in the vehicle, whether you're sitting in the front or the back.Wear the lap belt low across the hips and below your stomach.Wear the shoulder belt over your collarbone, away from your neck. It should cross over your chest. In most new cars, you can adjust shoulder belts to improve their height and fit.A seat belt that works properly will keep you at a safe distance from the dashboard and the airbag. For more information about staying safe in a car with airbags, read our Airbag Safety Tips.Children should never sit in the front passenger seat until they reach at least age 13.Secure all young children in child safety seats. For more about staying safe when it comes to car seats and booster seats, read our Car Seat Safety Tips.If you're pregnant and riding in a car, make sure the safety belt is snug against your hips. Loose belts can cause broken ribs or injuries to your belly. Never put a lap belt across your stomach when you're pregnant.", image: #imageLiteral(resourceName: "Seatbelt")))
        
        coaches.append(Coach(coachingID: 2, title: "Avoid Distracted Driving", responseDescription: "If you are drowsy, pull off the road. Drowsiness increases the risk of a crash by nearly four times. A government study showed that 37 percent of U.S. drivers have nodded off or actually fallen asleep at least once during their driving careers. If you feel tired, get off the road; don't try to get home faster. Avoid eating while driving. Being busy is no excuse for distracted driving. Finishing your breakfast on the way to work or school may seem like a time-saver, but it means you are less attentive to the drivers around you. Food spills are a major cause of distraction.", image: #imageLiteral(resourceName: "phone_drive")))
        
        coaches.append(Coach(coachingID: 3, title: "Do You Hold a Steering Wheel Correctly..", responseDescription: "Properly holding the steering wheel of your vehicle is an important safety precaution to observe every time you get behind the wheel. When you complete your driving exam, the administrator will watch your body position while you are behind the wheel of the test vehicle. One aspect that the instructor will be looking for is proper placement of your hands on the steering wheel. Many drivers often wonder why the way that they hold or use the steering wheel of a vehicle is evaluated during the examination required to obtain a driver’s license. Drivers who use the correct technique to hold the steering wheel of their vehicle are less likely to have an accident and will be able to use their vehicle more efficiently. Statistics show that improper steering wheel techniques are the main cause of crashes when drivers run off the road. Even experienced drivers should be conscious of their posture, body position, and hand placement while driving.", image: #imageLiteral(resourceName: "holding-the-wheel")))
        
        return coaches
    }
}
