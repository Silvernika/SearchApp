//
//  ApiViewModel.swift
//  SearchApp
//
//  Created by Nika Pauluchenka on 25.07.24.
//

import Foundation

class ApiViewModel: ObservableObject {
    @Published var images = [Image]()
    
    private var apiService = ApiService()
    
    @MainActor
    func searchImages(query: String) async {
        let responseData = await apiService.sendRequest(query: query)
        self.images.removeAll()
        self.images = responseData.photos
    }
    
    @MainActor
    func loadMoreImages(query: String) async {
        let responseData = await apiService.sendRequest(query: query)
        self.images.append(contentsOf: responseData.photos)
    }
    
    
}
