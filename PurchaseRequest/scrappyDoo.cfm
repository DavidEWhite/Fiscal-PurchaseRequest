<!--- evaluate for service --->
<CFIF #FORM.service# EQ "Select >>">
<h4 align="center">Problem with request:</h4>
<H5 align="center">You must choose a Service to continue.</H5>
<DIV ALIGN="center">
<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  ">
</DIV>
<P>&nbsp;</P>
<P>&nbsp;</P>
<CFELSE>
	<!--- evaluate for clerk field --->
	<CFIF #FORM.clerk# EQ "Select >>">
	<h4 align="center">Problem with request:</h4>
	<H5 align="center">You must decide "If approved, order will be placed on a GPC by ..." to continue.</H5>
<DIV ALIGN="center">
<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  ">
</DIV>
<P>&nbsp;</P>
<P>&nbsp;</P>
	<CFELSE>
		<!--- evaluate for email fields --->
		<CFIF #FORM.rEmail# EQ "#FORM.aEmail#">
		<h4 align="center">Problem with request:</h4>
		<H5 align="center">Requester's email address and Authorizing Official's email address can not be same.</H5>
		<DIV ALIGN="center">
		<INPUT onclick=history.go(-1) class="textc" type=button value="  BACK  ">
		</DIV>
		<P>&nbsp;</P>
		<P>&nbsp;</P>
		<CFELSE>
		
		
		</CFIF>
	</CFIF>
</CFIF>