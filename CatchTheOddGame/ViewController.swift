	
import UIKit

class ViewController: UIViewController {

    //var MyNumbers: [String] = [] // list of all flag names
    var MyNumbers = Array(repeating: " ", count: 10) // Create an array with the capacity
    
    @IBOutlet weak var NumImage: UIImageView!
    @IBOutlet var CounterLabel: UILabel!
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var SecSlider: UISlider!
    
    //@IBOutlet weak var TestLabel: UILabel!
    var timer = Timer()
    var counter = 0
    var myScore = 0
    var RandImageNum = 0
    
    @IBAction func start() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:#selector(ViewController.countUp) , userInfo: nil, repeats: true)
    }
    
    @IBAction func stop() {
        timer.invalidate()
    }
    
    @objc func countUp() {
        counter += 1
        CounterLabel.text = String(counter)
        RandImageNum = Int(arc4random_uniform(UInt32(10)))
        NumImage.image = UIImage(named: MyNumbers[RandImageNum]) // next image
        //TestLabel.text = String(RandImageNum)
    }
    
    @IBAction func Catch() {
        if (RandImageNum % 2 == 1) // correct
        {
            myScore += 1
        }
        else
        {
            myScore = myScore - 2
        }
        Score.text=String(myScore)
    }
    
    @IBAction func UpdateFre(_ sender: AnyObject) {
        
        timer.invalidate();
        timer = Timer.scheduledTimer(timeInterval: Double(SecSlider.value), target: self, selector:#selector(ViewController.countUp) , userInfo: nil, repeats: true)
    }    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        srandom(UInt32(time(nil)))
        
        // get a list of all the png files in the app's images group
        let paths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "NumberIcons")
        
        // get image filenames from paths
        for path in paths {
            if path.hasSuffix("png")
            {
                //print(path)
                ////Users/iosdeve/Library/Developer/CoreSimulator/Devices/76E894F5-F38D-4EA1-BC18-DDD0366C5CCE/data/Containers/Bundle/Application/9560731E-B8DA-43F3-ADB5-853C21C5185B/CatchTheOddS17.app/NumberIcons/0-256.png
                //MyNumbers.append(path) // a long path
                //MyNumbers[]
                //let objectArray = path.componentsSeparatedByString("/")
                let objectArray = path.components(separatedBy: "/")
                print(objectArray.last!)
                let filename = objectArray.last!
                let fileindex = Int(filename.components(separatedBy: "-")[0])
                print(fileindex!)
                MyNumbers[fileindex!]=path
            }
        }
        print(MyNumbers.count, " images found")
    }


}

