// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require uikit

function getData(){
$.ajax({
  type: 'GET',
  //url: 'http://iwb.jp/s/js/data.json',
  //url: '/api/fatigue',
  url: 'http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c',
  dataType: 'json',
  success: function(json){
   //alert("SUCCESS!!!"+json);
    var len = json.length;
    //for(var i=0; i < 10; i++){
      //alert(json[i].CategoryName);
      //$("#noti").append(json[i].version + ' ' + json[i].codename + '<br>');
      //$("#noti").append(json[i].id + ' ' + json[i].sim_number + '<br>'); (Date.parse(s.replace(/-/g, "/"))); 
      //jsnowtime = new Date();
      //result = (new Date(Date.parse(nowtime.replace(/-/g, "/"))) - new Date(json[i].current_at) )  / 3600 / 1000;
      //result = (jsnowtime - new Date(json[i].current_at) )  / 3600 / 1000;
      //alert(result);
      //console.log(result);
      console.log(len);
      //console.log(json);
      //if ( result < 0.05 ){ //1.0 = 1hr, 0.1=6min, 0.01 = 18s
         //nowid = json[i].id;
         //console.log(result);
         //console.log(jsnowtime);
         //console.log(json[i].current_at);
         //showAlert(result, json[i].sim_number, json[i].current_at);
      //}//if
    //}
  }
});
}
getData();
