//
//  ColorLogger.swift
//  ColoredLogs
//
//  Created by Guntis on 21/01/16.
//  Copyright © 2016 unknown. All rights reserved.
//



/*
	Usage
	
	Log()
	LogRed()
	LogBlue()
	LogOrange()


	Log()
	Log("text")
	Log(object)
	Log("text count \(5) and object \(label)")
	Log(("text", "bext", 5, string))
	
	
	2016-01-21 16:12:50.739 ViewController.swift updateFrame()[106][; : text
*/



import Foundation

var token: dispatch_once_t = 0

var dayTimePeriodFormatter:NSDateFormatter!

let RESET_LOG_PART = "\u{001b}[;"
let GRAY_LOG_PART = "\u{001b}[fg110,110,110;"
let BLUE_LOG_PART = "\u{001b}[fg0,0,255;"
let RED_LOG_PART = "\u{001b}[fg255,0,0;"
let ORANGE_LOG_PART = "\u{001b}[fg255,140,0;"


#if DEBUG
func Log(object:Any! = " ", function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__){
	print("\(prepareBaseText(function, file: file, line: line)) : \(GRAY_LOG_PART)\(object)\(RESET_LOG_PART)")
}
#else
func Log(object:Any! = " "){}
#endif


#if DEBUG
func LogRed(object:Any! = " ", function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__){
	print("\(prepareBaseText(function, file: file, line: line)) : \(RED_LOG_PART)\(object)\(RESET_LOG_PART)")
}
#else
func LogRed(object:Any! = " "){}
#endif


#if DEBUG
func LogBlue(object:Any! = " ", function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__){
	print("\(prepareBaseText(function, file: file, line: line)) : \(BLUE_LOG_PART)\(object)\(RESET_LOG_PART)")
}
#else
func LogBlue(object:Any! = " "){}
#endif


#if DEBUG
func LogOrange(object:Any! = " ", function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__){
	print("\(prepareBaseText(function, file: file, line: line)) : \(ORANGE_LOG_PART)\(object)\(RESET_LOG_PART)")
}
#else
func LogOrange(object:Any! = " "){}
#endif


//Prints out beginning .. for example [fg110,110,110;2016-01-21 16:12:50.739 ViewController.swift updateFrame()[106]
private func prepareBaseText(function: String, file: String, line: Int) -> String{
	dispatch_once(&token) {
        dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }
	
	let dateString = dayTimePeriodFormatter.stringFromDate(NSDate())
	
	let url = NSURL(fileURLWithPath: file)
	let className:String! = url.lastPathComponent == nil ? file: url.lastPathComponent!
	return "\(GRAY_LOG_PART)\(dateString) \(className) \(function)[\(line)]\(RESET_LOG_PART)"
}