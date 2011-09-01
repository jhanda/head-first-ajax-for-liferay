package com.liferay.training.hfa.ch1;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import java.io.IOException;
import java.util.HashMap;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

/**
 * Portlet implementation class ChapterOnePortlet
 */
public class ChapterOnePortlet extends MVCPortlet {

    @Override
	public void init() throws PortletException{
    	_productDetails.put("itemGuitar","<p>Pete Townshend once played this guitar while his own axe was in the shop having bits of drumkit removed from it.</p>");
    	_productDetails.put("itemShades","<p>Yoko Ono's sunglasses. While perhaps not valued much by Beatles fans, this pair is rumored to have been licked by John Lennon.</p>");
    	_productDetails.put("itemCowbell","<p>Remember the famous \"more cowbell\" skit from Saturday Night Live? Well, this is the actual cowbell.</p>");
    	_productDetails.put("itemHat","<p>Michael Jackson's hat, as worn in the \"Billie Jean\" video. Not really rock memorabilia, but it smells better than Slash's tophat.</p>");        
    	super.init();
    }

    
    @Override
	public void serveResource(ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws IOException,
			PortletException {

    	String item = ParamUtil.getString(resourceRequest, "itemTitle");
    	String itemDetails = _productDetails.get(item);
		resourceResponse.setContentType("text/html");
		resourceResponse.getWriter().write(itemDetails);
		
	}
    
    private HashMap<String, String> _productDetails = new HashMap<String, String>();
	private static Log _log = LogFactoryUtil.getLog(ChapterOnePortlet.class);

}
