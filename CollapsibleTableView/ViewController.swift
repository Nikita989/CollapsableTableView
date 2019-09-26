//
//  ViewController.swift
//  CollapsibleTableView
//
//  Created by NikitaHassan on 25/09/19.
//  Copyright © 2019 NikitaHassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    var dataArray = [Model]()
    var previousIndex = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
        tableVIew.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "descCell")
        tableVIew.rowHeight = UITableView.automaticDimension
        tableVIew.estimatedRowHeight = 50
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    func setData(){
        let section1 = Model.init(image: "TajMahal.jpeg", expanded: false, data: ["The Taj Mahal was commissioned by Shah Jahan in 1631, to be built in the memory of his wife Mumtaz Mahal, a Persian princess who died on 17 June that year, giving birth to their 14th child","The imperial court documenting Shah Jahan's grief after the death of Mumtaz Mahal illustrates the love story held as the inspiration for the Taj Mahal","The Taj Mahal incorporates and expands on design traditions of Persian and earlier Mughal architecture"], title: "Taj Mahal")
        let section2 = Model.init(image: "Colosseum.jpeg", expanded: false, data: ["The Colosseum's original Latin name was Amphitheatrum Flavium, often anglicized as Flavian Amphitheatre","The building was constructed by emperors of the Flavian dynasty, following the reign of Nero"], title: "Colosseum")
        let section3 = Model.init(image: "greatWallOfChina.jpeg", expanded: false, data: ["The Great Wall of China (Chinese: 萬里長城; pinyin: Wànlǐ Chángchéng) is the collective name of a series of fortification systems generally built across the historical northern borders of China to protect and consolidate territories of Chinese states and empires against various nomadic groups of the steppe and their polities"], title: "Great Wall of China")
        let section4 = Model.init(image: "machuPichu.jpeg", expanded: false, data: ["Machu Pikchu is a 15th-century Inca citadel, located in the Eastern Cordillera of southern Peru, on a 2,430-metre (7,970 ft) mountain ridge","Most archaeologists believe that Machu Picchu was constructed as an estate for the Inca emperor Pachacuti"], title: "Mach Pichu")
        let section5 = Model.init(image: "PyramidOfGiza.jpeg", expanded: false, data: ["The Great Pyramid of Giza (also known as the Pyramid of Khufu or the Pyramid of Cheops) is the oldest and largest of the three pyramids in the Giza pyramid complex bordering present-day El Giza, Egypt"," It is the oldest of the Seven Wonders of the Ancient World, and the only one to remain largely intact"], title: "Pyramid of Giza")
        let section6 = Model.init(image: "Petra.jpeg", expanded: false, data: ["Petra originally known to its inhabitants as Raqmu, is a historical and archaeological city in southern Jordan","Petra lies on the slope of Jabal Al-Madbah in a basin among the mountains which form the eastern flank of the Arabah valley that runs from the Dead Sea to the Gulf of Aqaba"], title: "Petra")
        dataArray = [section1,section2,section3,section4,section5,section6]
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (dataArray[section].isExpanded){
            return dataArray[section].dataArr.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVIew.dequeueReusableCell(withIdentifier: "descCell", for: indexPath) as! TableViewCell
        cell.updateCell(text: dataArray[indexPath.section].dataArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UINib.init(nibName: "TableSectionView", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).last as! TableSectionView
        headerView.updateHeader(info: dataArray[section])
        headerView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(sectionTapped(sender:)))
        headerView.addGestureRecognizer(tapGesture)
        tapGesture.numberOfTapsRequired = 1;
        headerView.tag = section
        return headerView
    }
    
    @objc func sectionTapped(sender:UITapGestureRecognizer){
        let tag = sender.view?.tag ?? 0
        if dataArray[tag].isExpanded {
            closeSection(sectionIndex: tag)
        }else{
            openSection(sectionIndex: tag)
        }
        tableVIew.reloadData()
    }
    
    func openSection(sectionIndex:Int){
        let data = dataArray[sectionIndex]
        data.isExpanded = true
        if previousIndex != -1 {
            dataArray[previousIndex].isExpanded = false
        }
        previousIndex = sectionIndex
    }
    
    func closeSection(sectionIndex:Int){
        let data = dataArray[sectionIndex]
        data.isExpanded = false
        previousIndex = -1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.25 * self.view.frame.height
    }
    
}

