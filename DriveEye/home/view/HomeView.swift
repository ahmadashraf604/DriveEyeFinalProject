
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

    var seasonsDays: GDGaugeView!
    var levelGauge: GDGaugeView!

    var trip : Trip!
    var presenter : HomePresenter! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let shapeWidth:CGFloat = CGFloat(300)
        let shapeHieght:CGFloat = CGFloat(300)

        seasonsDays = GDGaugeView(frame: CGRect(x: CGFloat( view.bounds.width - (CGFloat(8) + shapeWidth)), y: CGFloat(90), width: shapeWidth, height: shapeHieght))
        levelGauge = GDGaugeView(frame: CGRect(x: CGFloat(8), y: CGFloat(90), width: shapeWidth, height: shapeHieght))
        presenter =  HomePresenter(model: HomeModelIMP())
        trip = Trip()
        presenter.attachView(view: self)
        presenter.getHomeInfo(id: Utils.getCurrentUserId())
        Spinner.start()

        seasonsDays.baseColor = UIColor.red
        seasonsDays.showBorder = true
        seasonsDays.fullBorder = false
        seasonsDays.startDegree = 225.0
        seasonsDays.endDegree = 315.0
        seasonsDays.min = 0
        seasonsDays.max = 30
        seasonsDays.stepValue = 5
        seasonsDays.handleColor = UIColor.red
        seasonsDays.sepratorColor = UIColor.fizCuz
        seasonsDays.textColor = UIColor.black
        seasonsDays.unitText = "Days Left"
        seasonsDays.unitTextFont = UIFont.systemFont(ofSize: 10)
        seasonsDays.textFont = UIFont.systemFont(ofSize: 14)
        view.addSubview(seasonsDays)
        seasonsDays.setupView()
        seasonsDays.currentValue = 0



        levelGauge.baseColor = UIColor.fizCuz
        levelGauge.showBorder = true
        levelGauge.fullBorder = false
        levelGauge.startDegree = 45.0
        levelGauge.endDegree = 135.0
        levelGauge.min = 0
        levelGauge.max = 100
        levelGauge.stepValue = 20
        levelGauge.handleColor = UIColor.fizCuz
        levelGauge.sepratorColor = UIColor.red
        levelGauge.textColor = UIColor.black
        levelGauge.unitText = ""
        levelGauge.unitTextFont = UIFont.systemFont(ofSize: 14)
        levelGauge.textFont = UIFont.systemFont(ofSize: 14)
        view.addSubview(levelGauge)
        levelGauge.setupView()
    }

    func initHome(_ home: Home) {
        Spinner.stop()
        print(home.seasonNUmber)
        leveLBL.text=String((home.userLevel / 10)+1)
        sesonNumberLBL.text=String(home.seasonNUmber)
        scoreLBL.text=String(home.score)
        seasonsDays.currentValue = CGFloat(home.daysLeft>30 ? 30: home.daysLeft < 0 ? 0 : home.daysLeft)
        levelGauge.currentValue = CGFloat((home.userLevel % 10)*10)
        //        seasonsDays.updateColors(with: UIColor.fizCuz, unitsColor: UIColor.red)

    }

    @IBAction func startTribAction(_ sender: UIButton) {
        switch btnStartTrip.currentTitle! {
        case "  Start trip  ":
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timeAction), userInfo: nil, repeats: true)
            btnStartTrip.setTitle("  End trip  ", for: .normal)
            presenter.getStartLoation()

        case "  End trip  ":
            Spinner.start()
            btnStartTrip.setTitle("  Start trip  ", for: .normal)
            timer.invalidate()
            presenter.getEndLoation()
            trip.duration=Double(seconds)
                presenter.getHomeInfo(id: Utils.getCurrentUserId())

        default:
            break
        }
    }
    @objc func timeAction (){
        seconds += 1
        timeLBL.text = convertNumberToTime(time: seconds)
    }
    func convertNumberToTime(time : Int) -> String{
        return "\(time / 60 < 10 ? time / 60 : time / 60):\(time % 60 < 10 ? time % 60 : time % 60)"

    }

    func setStartPoint(_ startpoint: String) {
        print("start point \(startpoint)")
        trip.startPoint=startpoint
    }
    
    func setEndPoint(_ endpoint: String) {
        print("start point \(endpoint)")
        trip.endPoint=endpoint
        presenter.addTrip(trip:trip, {score in
            Spinner.stop()
//            let alert = alertServices.alert(title: "Ended"
//                ,describtion: """
//                Score : \(score)
//                Start Location : \(trip.startPoint)
//                End Location : \(trip.endPoint)
//                duration : \(convertNumberToTime(time: seconds))
//                """)
            let homeScreen = UIStoryboard(name: "Coach", bundle: nil)
            let vc = homeScreen.instantiateViewController(withIdentifier: "TipsDetails")
            let vc2 = vc as! TipDetailsViewController
            
            let describtion = """
            Score: \(score)
            Start Location: \(trip.startPoint)
            End Location: \(trip.endPoint)
            Duration: \(convertNumberToTime(time: seconds))
            """
            
            let c = Coach(coachingID: 3, title: "Ended", responseDescription: describtion, image: #imageLiteral(resourceName: "car"))
            
            vc2.coachModel = c
            
            seconds = 0
            self.timeLBL.text = "00:00"
            self.present(vc, animated: true)

        })
    }
}
