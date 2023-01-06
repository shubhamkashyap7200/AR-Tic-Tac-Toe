import UIKit
import RealityKit
import ARKit
import MultipeerConnectivity

class ViewController: UIViewController, ARSessionDelegate {
  
  // MARK: - Properties
  
  // MARK: - IBOutlets & IBActions
  
  @IBOutlet var arView: ARView!
  @IBOutlet weak var message: UILabel!
  
  @IBAction func player1ButtonPressed(_ sender: Any) {
  }
  
  @IBAction func player2ButtonPressed(_ sender: Any) {
  }
  
  @IBAction func clearButtonPressed(_ sender: Any) {
  }
  
  // MARK: - AR View Functions
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
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
  
}



