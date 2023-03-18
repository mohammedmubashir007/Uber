//
//  LocationSearchViewModel.swift
//  Uber
//
//  Created by Mohammed Mubashir on 17/03/23.
//

import Foundation
import MapKit

class LocationSearchViewModel : NSObject, ObservableObject {
    
    //MARK: properties
    
    @Published var results = [MKLocalSearchCompletion()]
    @Published var selectedLocation : String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment : String = ""  {
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
     
    func selectLocation(_ location:String){
        self.selectedLocation = location
        print("DEBUG: selected location is \(selectedLocation)")
    }
    
    
    
}

// MARK: MKLocalSearchCompleterDelegate

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
