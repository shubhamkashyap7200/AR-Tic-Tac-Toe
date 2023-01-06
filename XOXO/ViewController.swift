import UIKit
import RealityKit
import ARKit
import MultipeerConnectivity

class ViewController: UIViewController, ARSessionDelegate {
    
    // MARK: - Properties
    var playerColor: UIColor = .blue
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var message: UILabel!
    
    @IBAction func player1ButtonPressed(_ sender: Any) {
        playerColor = .blue
    }
    
    @IBAction func player2ButtonPressed(_ sender: Any) {
        playerColor = .red
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
    }
    
    // MARK: - AR View Functions
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func initARView() {
        arView.session.delegate = self
        arView.automaticallyConfigureSession = false
        
        let arConfiguration = ARWorldTrackingConfiguration()
        arConfiguration.planeDetection = [ .horizontal ]
        arConfiguration.environmentTexturing = .automatic
        arView.session.run(arConfiguration)
    }
}

// MARK: - Model Entity Functions

extension ViewController {
    
    // Add code here...
    
}

// MARK: - Gesture Functions

extension ViewController {
    
    // Add code here...
    
}


// MARK: - Multipeer Session Functions

extension ViewController {
    
    // Add code here...
    
}

// MARK: - Helper Functions

extension ViewController {
    
    // Add code here...
    func sendMessage(_ message: String) {
        DispatchQueue.main.async {
            self.message.text = message
        }
    }
}



