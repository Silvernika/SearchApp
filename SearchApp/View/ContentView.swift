//
//  ContentView.swift
//  SearchApp
//
//  Created by Nika Pauluchenka on 25.07.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var apiViewModel: ApiViewModel
    @State var searchLine: String = ""
    private let fieldMaxWidth = 350.0
    private let imageWidth = 180.0
    private let imaheHeight = 250.0
    private let fieldMaxHeight = 25.0
    private let cornerRadius = 10.0
    var isSignInButtonEnabled: Bool {
        return !searchLine.isEmpty
    }
    
    var columns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        VStack{
            Text("Search on Pexels.com")
                .bold()
                .padding(.top)
                .font(.title)
            TextField("SearchLine", text: $searchLine)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: cornerRadius).fill(Color(.secondarySystemBackground)))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: 0.7)
                )
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .frame(maxWidth: fieldMaxWidth, alignment: .topLeading)
            
            Button {
                guard !searchLine.isEmpty else { return }
                Task {
                    await apiViewModel.searchImages(query: searchLine)
                    
                }
                
            } label: {
                Text("Search")
                    .padding()
                    .frame(maxWidth: fieldMaxWidth - 250)
                    .frame(maxHeight: fieldMaxHeight)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: cornerRadius).fill(isSignInButtonEnabled ? Color(.blue) : Color(.gray)))
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(lineWidth: 0.7)
                    )
                
            }
            .disabled(!isSignInButtonEnabled)
            ScrollView{
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(apiViewModel.images){element in
                        AsyncImage(url: URL(string: element.src.original)){image in
                            image.resizable()
                                .frame(width: imageWidth, height: imaheHeight)
                                .cornerRadius(30)
                            
                            
                        }placeholder: {
                            ProgressView()
                                .frame(width: imageWidth, height: imaheHeight)
                                .cornerRadius(30)
                        }
                        .onAppear{
                            
                            if element.id == apiViewModel.images.last?.id{
                                Task{
                                    await apiViewModel.loadMoreImages(query: searchLine)
                                }
                            }
                            
                        }
                    }
                    }
                }
                .padding()
            }
            
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        ContentView().environmentObject(ApiViewModel())
    }
}
