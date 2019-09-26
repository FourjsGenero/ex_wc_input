var input=document.getElementById("theinput");
input.disabled=true;
var logs=[];
function log(s) {
  logs.push(s);
  console.log(s);
}
function getLogs() { //called from 4GL for debugging
  return JSON.stringify(logs);
}
//debugger helper in the browser
//add 2 mockup functions (not needed in production)
if (typeof(gICAPI)=="undefined") {
  gICAPI={};
  gICAPI.SetData=function(data) {
    log("SetData:"+data);
  }
  gICAPI.SetFocus=function() {
    log("SetFocus");
  }
}

input.onfocus=function() {
  gICAPI.SetFocus();
}
onICHostReady =function(version) { 
  log("onICHostReady");
  gICAPI.onFocus=function(focusIn) {
    log("onFocus:"+focusIn);
    if (focusIn) {
      input.focus();
    } else if (document.activeElement==input) {
      input.blur();
    }
  }
  gICAPI.onData=function(data) {
    log("onData:"+data);
    input.value=data;
  }
  gICAPI.onFlushData=function() {
    log("onFlushData:"+input.value);
    gICAPI.SetData(input.value);
  }
  gICAPI.onStateChanged=function(paramstr) {
    var state = JSON.parse(paramstr);
    var active = state.active;
    var dialogType = state.dialogType;
    log("onStateChanged active:"+active+",dialogType:"+dialogType);
    input.disabled=!active;
  }
}
