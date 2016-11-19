import UIKit
import GoogleMaps


class ViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate{
    
    
    var mapView:GMSMapView?
    
    override func viewDidLoad() {
        
        var locationManager: CLLocationManager
        
        super.viewDidLoad()
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.007215,                                                      longitude: 140.975838, zoom: 13)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(40.007215,140.975838)
        marker.title = "岩手県八幡平市安比高原"
        marker.snippet = "iwate"
        marker.map = mapView
        marker.icon = GMSMarker.markerImage(with: UIColor.black)
        locationManager = CLLocationManager()
        
        
        let markerDemo = GMSMarker()
        markerDemo.position = CLLocationCoordinate2DMake(40.007219,140.985845)
        markerDemo.title = "岩手県八幡平市安比高原"
        markerDemo.snippet = "iwate"
        markerDemo.map = mapView
        markerDemo.icon = GMSMarker.markerImage(with: UIColor.red)
        locationManager = CLLocationManager()
        
        
        let path = GMSMutablePath()
        
        path.addLatitude(40.007215, longitude:140.975838)
        path.addLatitude(40.007219, longitude:140.985845)
        
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = UIColor.blue
        polyline.strokeWidth = 5.0
        polyline.map = mapView
        
        self.view = mapView
        
        
        
        
        // 位置情報サービスが利用できるかどうかをチェック
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            // 測位開始
            locationManager.startUpdatingLocation()
        } else {
            print("Location services not available.")
            
        }
        
        
        
        // 位置情報サービスが利用できるかどうかをチェック
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            // 測位開始
            locationManager.startUpdatingLocation()
        } else {
            print("Location services not available.")
            
        }
        
        //位置情報更新時
        func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
            mapView.animateToLocation(newLocation.coordinate())
            //緯度・経度を出力
            print("didUpdateToLocation latitude=\(newLocation.coordinate.latitude), longitude=\(newLocation.coordinate.longitude)")
        }
        
        // 測位失敗時や、位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
        func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
            print("didFailWithError")
        }
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    }
}

