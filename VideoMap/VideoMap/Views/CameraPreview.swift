//
//  CameraPreview.swift
//  VideoMap
//
//  Created by Brandi Bailey on 1/16/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPreview: UIView {
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPlayerView: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session: AVCaptureSession? {
        get { return videoPlayerView.session }
        set { videoPlayerView.session = newValue }
    }
}
