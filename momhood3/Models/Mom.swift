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
    var dateOfBirth: Double?
    var expectedDueDate: Double?
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
    var inputDate: Double?
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
