//
//  DetailView.swift
//  H4X0R News
//
//  Created by Tan Nguyen on 8/6/20.
//  Copyright © 2020 Tan Nguyen. All rights reserved.
//

import SwiftUI

struct DetailView: View {
        //need to pass
    let url : String?

    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}


