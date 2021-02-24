//
//  ViewController.swift
//  CB Man
//
//  Created by Jason M Davis on 2/11/21.
//
import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
   
    @IBOutlet var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    override func viewDidAppear(_ animated: Bool) {
        manager.requestLocation()
        //manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
    
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // navigationController?.navigationBar.
        
        
        let baytown = CB_Shops(title: "4 G's CB Shop", coordinate:
        CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
        info: "4 G's CB Shop")
        let walcottradio = CB_Shops(title: "Walcott Radio", coordinate:
        CLLocationCoordinate2D(latitude: 41.613470, longitude: -90.783740),
        info: "Walcott Radio")
        let stcharlesmo = CB_Shops(title: "St Charles CB Shop", coordinate:
        CLLocationCoordinate2D(latitude: 38.772800, longitude: -90.507408),
        info: "St Charles CB Shop")
        let atlanta = CB_Shops(title: "CB Shop, Atlanta", coordinate:
        CLLocationCoordinate2D(latitude: 33.786591, longitude: -84.489223),
        info: "CB Shop, Atlanta")
        let oklahomacity = CB_Shops(title: "Antenna & Radio's Plus", coordinate:
        CLLocationCoordinate2D(latitude: 35.457140, longitude: -97.654260),
        info: "Antenna & Radio's Plus")
        let uniongrove = CB_Shops(title: "I-77 Chrome/CB Shop", coordinate:
        CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
        info: "I-77 Chrome/CB Shop")
        let wmemphis1 = CB_Shops(title: "Rays CB Shop", coordinate:
        CLLocationCoordinate2D(latitude: 35.154410, longitude: -90.135860),
        info: "Rays CB Shop")
        let wmemphis2 = CB_Shops(title: "Channel 5 CB Shop", coordinate:
        CLLocationCoordinate2D(latitude: 35.150250, longitude: -90.131230),
        info: "Channel 5 CB Shop")
        let dallas = CB_Shops(title: "Dalworth On The Boulevard", coordinate:
        CLLocationCoordinate2D(latitude: 32.808060, longitude: -96.871670),
        info: "Dalworth On The Boulevard")
        
        // ** more cb shops to be added later **
        
    //    let xcxcx = CB_Shops(title: "I-77 Chrome/CB Shop", coordinate:
    //    CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
    //    info: "I-77 Chrome/CB Shop")
    //    let xcxcx = CB_Shops(title: "I-77 Chrome/CB Shop", coordinate:
    //    CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
    //    info: "I-77 Chrome/CB Shop")
    //    let xcxcx = CB_Shops(title: "I-77 Chrome/CB Shop", coordinate:
    //    CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
    //    info: "I-77 Chrome/CB Shop")
    //    let xcxcx = CB_Shops(title: "I-77 Chrome/CB Shop", coordinate:
    //    CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
    //    info: "I-77 Chrome/CB Shop")
    //    let xcxcx = CB_Shops(title: "I-77 Chrome/CB Shop", coordinate:
    //    CLLocationCoordinate2D(latitude: 29.799300, longitude: -95.030980),
    //    info: "I-77 Chrome/CB Shop")
     
        
        
        
        // Do any additional setup after loading the view.
        mapView.addAnnotations([baytown, walcottradio, stcharlesmo, atlanta, oklahomacity, uniongrove, wmemphis1, wmemphis2, dallas])
        
    }
   
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
    guard annotation is CB_Shops else { return nil }
        
    let identifier = "CB Shops"
        
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
    if annotationView == nil {
    annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    annotationView?.canShowCallout = true
            
    let btn = UIButton(type: .detailDisclosure)
    annotationView?.rightCalloutAccessoryView = btn
    } else { annotationView?.annotation = annotation }
    return annotationView
       }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard (view.annotation as? CB_Shops) != nil else { return }
    
    //let placeName = self.title
    //let placeInfo = self.info
    //let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
    //ac.addAction(UIAlertAction(title: "Ok", style: .default))
    //present(ac,animated: true)
    }
    
    
}

