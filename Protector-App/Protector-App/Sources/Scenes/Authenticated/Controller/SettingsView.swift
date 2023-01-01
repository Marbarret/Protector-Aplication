//
//  SettingsView.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 22/12/22.
//

import SwiftUI
import Combine

struct SettingsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("SwiftUI Screen")
                    .bold()
                    .font(.system(size: 21.0))
            }
            Spacer()
                .frame(width: 1, height: 74, alignment: .bottom)
            VStack(alignment: .center){
                Button(action: {
                }) {
                    buttonView
                }
            }
            Spacer()
                .frame(width: 2, height: 105, alignment: .bottom)
        }.navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewLayout(.sizeThatFits)
    }
}

extension SettingsView {
    private var buttonView: some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .frame(width: 60, height: 60)
            HStack(spacing: 4) {
                Image(systemName: "star")
                Text("Rate")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
        }
    }
}


// MARK: - Delegate
class HeartFloatingDelegate: ObservableObject {
    
//    let objectWillChange = ObservableObjectPublisher()
//    var heartConfig: HeartConfig {
//        willSet { objectWillChange.send() }
//        didSet { objectWillChange.send() }
//    }
//    
//    init(heartConfig: HeartConfig) {
//        self.heartConfig = heartConfig
//    }
}

