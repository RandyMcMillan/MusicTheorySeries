//	HYPE.documents["CircleOfFifths"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = "CircleOfFifths_Resources";
	var documentName = "CircleOfFifths";
	var documentLoaderFilename = "circleoffifths_hype_generated_script.js";

	// find the URL for this script's absolute path and set as the resourceFolderName
	try {
		var scripts = document.getElementsByTagName('script');
		for(var i = 0; i < scripts.length; i++) {
			var scriptSrc = scripts[i].src;
			if(scriptSrc != null && scriptSrc.indexOf(documentLoaderFilename) != -1) {
				resourcesFolderName = scriptSrc.substr(0, scriptSrc.lastIndexOf("/"));
				break;
			}
		}
	} catch(err) {	}

	// Legacy support
	if (typeof window.HYPE_DocumentsToLoad == "undefined") {
		window.HYPE_DocumentsToLoad = new Array();
	}
 
	// load HYPE.js if it hasn't been loaded yet
	if(typeof HYPE_108 == "undefined") {
		if(typeof window.HYPE_108_DocumentsToLoad == "undefined") {
			window.HYPE_108_DocumentsToLoad = new Array();
			window.HYPE_108_DocumentsToLoad.push(HYPE_DocumentLoader);

			var headElement = document.getElementsByTagName('head')[0];
			var scriptElement = document.createElement('script');
			scriptElement.type= 'text/javascript';
			scriptElement.src = resourcesFolderName + '/' + 'HYPE.js?hype_version=108';
			headElement.appendChild(scriptElement);
		} else {
			window.HYPE_108_DocumentsToLoad.push(HYPE_DocumentLoader);
		}
		return;
	}
	
	// guard against loading multiple times
	if(HYPE.documents[documentName] != null) {
		return;
	}
	
	var hypeDoc = new HYPE_108();
	
	var attributeTransformerMapping = {b:"i",c:"i",bC:"i",d:"i",aS:"i",M:"i",e:"f",N:"i",f:"d",aT:"i",O:"i",g:"c",aU:"i",P:"i",Q:"i",aV:"i",R:"c",aW:"f",aI:"i",S:"i",T:"i",l:"d",aX:"i",aJ:"i",m:"c",n:"c",aK:"i",X:"i",aL:"i",A:"c",aZ:"i",Y:"i",B:"c",C:"c",D:"c",t:"i",E:"i",G:"c",bA:"c",a:"i",bB:"i"};

var scenes = [{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:0,perspective:"600px",oid:"1",initialValues:{"17":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"4",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"16":{c:703,d:44,I:"None",J:"None",K:"None",g:"#DDEEFF",L:"Solid",M:0,N:0,j:"absolute",x:"visible",O:0,A:"#4B4B4D",P:1,B:"#4B4B4D",l:"0deg",z:"3",C:"#4B4B4D",m:"#4B4B4D",D:"#000000",k:"div",n:"#999A9C",a:0,b:680},"19":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:636,b:688,c:42,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:4,javascriptOid:"21"},M:1,w:"Wiki",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"6",bD:"none",P:1,Q:3},"20":{o:"content-box",h:"CircleOfFifths.svg",x:"visible",a:0,q:"100% 100%",b:0,j:"absolute",r:"inline",c:703,z:"2",k:"div",d:703},"18":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:307,b:688,c:74,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:1,transition:1,sceneSymbol:1},M:1,w:"\u25b6",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"5",bD:"none",P:1,Q:3}},backgroundColor:"#FFFFFF",name:"init"}];


	
	var javascripts = [{name:"openCBFunction",source:"function(hypeDocument, element, event) {\n\n\tvar loc = \"http://www.google.com\";\n    cordova.exec(\"ChildBrowserCommand.showWebPage\", loc);\n\n\t/*\t\n\t\thypeDocument - access to the hype document API:\n\t\t\t\t\t\tMETHODS:\n\t\t\t\t\t\thypeDocument.documentName()\n\t\t\t\t\t\thypeDocument.sceneNames()\n\t\t\t\t\t\thypeDocument.currentSceneName()\n\t\t\t\t\t\thypeDocument.showSceneNamed(sceneName, optionalTransition)\n\t\t\t\t\t\thypeDocument.showNextScene(optionalTransition)\n\t\t\t\t\t\thypeDocument.showPreviousScene(optionalTransition)\n\t\t\t\t\t\thypeDocument.playTimelineNamed(timelineName)\n\t\t\t\t\t\thypeDocument.getElementById(id)\n\n\t\t\t\t\t\tMORE INFO:\n\t\t\t\t\t\thttp://tumultco.com/hype/documentation/javascript/\n\t\n\t\telement - DOMHTMLElement that triggered this function being called\n\t\tevent - event that triggered this function being called\n\t*/\n\t\n\t\n}",identifier:"21"}];


	
	var Custom = {};
	var javascriptMapping = {};
	for(var i = 0; i < javascripts.length; i++) {
		try {
			javascriptMapping[javascripts[i].identifier] = javascripts[i].name;
			eval("Custom." + javascripts[i].name + " = " + javascripts[i].source);
		} catch (e) {
			hypeDoc.log(e);
			Custom[javascripts[i].name] = (function () {});
		}
	}
	
	hypeDoc.setAttributeTransformerMapping(attributeTransformerMapping);
	hypeDoc.setScenes(scenes);
	hypeDoc.setJavascriptMapping(javascriptMapping);
	hypeDoc.Custom = Custom;
	hypeDoc.setCurrentSceneIndex(0);
	hypeDoc.setMainContentContainerID("circleoffifths_hype_container");
	hypeDoc.setResourcesFolderName(resourcesFolderName);
	hypeDoc.setShowHypeBuiltWatermark(0);
	hypeDoc.setShowLoadingPage(true);
	hypeDoc.setDrawSceneBackgrounds(true);
	hypeDoc.setDocumentName(documentName);

	HYPE.documents[documentName] = hypeDoc.API;

	hypeDoc.documentLoad(this.body);
}());

