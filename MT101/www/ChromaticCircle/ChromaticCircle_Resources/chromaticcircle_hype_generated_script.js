//	HYPE.documents["ChromaticCircle"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = "ChromaticCircle_Resources";
	var documentName = "ChromaticCircle";
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

var scenes = [{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:0,perspective:"600px",oid:"1",initialValues:{"3":{U:"htmlwidget.html",c:666,V:"0",d:666,I:"Solid",W:"",e:"0.000000",J:"Solid",aW:"0.000000",K:"Solid",g:"#FFFFFF",aX:0,L:"Solid",M:1,N:1,aI:24,j:"absolute",x:"visible",O:1,k:"div",aJ:24,P:1,Q:0,z:"1",aK:24,R:"#000000",S:0,a:16,aL:24,T:0,b:16},"8":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"3",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"10":{o:"content-box",h:"ChromaticCircle.svg",x:"visible",a:16,q:"100% 100%",b:16,j:"absolute",r:"inline",c:668,z:"4",k:"div",d:668},"21":{b:655,z:"5",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,sceneOid:"14",transition:2},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"Sharps<div><br></div>",x:"visible",I:"Solid",a:16,y:"preserve",J:"Solid"},"28":{b:655,z:"6",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,sceneOid:"19",transition:2},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"Flats<div><br></div>",x:"visible",I:"Solid",a:580,y:"preserve",J:"Solid"},"29":{b:655,z:"7",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,sceneOid:"1",transition:2},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"<div>Circle</div>",x:"visible",I:"Solid",a:298,y:"preserve",J:"Solid"}},backgroundColor:"#FFFFFF",name:"init"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:1,perspective:"600px",oid:"14",initialValues:{"31":{b:655,z:"6",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,transition:2,sceneOid:"19"},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"Flats<div><br></div>",x:"visible",I:"Solid",a:580,y:"preserve",J:"Solid"},"30":{b:655,z:"5",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,transition:2,sceneOid:"14"},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"Sharps<div><br></div>",x:"visible",I:"Solid",a:16,y:"preserve",J:"Solid"},"12":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"3",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"32":{b:655,z:"7",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,transition:2,sceneOid:"1"},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"<div>Circle</div>",x:"visible",I:"Solid",a:298,y:"preserve",J:"Solid"},"15":{o:"content-box",h:"ChromaticWithSharps.svg",x:"visible",a:16,q:"100% 100%",b:16,j:"absolute",r:"inline",c:668,z:"4",k:"div",d:361},"11":{U:"htmlwidget-1.html",c:666,V:"0",d:666,I:"Solid",W:"",e:"0.000000",J:"Solid",aW:"0.000000",K:"Solid",g:"#FFFFFF",aX:0,L:"Solid",M:1,N:1,aI:24,j:"absolute",x:"visible",O:1,k:"div",aJ:24,P:1,Q:0,z:"1",aK:24,R:"#000000",S:0,a:16,aL:24,T:0,b:16}},backgroundColor:"#FFFFFF",name:"sharps"},{timelines:{kTimelineDefaultIdentifier:{framesPerSecond:30,animations:[],identifier:"kTimelineDefaultIdentifier",name:"Main Timeline",duration:0}},sceneIndex:2,perspective:"600px",oid:"19",initialValues:{"34":{b:655,z:"6",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,transition:2,sceneOid:"19"},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"Flats<div><br></div>",x:"visible",I:"Solid",a:580,y:"preserve",J:"Solid"},"17":{U:"htmlwidget-2.html",c:666,V:"0",d:666,I:"Solid",W:"",e:"0.000000",J:"Solid",aW:"0.000000",K:"Solid",g:"#FFFFFF",aX:0,L:"Solid",M:1,N:1,aI:24,j:"absolute",x:"visible",O:1,k:"div",aJ:24,P:1,Q:0,z:"1",aK:24,R:"#000000",S:0,a:16,aL:24,T:0,b:16},"16":{x:"visible",b:446,c:0,k:"div",q:"100% 100%",z:"3",d:0,r:"inline",a:482,j:"absolute",o:"content-box"},"33":{b:655,z:"5",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,transition:2,sceneOid:"14"},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"Sharps<div><br></div>",x:"visible",I:"Solid",a:16,y:"preserve",J:"Solid"},"20":{o:"content-box",h:"ChromaticWithFlats.svg",x:"visible",a:16,q:"100% 100%",b:16,j:"absolute",r:"inline",c:668,z:"4",k:"div",d:361},"35":{b:655,z:"7",K:"Solid",c:90,L:"Solid",d:15,aE:{type:1,transition:2,sceneOid:"1"},aS:6,bD:"none",M:1,aT:6,N:1,O:1,g:"#F0F0F0",aU:6,P:1,aV:6,j:"absolute",aI:44,k:"div",l:"0deg",aJ:44,m:"#A2A2A2",n:"#F0F0F0",aK:44,aL:44,A:"#A0A0A0",B:"#A0A0A0",Z:"break-word",r:"inline",C:"#A0A0A0",D:"#A0A0A0",t:13,F:"center",G:"#000000",aP:"pointer",w:"<div>Circle</div>",x:"visible",I:"Solid",a:298,y:"preserve",J:"Solid"}},backgroundColor:"#FFFFFF",name:"flats"}];


	
	var javascripts = [];


	
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

