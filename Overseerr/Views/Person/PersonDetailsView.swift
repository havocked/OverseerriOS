//
//  PersonDetailsView.swift
//  Overseerr
//
//  Created by Nataniel Martin on 06/12/2022.
//

import SwiftUI

struct PersonDetailsView: View {
    @ObservedObject var viewModel: PersonDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                PersonHeaderDetailsView(person: viewModel.person)
                AppearancesListView(viewModel: .init(personId: viewModel.person.id))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.mainBackground)
        .onAppear {
            self.viewModel.fetchPersonDetails()
        }
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView(viewModel: .init(personResult: .default))
    }
}
