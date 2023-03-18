//
//  LocationSearchViewModel.swift
//  Uber
//
//  Created by Mohammed Mubashir on 17/03/23.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {

    //MARK: properties

    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation: String?

    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }

    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }

    // MARK: Helpers

    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        selectedLocation = localSearch.title + " " + localSearch.subtitle

        locationSearch { response, error in
            if let error = error {
                print("DEBUG: location search failed \(error.localizedDescription)")
                return
            }

            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate

            print("DEBUG: location coordinates \(coordinate.longitude), \(coordinate.latitude)")
        }
    }

    func locationSearch(completion: @escaping MKLocalSearch.CompletionHandler) {
        guard let selectedLocation = selectedLocation else {
            self.results = []
            return
        }

        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = selectedLocation
        let search = MKLocalSearch(request: searchRequest)

        search.start(completionHandler: completion)
    }
}


// MARK: MKLocalSearchCompleterDelegate

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
