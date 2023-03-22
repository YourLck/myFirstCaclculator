//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Nikita Nemtsu on 03.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var service: CalcService?
    
    // MARK: - View
    private let display = UITextField()
    private let displayViews = UIView()
    private let mainVStack = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        configureApperance()
    }
   // MARK: - ViewController methods
    
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
//        print(sender.tag)
        switch sender.tag {
        case 0...9:
            service?.numberAction(number: sender.tag)
        case 10:
            service?.dot()
        case 11:
            service?.makeResult()
        case 12:
            service?.addition()
        case 13:
            service?.substruction()
        case 14:
            service?.multiplication()
        case 15:
            service?.acAction()
        case 16:
            service?.changeSign()
        case 17:
            service?.percent()
        case 18:
            service?.division()

        default:
            break
        }
    }
    
}
// MARK: - ViewController private method
private extension ViewController {
    func configureApperance() {
        setupDisplayView()
        setupButtons()
        setupMainVStack()
        
    }
    
    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0,
                                  y: 60,
                                  width: Constants.screenWidth,
                                  height: Constants.screenHight - 60)
        mainVStack.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(mainVStack)
    }
    
    func setupDisplayView() {
        displayViews.frame = CGRect(x: 0,
                                    y: 0,
                                    width: Int(Constants.screenWidth),
                                    height: Int(Constants.screenHight - (82*5) - 60 - 30))
        displayViews.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        display.frame = CGRect(x: 15,
                               y: 15,
                               width: displayViews.frame.width - 30,
                               height: displayViews.frame.height - 15)
        display.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        display.textAlignment = .right
        display.contentVerticalAlignment = .bottom
        display.text = "0"
        display.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        display.font = UIFont.boldSystemFont(ofSize: 80)
        
        displayViews.addSubview(display)
        mainVStack.addSubview(displayViews)
        
    }
    func setupLine1() {
        let line1 = createHStack(yPoints: Int(displayViews.frame.height) + 0)
        
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line1.addSubview(acButton)
        
        let plusOrMinusButton = createButton(order: 1, title: "+/-", tag: 16)
        plusOrMinusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line1.addSubview(plusOrMinusButton)
        
        let persentButton = createButton(order: 2, title: "%", tag: 17)
        persentButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line1.addSubview(persentButton)
        
        let divisionButton = createButton(order: 3, title: "/", tag: 18)
        divisionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line1.addSubview(divisionButton)
        
        mainVStack.addSubview(line1)
    }
    
    func setupLine2() {
        let line2 = createHStack(yPoints: Int(displayViews.frame.height) + 80 + 2)
        
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line2.addSubview(sevenButton)
        
        let eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line2.addSubview(eightButton)
        
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line2.addSubview(nineButton)
        
        let multiplyButton = createButton(order: 3, title: "*", tag: 14)
        multiplyButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line2.addSubview(multiplyButton)
        
        mainVStack.addSubview(line2)
    }
    
    func setupLine3() {
        let line3 = createHStack(yPoints: Int(displayViews.frame.height) + 160 + 4)
        
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line3.addSubview(fourButton)
        
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line3.addSubview(fiveButton)
        
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line3.addSubview(sixButton)
        
        let sevenButton = createButton(order: 3, title: "-", tag: 13)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line3.addSubview(sevenButton)
        
        mainVStack.addSubview(line3)
    }
    
    func setupLine4() {
        let line4 = createHStack(yPoints: Int(displayViews.frame.height) + 80 + 80 + 80 + 6)
        
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line4.addSubview(oneButton)
        
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line4.addSubview(twoButton)
        
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line4.addSubview(threeButton)
        
        let plusButton = createButton(order: 3, title: "+", tag: 12)
        plusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line4.addSubview(plusButton)
        
        mainVStack.addSubview(line4)
    }
    
    func setupLine5() {
        let line5 = createHStack(yPoints: Int(displayViews.frame.height) + 328)
        
        let zeroButton = createButton(order: 0, title: "0", tag: 0)
        zeroButton.frame = CGRect(x: 2,
                                  y: 0,
                                  width: Int(Constants.screenWidth/4*2-2),
                                  height: 80)
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line5.addSubview(zeroButton)
        
        let commaButton = createButton(order: 2, title: ",", tag: 10)
        commaButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line5.addSubview(commaButton)
        
        let equlasButton = createButton(order: 3, title: "=", tag: 11)
        equlasButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        line5.addSubview(equlasButton)
        mainVStack.addSubview(line5)
    }
    
    func setupButtons() {
        setupLine1()
        setupLine2()
        setupLine3()
        setupLine4()
        setupLine5()
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: (0+Int(Constants.screenWidth/4)*order+2),
                                            y: 0,
                                            width: Int(Constants.screenWidth/4-2),
                                            height: 80))
        button.setTitle(title, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = tag
        return button
    }
    
    func createHStack(yPoints: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0,
                             y: yPoints,
                             width: Int(Constants.screenWidth),
                             height: 80)
        
        return stack
    }
}

