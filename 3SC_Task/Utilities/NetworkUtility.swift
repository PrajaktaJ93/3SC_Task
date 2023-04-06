//
//  NetworkUtility.swift
//  3SC_Task
//
//  Created by Prajakta on 06/04/23.
//

import Foundation

public final class NetworkUtility {
    
    public let session: URLSession

    static let shared: NetworkUtility = NetworkUtility()
    
    public init() {
        self.session = URLSession(configuration: .default)
    }
    
    func fetchDataFromApiWith<T: Codable>(url :URL,
                                          completionBlock: @escaping ((T?, Int) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        session.dataTask(with: request, completionHandler: {
            rawData, apiResponse, resError in
            guard let data = rawData, let res = apiResponse as? HTTPURLResponse, res.statusCode == 200
            else { return }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionBlock(decodedData, res.statusCode)
            } catch {
                print("error: ", error)
            }
            
        }).resume()
    }
}
