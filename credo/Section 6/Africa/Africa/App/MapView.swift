//
//  MapView.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    
    var body: some View {
        //MARK: - No1 BASIC MAP
        // Map(coordinateRegion: $region)
        
        //MARK: - No2 Map with Annotation
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) PIN: OLD STYLE (always static)
            //            MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) Marker : NEW STYLE (always static)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC Annotation (ti could be interactive)
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            } // Annotation
            
            // (D) CUSTOM ADVANCED ANNOTATION (it coud be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("longitude")
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }

                }
                
            } //: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),
            alignment: .top
        )
    }
}

//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
