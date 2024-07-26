//
//  ApiService.swift
//  SearchApp
//
//  Created by Nika Pauluchenka on 26.07.24.
//

import Foundation

class ApiService {
    private var decodedResponse: ResponceBody = ResponceBody(photos: [], next_page: "")
    private var per_page: Int = 4;
    private var url: URL?
    private var previousQuery: String = ""
    
    func sendRequest(query: String) async -> ResponceBody {
        do {
            
            if (decodedResponse.next_page == "" || previousQuery != query){
                 url = URL(string: "https://api.pexels.com/v1/search/?page=1&per_page=\(per_page)&query=\(query)")
                
            } else {
                 url = URL(string: decodedResponse.next_page)
            }
            var urlRequest = URLRequest(url: url!)
            urlRequest.setValue("8qEITLWwM3A0d9dxP0GDvSa7e6KuMbEJCoCcihxYjfe9HwdtAO33RdV0", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(ResponceBody.self, from: data)
            previousQuery = query
            self.decodedResponse = decoded
            
        } catch {
            
        }
        return decodedResponse
       
    }
}
