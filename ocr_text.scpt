JsOsaDAS1.001.00bplist00�Vscript_�ObjC.import('Foundation');
ObjC.import('Vision');
ObjC.import('stdlib');


(() => {

  var args = $.NSProcessInfo.processInfo.arguments;
  
  var path = '/Users/lentan/Downloads/convo.jpg';
  if (args.count > 2) {
    path = $(args.objectAtIndex(2)).js;
	
  }
  const error = $();
  
  const fileURL = $.NSURL.fileURLWithPathIsDirectory(path, false);
    
  const request = $.VNRecognizeTextRequest.alloc.init;
  request.setRecognitionLanguages(ObjC.wrap([$.NSString.alloc.initWithString('en-US')]));
  const reqArray = $.NSArray.arrayWithObject(request);
    
  const imageRequestHandler = $.VNImageRequestHandler.alloc.initWithURLOptions(fileURL,{});
  
  const readingOrder = [];
  
  const success = imageRequestHandler.performRequestsError(reqArray, error);
  if (!success) {
    console.log($(error.localizedDescription).js)
  } else {
    const successArray = request.results.js;
    successArray.forEach(segment => {
	  readingOrder.push({ text: segment.text.js, origin: segment.boundingBox.origin, size: segment.boundingBox.size });
    })
  }
  
  // console.log(JSON.stringify(readingOrder));
  console.log(readingOrder.map(a => a.text).join(''))
})()                              �jscr  ��ޭ