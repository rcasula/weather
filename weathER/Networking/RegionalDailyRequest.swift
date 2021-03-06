//
//  RegionalDailyRequest.swift
//  weathER
//
//  Created by Roberto Casula on 28/02/21.
//

import Combine
import Alamofire
import Foundation

struct RegionalDailyRequest {
    
    static let path: String = "/daily/region/days/{day}"
    
    static func request(for day: String, completion: @escaping (DataResponse<RegionalDay, AFError>) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        BaseRequest.request(path.replacingOccurrences(of: "{day}", with: day),
                            decoder: decoder,
                            completion: completion)
    }
    
    static func requestFuture(for day: String) -> Future<RegionalDay, Error>{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return BaseRequest.requestFuture(path.replacingOccurrences(of: "{day}", with: day),
                                         of: RegionalDay.self,
                                         decoder: decoder)
    }
}
