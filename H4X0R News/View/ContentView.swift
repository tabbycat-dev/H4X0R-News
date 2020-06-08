//
//  ContentView.swift
//  H4X0R News
//
//  Created by Tan Nguyen on 8/6/20.
//  Copyright © 2020 Tan Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    //wrapper is mark as listener
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                //nagivationLink is clickable for each cell
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }//dynamic content using trailing closure
        .navigationBarTitle("H4XOR News")
        }
            //~ viewDidLoad to call fetch Data func
            .onAppear {
                self.networkManager.fetchData()
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post : Identifiable {
//    //Post conforms to Identifiable Protocol for the list to be able to recognized the order of our POst objects based on this ID. Must include property id
//    let id: String
//    let title : String
//
//}
//    let posts = [
//        Post(id: "1", title: "Title 1"),
//        Post(id: "2", title: "Title 2"),
//        Post(id: "3", title: "Title 3")
//        ]

