        <% 'wrapperFooter %>
        <section class="wrapperFooter">
            <div class="innerWrap">
            
                <div id="footerText" class="footerText" runat="server"></div>
                <div class="footerCopyright">Website Design by <a href="http://www.cdaa.com.au" target="_blank">CDAA</a></div>

            </div>
        </section>
        <% '/wrapperFooter %>
    
	</div>
    <% '/wrapper %>

	<% 'Only include selectivizr if less than IE7 %> 
    <!--[if lt IE 7 ]>
    <script src="<%=SkinPath%>js/selectivizr-min.js"></script>
    <![endif]-->

    <% 'All non-important scripts included at bottom for performance %>
    <script defer src="<%=SkinPath%>js/plugins.js"></script>
    <script defer src="<%=SkinPath%>js/script.js"></script>
    
    <% 'Prompt for ChromeFrame if less than IE8 %>
    <!--[if lt IE 8 ]>
    <script src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
    <![endif]-->