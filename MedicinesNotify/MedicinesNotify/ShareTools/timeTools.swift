//
//  timeTools.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/8.
//

import Foundation

func FormatTimePeriodToString(hour: Int, minute: Int)->String
{
    var hourString = ""
    var minuteString = ""
    
    if(hour < 10)
    {
        hourString = "0\(hour)"
    }
    else
    {
        hourString = "\(hour)"
    }
    
    if(minute < 10)
    {
        minuteString = "0\(minute)"
    }
    else
    {
        minuteString = "\(hour)"
    }
    
    let ret = "\(hourString):\(minuteString)"
    
    return ret
}

func FormatDateToString(year: Int, month: Int, day: Int, weekDay: Int)->String
{
    var weekDayString = ""
    
    switch weekDay {
    case 2:
        weekDayString = "一"
    case 3:
        weekDayString = "二"
    case 4:
        weekDayString = "三"
    case 5:
        weekDayString = "四"
    case 6:
        weekDayString = "五"
    case 7:
        weekDayString = "六"
    case 1:
        weekDayString = "日"
    default:
        weekDayString = "?"
    }
    
    let ret = "\(year) 年 \(month) 月 \(day) 日 星期\(weekDayString)"
    
    return ret
}

struct NowDate {
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    var weekDay: Int = 0
}

struct NowTime {
    var hour: Int = 0
    var miniute: Int = 0
    var second: Int = 0
}

func getNowDate()->NowDate
{
    var ret = NowDate()
    
    let time = Date()
    
    let yearFormatter = DateFormatter()
    yearFormatter.dateFormat = "yyyy"
    ret.year = Int(yearFormatter.string(from: time))!
    
    let monthFormatter = DateFormatter()
    monthFormatter.dateFormat = "MM"
    ret.month = Int(monthFormatter.string(from: time))!
    
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "dd"
    ret.day = Int(dayFormatter.string(from: time))!
    
    /*
    let weekDayFormatter = DateFormatter()
    weekDayFormatter.dateFormat = "E"
    let engWeekDay = weekDayFormatter.string(from: time)
    */
    let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: time)
    ret.weekDay = dateComponents.weekday!
    
    return ret
}

func getNowTime()->NowTime
{
    var ret = NowTime()
    
    let time = Date()
    
    let hourFormatter = DateFormatter()
    hourFormatter.dateFormat = "HH"
    ret.hour = Int(hourFormatter.string(from: time))!
    
    let minuteFormatter = DateFormatter()
    minuteFormatter.dateFormat = "mm"
    ret.miniute = Int(minuteFormatter.string(from: time))!
    
    let secondFormatter = DateFormatter()
    secondFormatter.dateFormat = "ss"
    ret.second = Int(minuteFormatter.string(from: time))!
    
    return ret
}

func GetNowTimePeriod()->String
{
    // midNight 00:00:00
    var dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: 0, minute: 0, second: 0)
    let midNight = dateComponents.date
    
    // yesterday 23:59:59
    dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: 23, minute: 59, second: 59)
    let yesterday = dateComponents.date
    
    // getNowTime
    let nowTimeObj = getNowTime()
    dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: nowTimeObj.hour, minute: nowTimeObj.miniute, second: nowTimeObj.second)
    // fixme: debug
    //dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: 21, minute: 0, second: 0)
    let nowTime = dateComponents.date
    
    // load file TimePeriodSetting.json to get TimePeriodSetting
    let timePeriodSetting: TimePeriodSetting = JsonParserInRoot("TimePeriodSetting.json")
    
    // morning
    dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: timePeriodSetting.moriningHour, minute: timePeriodSetting.moriningMinute, second: 0)
    let morning = dateComponents.date
    
    // noon
    dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: timePeriodSetting.noonHour, minute: timePeriodSetting.noonMinute, second: 0)
    let noon = dateComponents.date
    
    // eveniing
    dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: timePeriodSetting.eveningHour, minute: timePeriodSetting.eveningMinute, second: 0)
    let evening = dateComponents.date
    
    // beforeSleep
    dateComponents = DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 8, hour: timePeriodSetting.beforeSleepHour, minute: timePeriodSetting.beforeSleepMinute, second: 0)
    let beforeSleep = dateComponents.date
    
    
    // 7 12 19 21
    
    // morning
    if ( (nowTime! <= morning! && nowTime! >= midNight!) || (nowTime! > beforeSleep! && nowTime! <= yesterday!) )
    {
        return "早上"
    }
    // noon
    if (nowTime! <= noon! && nowTime! > morning!)
    {
        return "中午"
    }
    // evening
    if (nowTime! <= evening! && nowTime! > noon!)
    {
        return "晚上"
    }
    // beforeSleep
    if (nowTime! <= beforeSleep! && nowTime! <= yesterday!)
    {
        return "睡前"
    }
    
    return ""
}
