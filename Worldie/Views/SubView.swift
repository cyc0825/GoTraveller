//
//  SubView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

struct SubView: View {
    @State var isNotificationEnabled: Bool = false
    @State var distance : Int = 100
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Distance Tracking Mode")) {
                    Toggle(isOn: $isNotificationEnabled) {
                        Text("Tracking:")
                    }
                }

                Section(header: Text("Distance settings")) {

                    Stepper(value: $distance, in: 10...1000) {
                        Text("Categorize by \(distance) miles")
                    }
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

struct User: Identifiable {
    let name: String
    let idle: String
    var id: String { name }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView()
    }
}
