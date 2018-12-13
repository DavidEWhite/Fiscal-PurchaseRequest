<!--- set options --->
<CFPARAM name="URL.option" default="0" type="any">

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
	<META NAME="DateReviewed" CONTENT="20090715">
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</HEAD>

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>- Forgotten Password -</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">

<!--- initial entry --->
<CFIF #URL.option# EQ "0">
<!--- query for staff listing --->
<CFQUERY name="get_staff" datasource="FiscalPurchase">
SELECT *
FROM staff
WHERE User=3
ORDER BY staff
</CFQUERY>
<P align="center"><STRONG>Please select your name.  Your password will be emailed to you immediately:</STRONG></P>

<DIV ALIGN="center">
<div id="all">
	<div id="allleft">
		<div class="gentext">
			<div class="bigclear"></div>
			<cfform method="POST" action="pwforgot.cfm?option=1" name="password">
			Login ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfselect name="recordID" multiple="no" query="get_staff" value="recordID" display="staff"></cfselect>
			<input type="submit" value="Submit" class="textb" />
			</cfform>
		</div>
	</div>
</div>
</DIV>
</CFIF>

<!--- user selected --->
<CFIF #URL.option# EQ "1">
<CFQUERY name="get_data" datasource="FiscalPurchase">
SELECT email, password
FROM staff
WHERE (recordID = #FORM.recordID#);
</CFQUERY>

<!--- acknowledgement of valid selection --->
<P align="center"><STRONG>Your password will be emailed
to you at <CFOUTPUT query="get_data">#email#</STRONG></P>
<p align="right"><a href="login.cfm">Return to login page</a></p>

<!--- send email to valid selection ---> 
<CFMAIL to="#email#" from="eASLDoNotReply@va.gov" subject="F&B Forgotten Password - Fiscal Purchase Request" type="html">
<p align="center" style="font-weight:bold">***** This is an Auto-Response.  Please do not Reply. ******</p>
Your password is: #password#
</CFMAIL>
<!--- end mail --->
</CFOUTPUT>

	</CFIF>

</BODY>
</HTML>