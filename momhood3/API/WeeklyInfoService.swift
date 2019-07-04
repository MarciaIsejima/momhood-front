//
//  WeeklyInfoService.swift
//  momhood
//
//  Created by laptop on 2019-06-27.
//  Copyright © 2019 Langara. All rights reserved.
//
//
//import Foundation
//
//protocol WeeklyInfoSearchServiceDelegate: class {
//    func requestFailed(with error: Error)
//}
//
//protocol WeekInfoDelegate: WeeklyInfoSearchServiceDelegate {
//    func searchCompleted(with timeline: Timeline)
//}
//
//final class WeekInfoSearchService {
//    
//    private weak var delegate: WeeklyInfoSearchServiceDelegate?
//    private let client = APIClient()
//    
//    init(delegate: WeeklyInfoSearchServiceDelegate) {
//        self.delegate = delegate
//    }
//    
//    func weeklyInfo(weekUpTo: Int) {
//        let request = APIRequest(method: .get, path: "week")
//        
//        request.queryItems = [
//            URLQueryItem(name: "", value: "\(weekUpTo)"),
//        ]
//        
//        request.headers = [HTTPHeader(field: "Content-Type", value: "application/json")]
//        
//        APIClient().request(request) { [weak self] (response, data, error) in
//            guard error == nil else {
//                self?.delegate?.requestFailed(with: error!)
//                return
//            }
//            
//            if let data = data, error == nil {
//                if let timeline = try? JSONDecoder().decode(Timeline.self, from: data), let delegate = self?.delegate as? WeekInfoDelegate {
//                    delegate.searchCompleted(with: timeline)
//                }
//            } else {
//                self?.delegate?.requestFailed(with: APIError.requestFailed)
//            }
//        }
//        
//    }
//}
