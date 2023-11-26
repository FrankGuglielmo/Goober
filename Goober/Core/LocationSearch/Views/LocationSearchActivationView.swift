//
//  LocationSearchActivationView.swift
//  Goober
//
//  Created by Frank Guglielmo on 11/26/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        //Search bar
        HStack {
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64,
               height: 50)
        .background(
            Rectangle()
            .fill(Color.white)
            .shadow(color:  .black, radius: 6)
        )
        
    }
}

#Preview {
    LocationSearchActivationView()
}