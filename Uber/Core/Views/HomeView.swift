//
//  HomeView.swift
//  Uber
//
//  Created by Mohammed Mubashir on 17/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
       UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
