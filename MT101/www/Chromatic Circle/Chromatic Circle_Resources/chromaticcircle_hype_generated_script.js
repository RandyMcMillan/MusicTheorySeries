//	HYPE.documents["Chromatic Circle"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = "Chromatic%20Circle_Resources";
	var documentName = "Chromatic Circle";
	var documentLoaderFilename = "chromaticcircle_hype_generated_script.js";

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

var scenes = [{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:0,perspective:"600px",oid:"1",initialValues:{"102":{c:703,d:44,I:"None",J:"None",K:"None",g:"#DDEEFF",L:"Solid",M:0,N:0,j:"absolute",x:"visible",O:0,A:"#4B4B4D",P:1,B:"#4B4B4D",l:"0deg",z:"2",C:"#4B4B4D",m:"#4B4B4D",D:"#000000",k:"div",n:"#999A9C",a:0,b:680},"8":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"5",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"10":{c:701,q:"100% 100%",d:701,I:"Solid",r:"inline",J:"Solid",K:"Solid",L:"Solid",h:"ChromaticCircle.svg",M:1,N:1,j:"absolute",x:"visible",O:1,A:"#E9E8EE",P:1,B:"#E9E8EE",C:"#E9E8EE",z:"1",k:"div",D:"#E9E8EE",a:0,o:"content-box",b:0},"112":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:636,b:688,c:42,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:4,javascriptOid:"37"},M:1,w:"Wiki",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"7",bD:"none",P:1,Q:3},"113":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:307,b:688,c:74,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:1,transition:1,sceneSymbol:1},M:1,w:"\u25b6",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"6",bD:"none",P:1,Q:3}},backgroundColor:"#E9E8EE",name:"init"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:1,perspective:"600px",oid:"14",initialValues:{"11":{U:"htmlwidget.html",c:666,V:"0",d:666,I:"Solid",W:"",e:"0.000000",J:"Solid",aW:"0.000000",K:"Solid",g:"#FFFFFF",aX:0,L:"Solid",M:1,N:1,aI:24,j:"absolute",x:"visible",O:1,k:"div",aJ:24,P:1,Q:0,z:"2",aK:24,R:"#000000",S:0,a:16,aL:24,T:0,b:16},"117":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:636,b:688,c:42,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:4,javascriptOid:"37"},M:1,w:"Wiki",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"15",bD:"none",P:1,Q:3},"107":{aV:8,w:"sharps",x:"visible",a:300,Z:"break-word",y:"preserve",aS:8,r:"inline",z:"12",j:"absolute",b:292,aT:8,k:"div",t:16,G:"#000000",aU:8},"12":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"4",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"126":{c:703,d:44,I:"None",J:"None",K:"None",g:"#DDEEFF",L:"Solid",M:0,N:0,j:"absolute",x:"visible",O:0,A:"#4B4B4D",P:1,B:"#4B4B4D",l:"0deg",z:"1",C:"#4B4B4D",m:"#4B4B4D",D:"#000000",k:"div",n:"#999A9C",a:0,b:680},"116":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:307,b:688,c:74,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:1,transition:1,sceneSymbol:1},M:1,w:"\u25ba\u25ba",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"14",bD:"none",P:1,Q:3},"15":{o:"content-box",h:"ChromaticWithSharps.svg",x:"visible",a:16,q:"100% 100%",b:16,j:"absolute",r:"inline",c:668,z:"5",k:"div",d:361}},backgroundColor:"#E9E8EE",name:"sharps"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:2,perspective:"600px",oid:"19",initialValues:{"16":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"4",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"108":{aV:8,w:"flats",x:"visible",a:300,Z:"break-word",y:"preserve",aS:8,r:"inline",z:"11",j:"absolute",b:418,aT:8,k:"div",t:16,G:"#000000",aU:8},"127":{c:703,d:44,I:"None",J:"None",K:"None",g:"#DDEEFF",L:"Solid",M:0,N:0,j:"absolute",x:"visible",O:0,A:"#4B4B4D",P:1,B:"#4B4B4D",l:"0deg",z:"1",C:"#4B4B4D",m:"#4B4B4D",D:"#000000",k:"div",n:"#999A9C",a:0,b:680},"17":{U:"htmlwidget-1.html",c:666,V:"0",d:666,I:"Solid",W:"",e:"0.000000",J:"Solid",aW:"0.000000",K:"Solid",g:"#FFFFFF",aX:0,L:"Solid",M:1,N:1,aI:24,j:"absolute",x:"visible",O:1,k:"div",aJ:24,P:1,Q:0,z:"2",aK:24,R:"#000000",S:0,a:16,aL:24,T:0,b:16},"120":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:636,b:688,c:42,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:4,javascriptOid:"37"},M:1,w:"Wiki",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"14",bD:"none",P:1,Q:3},"20":{o:"content-box",h:"ChromaticWithFlats.svg",x:"visible",a:16,q:"100% 100%",b:16,j:"absolute",r:"inline",c:668,z:"5",k:"div",d:361},"119":{R:"#808080",S:0,aI:6,T:0,aJ:6,aK:6,X:0,aL:6,Y:13,Z:"break-word",aP:"pointer",a:307,b:688,c:74,d:15,aS:6,e:"1.000000",aT:6,g:"#4B4B4D",aU:6,aV:6,j:"absolute",aW:"0.000000",k:"div",A:"#4B4B4D",l:"0deg",aX:0,B:"#4B4B4D",m:"#000000",C:"#4B4B4D",n:"#7D7D81",D:"#4B4B4D",E:3,aZ:1,F:"center",G:"#FFFFFF",r:"inline",H:"none",s:"Helvetica,Arial,Sans-Serif",I:"Inset",t:13,J:"Inset",u:"normal",K:"Inset",bA:"#8A8A8A",v:"bold",L:"Inset",aE:{type:1,transition:1,sceneSymbol:3},M:1,w:"\u25ba\u25ba",x:"visible",N:1,bC:0,y:"preserve",O:1,bB:0,z:"13",bD:"none",P:1,Q:3}},backgroundColor:"#E9E8EE",name:"flats"}];


	
	var javascripts = [{name:"openCBFunction",source:"function(hypeDocument, element, event) {\n\n\tvar loc = \"http://www.google.com\";\n    cordova.exec(\"ChildBrowserCommand.showWebPage\", loc);\n\n\t/*\t\n\t\thypeDocument - access to the hype document API:\n\t\t\t\t\t\tMETHODS:\n\t\t\t\t\t\thypeDocument.documentName()\n\t\t\t\t\t\thypeDocument.sceneNames()\n\t\t\t\t\t\thypeDocument.currentSceneName()\n\t\t\t\t\t\thypeDocument.showSceneNamed(sceneName, optionalTransition)\n\t\t\t\t\t\thypeDocument.showNextScene(optionalTransition)\n\t\t\t\t\t\thypeDocument.showPreviousScene(optionalTransition)\n\t\t\t\t\t\thypeDocument.playTimelineNamed(timelineName)\n\t\t\t\t\t\thypeDocument.getElementById(id)\n\n\t\t\t\t\t\tMORE INFO:\n\t\t\t\t\t\thttp://tumultco.com/hype/documentation/javascript/\n\t\n\t\telement - DOMHTMLElement that triggered this function being called\n\t\tevent - event that triggered this function being called\n\t*/\n\t\n\t\n}",identifier:"37"}];


	
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
	hypeDoc.setMainContentContainerID("chromaticcircle_hype_container");
	hypeDoc.setResourcesFolderName(resourcesFolderName);
	hypeDoc.setShowHypeBuiltWatermark(0);
	hypeDoc.setShowLoadingPage(true);
	hypeDoc.setDrawSceneBackgrounds(true);
	hypeDoc.setDocumentName(documentName);

	HYPE.documents[documentName] = hypeDoc.API;

	hypeDoc.documentLoad(this.body);
}());

