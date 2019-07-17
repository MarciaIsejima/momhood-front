//
//  SampleData.swift
//  momhood
//
//  Created by laptop on 2019-06-28.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

let json_old = """
{ "_id" : { "$oid" : "5d16f0e76ab86f30f46adf48" }, "week_count" : 16, "period" : "2nd semester", "baby" : { "name" : "Baby", "tagline" : "Baby's First Hiccups Ahead!", "fruitsize" : "a Navel Orange", "size" : "10 - 13 cm", "weight" : "0.09 - 0.11 kg", "articles" : [ { "title" : "What do babies develop this week", "list" : [ "Baby is listening to your voice", "Baby is growing hair, lashes and eyebrows", "The taste buds are forming", "Thumb sucking habit already begun", "The ciculatory system is now up and running" ] } ] }, "yourbody" : { "tagline" : "Heartburn & Indigestion", "articles" : [ { "title" : "Symptoms", "imageurl" : "bodySymptoms", "list" : [ "Occasional headache", "Faintness or dizziness", "Heartburn & indigestion", "Backaches", "Sciatica nerve pain", "Periodontitis", "Skin pigmentation" ] }, { "title" : "Body Changes", "imageurl" : "bodyChanges", "list" : [ "Your breast continue growing", "Increased vaginal discharge, may cause discomfort", "Swollen bloow vessels in your legs" ] } ] }, "diet" : { "tagline" : "Breakfast is Priority", "articles" : [ { "title" : "What to Eat", "imageurl" : "dietWhatToEat", "list" : [ "Keep your weight gain healthy and gradual", "Get enough food sources for vitamin C to produce collagen and elastin", "Go for greens and lentils", "Get your iron on!", "Drink enough liquid", "Increase in whole grains, fruits, vegetables, low-fat nutrient-rich proteins, unsaturated fats" ] }, { "title" : "What to Limit", "imageurl" : "dietWhatToLimit", "list" : [ "Limit your caffein intake. If you're coffee lover, have half of a cup daily", "Decrease in saturated and trans fats , sweetened beverages and other refined sugars", "Avoid bisque and cream soups", "Don't go with big meals as it may cause constipation", "If you're seafood lover, start avoid seafood that high in mercury" ] } ] }, "activities" : { "tagline" : "Think of a baby name list", "articles" : [ { "title" : "Lifestyle", "imageurl" : "activitiesLifestyle", "list" : [ "Try a prenatal message to lower your backaches", "Take warm baths or showers", "Take care of your dental health (floss more and visit your dentist)", "Replace any fluids you lose after 30 minutes sweating excercise" ] }, { "title" : "Recommendation", "imageurl" : "activitiesRecommendation", "list" : [ "Schedule your prenatal visit", "Schedule your mid-preganacy ultrasound", "Schedule for the Quad screen", "Avoid sleeping on your back", "Talk to your baby", "Keep your weight gain healthy and gradual" ] } ] } }
""".data(using: .utf8)!

public func retrieveSampleData2() -> Data {
    return json_old
}

let user_json = """
{"_id": "5d2e65691c9d44000094a6ec",
"profileInfo": {"name": "Katie", "email": "katie1234@gmail.com", "password": "katie1234", "dateOfBirth": 0, "expectedDueDate": 0, "preferredMetrics": "kg/cm", "prePregnancyWeightValue": 55.0, "prePregnancyWeightUnit": "kg", "prePregnancyWaistValue": 80.0, "prePregnancyWaistUnit": "cm", "heightValue": 156.0, "heightUnit": "cm"},
"babyInfo": {"nickname": "John", "gender": "male"},
"partnerInfo": [{"name": "Joey","email": "joey1234@gmail.com","phone": "12345678991","relationship": "partner","status": 1},
{"name": "Maggie","email": "maggie9999@gmail.com","phone": "393994005959","relationship": "mother","status": 1}],
"trackingInfo": [{"inputDate": 0,"weightValue": 55.5,"weightUnit": "kg","waistValue": 82.0,"waistUnit": "cm","moodId": 3}]
}
""".data(using: .utf8)!


public func retrieveUserData() -> Data {
    return user_json
}


