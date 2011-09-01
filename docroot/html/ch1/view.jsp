  <%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
  <%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
  
  <%
  	String contextPath = request.getContextPath();
  %>
  <div id="wrapper">
    <img src="<%=contextPath %>/images/logotypeLeft.png" alt="Rob's Rock 'n' Roll Memorabilia" 
         width="394" height="91" id="logotypeLeft" />
    <img src="<%=contextPath %>/images/logotypeRight.png" alt="Rob's Rock 'n' Roll Memorabilia" 
         width="415" height="92" id="logotypeRight" />
	
    <div id="introPane">
      <p>Are you looking for the perfect gift for the rock fan in your life? 
         Maybe you want a guitar with some history behind it, or a conversation 
         piece for your next big shindig. Look no further! Here you'll find all 
         sorts of great memorabilia from the golden age of rock and roll.</p>
      <p><strong>Click on an image to the left for more details.</strong></p>
    </div>
    <div id="thumbnailPane">
      <img src="<%=contextPath %>/images/itemGuitar.jpg" width="301" height="105" alt="guitar" 
           title="itemGuitar" id="itemGuitar" />
      <img src="<%=contextPath %>/images/itemShades.jpg" alt="sunglasses" width="301" height="88" 
           title="itemShades" id="itemShades" />
      <img src="<%=contextPath %>/images/itemCowbell.jpg" alt="cowbell" width="301" height="126" 
           title="itemCowbell" id="itemCowbell" />
      <img src="<%=contextPath %>/images/itemHat.jpg" alt="hat" width="300" height="152" 
           title="itemHat" id="itemHat" />
		</div>
    <div id="detailsPane">
      <img src="<%=contextPath %>/images/blank-detail.jpg" width="346" height="153" id="itemDetail" />
      <br/><div id="description"></div>
    </div>
  </div>
  
  
 <script>

	AUI().use('aui-io-request', function(A){  		
 	
 		//Find the thumbnails on the page
 		var thumbs = document.getElementById("thumbnailPane").getElementsByTagName("img");
 		//var pane = A.one('#thumbnailPane');
 		//var thumbs = pane.all('img');

 		//Set the handler for each image
 		for (var i=0; i<thumbs.length; i++){
 		
 			image = thumbs[i];
 		
 			//Create the onClick function
 			image.onclick = function(){
 			
 				//Find the full size image name
 				detailURL = '<%=contextPath %>/images/' + this.title + '-detail.jpg';
 				document.getElementById("itemDetail").src = detailURL;
 				getDetails(this.title);
 			}
 		}

 		//Create the Ajax Request
		var myRequest = A.io.request('<portlet:resourceURL/>', {
			autoLoad: false, 
			on: {
					success: function() {
						document.getElementById('description').innerHTML=this.get('responseData');
					}   
				} 
		});
	  
		function getDetails(title){
			var dataObj = {itemTitle: title };
			myRequest.set('data', dataObj);
			myRequest.start();
		}
		
	});
  
</script>
  