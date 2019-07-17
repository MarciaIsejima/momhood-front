//
//  WeekInfo.swift
//  momhood
//
//  Created by laptop on 2019-06-27.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

var timeline = [Week]()
var currentWeek = Week()

struct Week: Codable {
    var week_count: Int?
    var period: String?
    var baby: Baby?
    var yourbody: Yourbody?
    var diet: Diet?
    var activities: Activity?
}

struct Baby: Codable {
    var name: String?
    var tagline: String?
    var fruitsize: String?
    var size: String?
    var weight: String?
    var articles: [Article]?
}

struct Yourbody: Codable {
    var tagline: String?
    var articles: [Article]?
}

struct Diet: Codable {
    var tagline: String?
    var articles: [Article]?
}

struct Activity: Codable {
    var tagline: String?
    var articles: [Article]?
}

struct Article: Codable {
    var title: String?
    var imageurl: String?
    var list: [String]?
}

//Array that stores each week styling properties
var weekColors: [Int] = [
    0xffffff,   //week 0
    0xffede1,   //week 1
    0xededed,   //week 2
    0xf8f5f0,   //week 3
    0xfefaf1,   //week 4
    0xf9f7f8,   //week 5
    0xe8f1f8,   //week 6
    0xf5cfdc,   //week 7
    0xeee2f8,   //week 8
    0xf5f4e0,   //week 9
    0xf4dfe8,   //week 10
    0xffdbdb,   //week 11
    0xeff5c7,   //week 12
    0xffe5cc,   //week 13
    0xfcf7f7,   //week 14
    0xe3e7d0,   //week 15
    0xffe6de,   //week 16
    0xffffff,   //week 17
    0xffffff,   //week 18
    0xffffff,   //week 19
    0xffffff,   //week 20 - add other weeks whenever necessary
]

//Array that stores sessions background colors
let sessionBkgColors: [String: Int] = [
    "baby":0xffffff,
    "yourbody": 0xf8eaf9,
    "diet": 0xf6dfd9,
    "activities": 0xdbeae5
]

//Array that stores sessions headers colors
let sessionTitleColors: [String: Int] = [
    "baby": 0x333333,
    "yourbody": 0xd385d2,
    "diet": 0xe28874,
    "activities": 0x6fa38e
]

var namesOfIntegers = [Int: String]()
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
    var price: Price?
}

struct Price: Codable{
    var unit: String?
    var value: Double?
}

func loadTimeline() {
    
    let json = retrieveSampleData()
    
    let myPrice = Price(unit: "C$", value:20)
    
    var myList = GroceryProduct(name: "Peach", points: 500, description: "Very expensive fruit!!!", price: myPrice )
    myList.name = "Aceroli"
    
    print("\(myList.price!.unit ?? "")  ")
    
    
    let decoder = JSONDecoder()
    
    if let weeks = try? decoder.decode([Week].self, from: json) {
        timeline = weeks
    }
    
}

func loadCurrentWeek() {
    // function that retrieves the current week of pregnancy based on user data
    
    /*** replace this by current week calculation function +
     call to api ***/
    let json = retrieveSampleData2()
    
    let decoder = JSONDecoder()
    
    if let week = try? decoder.decode(Week.self, from: json){
        currentWeek = week
    }
}
