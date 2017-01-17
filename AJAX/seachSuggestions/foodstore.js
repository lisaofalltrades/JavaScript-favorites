var xmlHttp = createXmlHttpRequestionObject()

function createXmlHttpRequestionObject () {
  var xmlHttp;

  if(window.ActiveXObject){
    try{
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }catch(e) {
      xmlHttp = false;
    }
  }else{
    try{
      xmlHttp = new XMLHttpRequest();
    }catch(e) {
      xmlHttp = false;
    }
  }
  if(!xmlHttp)
    alert("Can't create that object hoss!");
  else
    return xmlHttp;   
};
