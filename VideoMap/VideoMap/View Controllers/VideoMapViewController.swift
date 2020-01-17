//
//  VideoMapViewController.swift
//  VideoMap
//
//  Created by Brandi Bailey on 1/16/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit
import MapKit
import AVFoundation

class VideoMapViewController: UIViewController {
    
    let videoController = VideoController()
    
    @IBOutlet weak var videoMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoMapView.delegate = self
        //set up a reusable identifier
        videoMapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "VideoView")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    private func fetchVideos() {
        
        let videos = videoController.videos
        
        self.videoMapView.addAnnotations(videos)
        
        //set region for the map.  We're grabbing the first returned earthquake from the api, and then set that as our map region
        
        guard let video = videos.first else { return }
        
        //create coordinate span
        let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        
        // create region, takes the coord span and the center coord
        let region = MKCoordinateRegion(center: video.coordinate, span: span)
        
        
        //set on map
        self.videoMapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func addVideoTapped(_ sender: Any) {
        
        func requestPermissionAndShowCamera() {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            switch status {
                
            case .notDetermined:
                // First time user - they havent seen the dialog to give permission
                requestPermission()
                
            case .restricted:
                // Parental controls disabled camera
                fatalError("Video is disable for use (parental controls)")
                
            case .denied:
                // User did not give access
                fatalError("Tell the user they need to enbale privacy for video")
                
            case .authorized:
                // We asked for permission 2nd time they've used the app
                showCamera()
                
            @unknown default:
                fatalError("A new status was added that we need to handle")
            }
        }
        
        func requestPermission() {
            // TODO: Implement
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                guard granted else {
                    fatalError("Tell user they need to enable privacy for video")
                }
                DispatchQueue.main.async { [weak self] in
                    self?.showCamera()
                }
            }
        }
        
        
        
    }
    
    func showCamera() {
        performSegue(withIdentifier: "ShowCamera", sender: self)
    }
}


extension VideoMapViewController: MKMapViewDelegate {
    
    func videoMapView(_ videoMapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let video = annotation as? Video else {
            fatalError("Only Videos are supported right now")
        }
        
        guard let annotationView = videoMapView.dequeueReusableAnnotationView(withIdentifier: "VideoView") as? MKMarkerAnnotationView else {
            fatalError("Missing registered map annotation view")
        }
        
        return annotationView
    }
    
}
