/*!
 DMXzone Geolocation
 Version: 1.0.0
 (c) 2018 DMXzone.com
 @build 2018-01-15 15:33:05
 */
dmx.Component("geolocation",{initialData:{support:!!navigator.geolocation,status:navigator.geolocation?"Geolocation is not supported by this browser.":"Locating...",timestamp:null,coords:null},attributes:{tracking:{type:Boolean,default:!1},"enable-high-accuracy":{type:Boolean,default:!1},"max-age":{type:Number,default:3e4},timeout:{type:Number,default:27e3}},methods:{getCurrentPosition:function(){this.getCurrentPosition()},watchPosition:function(){this.watchPosition()},clearWatch:function(){this.clearWatch()}},events:{success:Event,error:Event,permissiondenied:Event,unavailable:Event,timeout:Event},errorCodes:{1:"permissiondenied",2:"unavailable",3:"timeout"},render:function(t){this.update({})},update:function(t){this.data.support&&JSON.stringify(t)!=JSON.stringify(this.props)&&(this.props.tracking?this.watchPosition():(this.clearWatch(),this.getCurrentPosition()))},getCurrentPosition:function(){this.data.support&&navigator.geolocation.getCurrentPosition(this.onSuccess.bind(this),this.onError.bind(this),{enableHighAccuracy:this.props["enable-high-accuracy"],timeout:this.props.timeout,maximumAge:this.props["max-age"]})},watchPosition:function(){this.data.support&&!this.watching&&(this.watching=navigator.geolocation.watchPosition(this.onSuccess.bind(this),this.onError.bind(this),{enableHighAccuracy:this.props["enable-high-accuracy"],timeout:this.props.timeout,maximumAge:this.props["max-age"]}))},clearWatch:function(){this.data.support&&this.watching&&(navigator.geolocation.clearWatch(this.watching),delete this.watching)},onSuccess:function(t){this.set("status","OK"),this.set("timestamp",t.timestamp),this.set("coords",{latitude:t.coords.latitude,longitude:t.coords.longitude,altitude:t.coords.altitude,accuracy:t.coords.accuracy,altitudeAccuracy:t.coords.altitudeAccuracy,heading:t.coords.heading,speed:t.coords.speed}),dmx.nextTick(this.dispatchEvent.bind(this,"success"))},onError:function(t){this.set("status",t.message||this.errorCodes[t.code]||"Unknown Error."),dmx.nextTick(this.dispatchEvent.bind(this,this.errorCodes[t.code]||"error"))}});
//# sourceMappingURL=../maps/dmxGeolocation.js.map