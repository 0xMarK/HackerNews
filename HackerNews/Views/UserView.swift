//
//  UserView.swift
//  HackerNews
//
//  Created by Anton Kaliuzhnyi on 12.05.2021.
//

import SwiftUI

struct UserView: View {
    
    @Environment(\.api) private var api
    
    @State var id: String
    
    @State var user: User?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Text("User:")
                    .fontWeight(.semibold)
                Text(id)
            }
            HStack(alignment: .top) {
                Text("Created:")
                    .fontWeight(.semibold)
                if let created = user?.created,
                   let createdDate = Date(timeIntervalSince1970: TimeInterval(created)) {
                    Text(createdDate, style: .date)
                } else {
                    Text("Loading...")
                        .foregroundColor(.secondary)
                }
            }
            HStack(alignment: .top) {
                Text("Karma:")
                    .fontWeight(.semibold)
                if let karma = user?.karma {
                    Text("\(karma)")
                } else {
                    Text("Loading...")
                        .foregroundColor(.secondary)
                }
            }
            HStack(alignment: .top) {
                Text("About:")
                    .fontWeight(.semibold)
                if let about = user?.about {
                    HTMLView(html: about)
                        .font(.body)
                } else {
                    Text("Loading...")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .navigationBarTitle(Text(id))
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        api.user(id: id) { result in
            user = try? result.get()
        }
    }
    
}

struct UserView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            UserView(id: "jl")
        }
    }
    
}