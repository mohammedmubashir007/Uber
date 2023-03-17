//
//  HomeView.swift
//  Uber
//
//  Created by Mohammed Mubashir on 17/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showLocationSearchField = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchField {
                LocationSearchView()
            } else {
                LocationSearchActivationView()
                    .padding(.top,72)
                    .onTapGesture {
                        
                        withAnimation(.spring()){
                            showLocationSearchField.toggle()
                            
                        }
                        
                    }
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchField)
                .padding(.leading)
                .padding(.top,4)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
