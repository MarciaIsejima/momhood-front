//
//  Mom.swift
//  momhood3
//
//  Created by laptop on 2019-07-16.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

var mom = Mom()
var momTrackingValues = [TrackingInfo]()
//"_id": "5d2e65691c9d44000094a6ec",
//"profileInfo": {"name": "Rose", "email": "katie1234@gmail.com", "password": "katie1234", "dateOfBirth": 0, "expectedDueDate": 0, "preferredMetrics": "kg/cm", "prePregnancyWeightValue": 55.0, "prePregnancyWeightUnit": "kg", "prePregnancyWaistValue": 80.0, "prePregnancyWaistUnit": "cm", "heightValue": 156.0, "heightUnit": "cm"},
//"babyInfo": {"nickname": "John", "gender": "male"},
//"partnerInfo": [{"name": "Joey","email": "joey1234@gmail.com","phone": "12345678991","relationship": "partner","status": 1},
//{"name": "Maggie","email": "maggie9999@gmail.com","phone": "393994005959","relationship": "mother","status": 1}],
//"trackingInfo": [{"inputDate": 0,"weightValue": 55.5,"weightUnit": "kg","waistValue": 82.0,"waistUnit": "cm","moodId": 3}]
//}

struct Mom: Codable {
    var _id: String?
    var profileInfo: ProfileInfo?
    var babyInfo: BabyInfo?
    var partnerInfo: [PartnerInfo]?
    var trackingInfo: [TrackingInfo]?
    
    func getCurrentWeek() -> Int {
        return 16
    }
}

struct ProfileInfo: Codable {
    var name: String?
    var email: String?
    var password: String?
    var dateOfBirth: Int?
    var expectedDueDate: Int?
    var preferredMetrics: String?
    var prePregnancyWeightValue: Double?
    var prePregnancyWeightUnit: String?
    var prePregnancyWaistValue: Double?
    var prePregnancyWaistUnit: String?
    var heightValue: Double?
    var heightUnit: String?
}

struct BabyInfo: Codable {
    var nickname: String?
    var gender: String?
}

//struct PartnerInfo: Codable {
//    var partnerList: [Partner]?
//}

struct PartnerInfo: Codable {
    var name: String?
    var email: String?
    var phone: String?
    var relationship: String?
    var status: Int?
}

//struct TrackingInfo: Codable {
//    var trackingValues: [TrackingValue]?
//}

struct TrackingInfo: Codable {
    var inputDate: Int?
    var weightValue: Double?
    var weightUnit: String?
    var waistValue: Double?
    var waistUnit: String?
    var moodId: Int?
}

func loadUserInfo() {
    // function that retrieves user information
    
    /*** replace this by call to api ***/
    let json = retrieveUserData()
    
    let decoder = JSONDecoder()

    if let user = try? decoder.decode(Mom.self, from: json){
        mom = user
    }
   
//    if let JSONString = String(data: json, encoding: String.Encoding.utf8) {
//        print(JSONString)
//    }
    
}
