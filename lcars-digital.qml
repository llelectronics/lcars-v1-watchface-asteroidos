/*
 * Copyright (C) 2018 - Leszek Lesner <leszek.lesner@web.de>
 *               2018 - Timo Könnecke <el-t-mo@arcor.de>
 *               2015 - Florent Revest <revestflo@gmail.com>
 *               2014 - Aleksi Suomalainen <suomalainen.aleksi@gmail.com>
 * All rights reserved.
 *
 * You may use this file under the terms of BSD license as follows:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the author nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
* Based on Florents 002-alternative-digital stock watchface.
* Bigger monotype font (GeneraleMono) and fixed am/pm display by slicing to two chars.
* Calculated ctx.shadows with variable px size for better display in watchface-settings
*/

import QtQuick 2.1

Item {

    function twoDigits(x) {
        if (x<10) return "0"+x;
        else      return x;
    }

    function prepareContext(ctx) {
        ctx.reset()
        ctx.fillStyle = "white"
        ctx.textAlign = "center"
        ctx.textBaseline = 'middle';
//         ctx.shadowColor = Qt.rgba(0, 0, 0, 0.80)
//         ctx.shadowOffsetX = parent.height*0.00625
//         ctx.shadowOffsetY = parent.height*0.00625 //2 px on 320x320
//         ctx.shadowBlur = parent.height*0.0156  //5 px on 320x320
    }
    
//     Image {
//         id: background
//         source: "lcars-bg.jpg"
//         anchors.fill: parent
//     }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.5
    }

    Rectangle {
        id: leftUp
        height: parent.height / 12
        width: dayName.width + parent.width*0.015 //parent.width / 2 - parent.width*0.030
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height*0.20
        color: { 
            if (wallClock.time.toLocaleString(Qt.locale(), "ss") % 6 == 1) return "#FEFF97"  
            else return "#9999fd"
        }
        Text {
            id: dayName
            anchors.centerIn: parent
            text: wallClock.time.toLocaleString(Qt.locale(), "dddd")
            font.family: "Earth"
            font.styleName: "Regular"
            color: white
            font.pixelSize: parent.parent.height*0.0725
        }
    }
    Rectangle {
        id: middleUp
        height: parent.height / 12
        width: ((parent.width - leftUp.width) * 0.3) - parent.width*0.015
        anchors.left: leftUp.right
        anchors.leftMargin: parent.width*0.015
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height*0.20
        color: { 
            if (wallClock.time.toLocaleString(Qt.locale(), "ss") % 6 == 2) return "#FEFF97" 
            else return "#ec9204"
        }
    }
    Rectangle {
        id: rightUp
        height: parent.height / 12
        width: ((parent.width - leftUp.width) * 0.7) - parent.width*0.015
        anchors.left: middleUp.right
        anchors.leftMargin: parent.width*0.015
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height*0.20
        color: { 
            if (wallClock.time.toLocaleString(Qt.locale(), "ss") % 6 == 3) return "#FEFF97" 
            else return "#c198c3"
        }
    }

    
    Rectangle {
        id: leftDown
        height: parent.height / 12
        width: ((parent.width - middleDown.width) * 0.3) - parent.width*0.015
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height*0.16
        color: { 
            if (wallClock.time.toLocaleString(Qt.locale(), "ss") % 6 == 4) return "#FEFF97"  
            else return "#ca6060"
        }
        Text {
            id: dateDay
            anchors.centerIn: parent
            text: wallClock.time.toLocaleString(Qt.locale(), "dd")
            font.family: "Earth"
            font.styleName: "Regular"
            color: white
            font.pixelSize: parent.parent.height*0.0725
        }
    }
    Rectangle {
        id: middleDown
        height: parent.height / 12
        width: dateMonth.width + parent.width*0.015
        anchors.left: leftDown.right
        anchors.leftMargin: parent.width*0.015
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height*0.16
        color: { 
            if (wallClock.time.toLocaleString(Qt.locale(), "ss") % 6 == 5) return "#FEFF97"  
            else return "#fbb784"
        }
        Text {
            id: dateMonth
            anchors.centerIn: parent
            text: wallClock.time.toLocaleString(Qt.locale(), "MMM")
            font.family: "Earth"
            font.styleName: "Regular"
            color: white
            font.pixelSize: parent.parent.height*0.0725
        }
    }
    Rectangle {
        id: rightDown
        height: parent.height / 12
        width: ((parent.width - middleDown.width) * 0.7) - parent.width*0.015
        anchors.left: middleDown.right
        anchors.leftMargin: parent.width*0.015
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height*0.16
        color: { 
            if (wallClock.time.toLocaleString(Qt.locale(), "ss") % 6 == 0) return "#FEFF97"  
            else return "#ab85af"
        }
        Text {
            id: dateYear
            anchors.centerIn: parent
            text: wallClock.time.toLocaleString(Qt.locale(), "yyyy")
            font.family: "Earth"
            font.styleName: "Regular"
            color: white
            font.pixelSize: parent.parent.height*0.0725
        }
    }
    
    Canvas {
        id: hourMinuteCanvas
        anchors.fill: parent
        antialiasing: true
        smooth: true
        renderTarget: Canvas.FramebufferObject 

        property var hour: 0
        property var minute: 0

        onPaint: {
            var ctx = getContext("2d")
            prepareContext(ctx)

            var text;
            text = twoDigits(hour) + ":" + twoDigits(minute)

            ctx.font = "50 " +parent.height*0.25 + "px " + "Earth";
            ctx.fillText(text,
                        parent.width*0.5,
                        parent.height*0.5);
        }
    }

    Canvas {
        id: amPmCanvas
        anchors.fill: parent
        renderTarget: Canvas.FramebufferObject
        property var am: false

        onPaint: {
            var ctx = getContext("2d")
            prepareContext(ctx)

            var px = "px "
            var centerX =parent.width/2
            var centerY =parent.height*0.382
            var verticalOffset = -parent.height*0.013

            var text;
            text = wallClock.time.toLocaleString(Qt.locale(), "ap").toUpperCase()

            var fontSize =parent.height*0.072
            var fontFamily = "Earth"

            ctx.font = "0 " + fontSize + px + fontFamily;
            if(use12H.value) ctx.fillText(text,
                                          centerX,
                                          centerY+verticalOffset);
        }
    }

//     Canvas {
//         id: dateCanvas
//         anchors.fill: parent
//         antialiasing: true
//         smooth: true
//         renderTarget: Canvas.FramebufferObject 
// 
//         property var date: 0
// 
//         onPaint: {
//             var ctx = getContext("2d")
//             prepareContext(ctx)
// 
//             ctx.font = "0 " +parent.height*0.0725 + "px " + "Earth";
//             ctx.fillText(wallClock.time.toLocaleString(Qt.locale(), "dd MMM YYYY"),
//                         parent.width*0.5,
//                         parent.height*0.672);
//         }
//     }

    Connections {
        target: wallClock
        onTimeChanged: {
            var hour = wallClock.time.getHours()
            var minute = wallClock.time.getMinutes()
            var date = wallClock.time.getDate()
            if(hourMinuteCanvas.minute != minute) {
                hourMinuteCanvas.minute = minute
                hourMinuteCanvas.requestPaint()
            } if (hourMinuteCanvas.hour != hour) {
                hourMinuteCanvas.hour = hour
            } /*if(dateCanvas.date != date) {
                dateCanvas.date = date
                dateCanvas.requestPaint()
            }*/
        }
    }

    Component.onCompleted: {
        var hour = wallClock.time.getHours()
        var minute = wallClock.time.getMinutes()
        var date = wallClock.time.getDate()
        var am = hour < 12
        if(use12H.value) {
            hour = hour % 12
            if (hour == 0) hour = 12
        }
        hourMinuteCanvas.hour = hour
        hourMinuteCanvas.minute = minute
        hourMinuteCanvas.requestPaint()
//         dateCanvas.date = date
//         dateCanvas.requestPaint()
        amPmCanvas.am = am
        amPmCanvas.requestPaint()
    }

    Connections {
        target: localeManager
        onChangesObserverChanged: {
            hourMinuteCanvas.requestPaint()
//             dateCanvas.requestPaint()
            amPmCanvas.requestPaint()
        }
    }
}
