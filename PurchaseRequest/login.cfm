<!--- query for staff listing --->
<CFQUERY name="get_staff" datasource="FiscalPurchase">
SELECT *
FROM Staff
WHERE (sLogin='#SESSION.lUser#')
</CFQUERY>
<cfset session.access="#get_staff.user#">

<! DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
	<TITLE>Fiscal Purchase Card Food & Beverage Approval</TITLE>
	<META NAME="Creator"  content="Department of Veterans Affairs, Veterans Health Administration, VISN 8, Bay Pines VAHCS, Fiscal">
	<META NAME="Description" CONTENT="This web-based application is used for locally requesting Purchase Card Food & Beverage Approval.">
	<META NAME="Keywords" CONTENT="Fiscal, Purchase, Card, Food, Beverage, Approval">
	<META NAME="Subject" CONTENT="Fiscal Purchase Card Food & Beverage Approval">
	<META NAME="DateCreated" CONTENT="20090715">
	<META NAME="DateReviewed" CONTENT="20170502">
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</HEAD>

<BODY onLoad="document.login.password.focus()">

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<BR>Purchases Using a Government<BR>Purchase Card</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="center">
			<!--- login to the application --->
			
			<DIV ALIGN="center">
			<CFIF get_staff.Recordcount EQ "0">
			<P>You are not authorized to access this area.<BR>
			If you feel you received this message in error, please contact the FISCAL application administrator.</P>
			<cfelse>
			<!--- login to the application --->
			<cfoutput query="get_staff">
			<cfform method="POST" action="processLogin.cfm" name="login">
			<P>Welcome back <STRONG>#Staff#</STRONG><BR>
			Please select the button below to continue.<BR>
			<INPUT name="ID" type="hidden" class="textc" value="#recordID#" MULTIPLE="no"><BR /><BR />
			<INPUT name="" type="submit" class="textc" value=" Login " /></P>
			</cfform>
			</cfoutput>
</CFIF>			
</DIV>
			
			
			
<!--- 			<cfform method="POST" action="processLogin.cfm" name="login">
			Login ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfselect name="email" multiple="no" query="get_staff" value="email" display="staff" class="textc"></cfselect><BR /><BR />
			Password:&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type="password" name="password" size="30" class="textc" /><BR /><BR />
			<INPUT name="" type="submit" class="textb" value="Login" />
			</cfform> --->
</DIV>
<!--- <A href="pwforgot.cfm">Did you forget your password?</A> --->
</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: May 2, 2017</P>

</TD>
</TR>
</TABLE>