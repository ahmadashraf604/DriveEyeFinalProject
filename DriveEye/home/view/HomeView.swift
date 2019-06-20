
import UIKit
import CoreLocation
import  QuartzCore


class HomeView: UIViewController,CLLocationManagerDelegate  , HomeViewProtocol {
    
    @IBOutlet weak var leveLBL: UILabel!
    
    @IBOutlet weak var sesonNumberLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var daysLeftLBL: UILabel!
    @IBOutlet weak var timeLBL: UILabel!
    @IBOutlet weak var btnStartTrip: UIButton!
    var seconds = 0
    var timer = Timer()

    var trip : Trip!
    var presenter : HomePresenter! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter =  HomePresenter(model: HomeModelIMP())
        trip = Trip()
        presenter.attachView(view: self)
        presenter.getHomeInfo(id: 2)
        Spinner.start()
    }

    func initHome(_ home: Home) {
        Spinner.stop()
        print(home.seasonNUmber)
        leveLBL.text=String(home.userLevel)
        sesonNumberLBL.text=String(home.seasonNUmber)
        scoreLBL.text=String(home.score)
        daysLeftLBL.text=String(home.daysLeft)
        
    }
    @IBAction func startTribAction(_ sender: UIButton) {
        switch btnStartTrip.currentTitle! {
        case "start trip":
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timeAction), userInfo: nil, repeats: true)
            btnStartTrip.setTitle("end trip", for: .normal)
            presenter.getStartLoation()
            
        case "end trip":
            btnStartTrip.setTitle("start trip", for: .normal)
            timer.invalidate()
            presenter.getEndLoation()
            trip.duration=Double(seconds)
            print(Double(seconds/60))
            seconds = 0
        default:
            break
        }
    }
    @objc func timeAction (){
        seconds += 1
        timeLBL.text = convertNumberToTime(time: seconds)
    }
    func convertNumberToTime(time : Int) -> String{
        let seconds = time % 60
        let minutes = time/60
        return  " \(minutes ) : \( seconds)"
        
    }
    
    func setStartPoint(_ startpoint: String) {
        print("start point \(startpoint)")
        trip.startPoint=startpoint
    }
    
    func setEndPoint(_ endpoint: String) {
        print("start point \(endpoint)")
        trip.endPoint=endpoint
         presenter.addTrip(trip:trip)
    }
}
