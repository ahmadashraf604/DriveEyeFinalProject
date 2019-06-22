
import UIKit
import CoreLocation
import  QuartzCore
import GDGauge


class HomeView: UIViewController,CLLocationManagerDelegate  , HomeViewProtocol {
    
    @IBOutlet weak var leveLBL: UILabel!
    @IBOutlet weak var sesonNumberLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var daysLeftLBL: UILabel!
    @IBOutlet weak var timeLBL: UILabel!
    @IBOutlet weak var btnStartTrip: UIButton!
    var seconds = 0
    var timer = Timer()
    let alertServices = AlertServices ()
    
    var gaugeView: GDGaugeView!
    
    var trip : Trip!
    var presenter : HomePresenter! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        gaugeView = GDGaugeView(frame: view.bounds)
        presenter =  HomePresenter(model: HomeModelIMP())
        trip = Trip()
        presenter.attachView(view: self)
        presenter.getHomeInfo(id: 2)
        Spinner.start()
        
        gaugeView.baseColor = UIColor.gray
        gaugeView.showBorder = true
        gaugeView.fullBorder = false
        gaugeView.startDegree = 45.0
        gaugeView.endDegree = 315.0
        gaugeView.min = 0
        gaugeView.max = 30
        gaugeView.stepValue = 2
        gaugeView.handleColor = UIColor.red
        gaugeView.sepratorColor = UIColor.brown
        gaugeView.textColor = UIColor.black
        gaugeView.unitText = "Day Left"
        gaugeView.unitTextFont = UIFont.systemFont(ofSize: 20)
        gaugeView.textFont = UIFont.systemFont(ofSize: 20)
        view.addSubview(gaugeView)
        gaugeView.setupView()
    }
    
    func initHome(_ home: Home) {
        Spinner.stop()
        print(home.seasonNUmber)
        leveLBL.text=String(home.userLevel)
        sesonNumberLBL.text=String(home.seasonNUmber)
        scoreLBL.text=String(home.score)
        daysLeftLBL.text=String(home.daysLeft)
        gaugeView.currentValue = CGFloat(home.daysLeft)
        
    }
    @IBAction func startTribAction(_ sender: UIButton) {
        switch btnStartTrip.currentTitle! {
        case "  start trip  ":
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timeAction), userInfo: nil, repeats: true)
            btnStartTrip.setTitle("  end trip  ", for: .normal)
            presenter.getStartLoation()
            
        case "  end trip  ":
            btnStartTrip.setTitle("  start trip  ", for: .normal)
            timer.invalidate()
            presenter.getEndLoation()
            trip.duration=Double(seconds)
            let alert = alertServices.alert(title: "ended" ,describtion: " duration = \(convertNumberToTime(time: seconds))")
            present(alert, animated: true)
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
        return "\(time / 60 < 10 ? time / 60 : time / 60):\(time % 60 < 10 ? time % 60 : time % 60)"
        //        " \(minutes ) : \( seconds)"
        
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
