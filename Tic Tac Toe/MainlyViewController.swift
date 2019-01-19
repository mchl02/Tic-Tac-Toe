//second view controller

import UIKit

class MainlyViewController: UIViewController {

    @IBOutlet var Normal: UIButton!
    @IBOutlet var Expert: UIButton!
    
    @IBAction func NormalPressed(_ sender: Any) {
        wasTheButtonPressed = false
    }
    
    @IBAction func ExpertPressed(_ sender: Any) {
        wasTheButtonPressed = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
