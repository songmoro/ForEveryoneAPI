//
//  DetailedUserView.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct DetailedUserView: View {
    var body: some View {
        ZStack {
            user
        }
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
    
    var user: some View {
        VStack {
            AsyncImage(url: URL(string: "")) {
                if let image = $0.image {
                    image
                }
                else {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            
            Text("Email: ")
            Text("name: ")
        }
    }
    
    //    var ContextButton: some View {
}

#Preview {
    DetailedUserView()
}
