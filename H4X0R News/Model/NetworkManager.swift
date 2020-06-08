//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Tan Nguyen on 8/6/20.
//  Copyright © 2020 Tan Nguyen. All rights reserved.
//

import Foundation
//1.ObservableObject will broadcast one or many of its properties to any interested parties
// need to mofify from struct to class
class NetworkManager : ObservableObject {
    @Published var posts = [Post]() //like rss, subscribe to hear content change
    
    let urlString = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    let titlePath =  "hits[8].title"
    
    func fetchData(){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                          let results = try decoder.decode(Result.self, from: safeData)
                            //result should processed in background
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch {
                            print(error)
                        }

                    }
                }
            }
            task.resume()
    }
}
}
