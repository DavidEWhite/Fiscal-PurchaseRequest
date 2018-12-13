<!--- set page param --->
<cfparam name="URL.option" default="0" type="any">

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

<BODY onLoad="document.duplicate.recordID.focus()">

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">

<CFIF URL.option EQ "0">
<H5 ALIGN="center">Duplicate an Existing Request</H5>

<DIV align="center">
<cfform action="duplicate.cfm?option=1" method="post" name="duplicate">
<cfinput type="radio" name="dupType" value="1"> Single Purchase Request<br />
<cfinput type="radio" name="dupType" value="2"> Blanket Purchase Request<br /><br />
<INPUT type="hidden" name="dupType_required" value="The type of Request for duplication must be selected.">
Please provide the report number you wish to duplicate:<br />
<cfinput type="text" name="recordID" size="6" class="textc"> <em style="font-size:11px">Example: 516nnnn</em><br /><br />
<INPUT type="hidden" name="recordID_required" value="Please provide the Form Number you wish to duplicate.">
<input name="s1" type="submit" class="textb" value=" Duplicate Request ">
</cfform>
</DIV>
<CFELSEIF URL.option EQ "1">
<cfset recordID = '#FORM.recordID#'>
		<!--- single request --->
		<CFIF FORM.dupType EQ "1">
		<cflocation url="duplicateSingle.cfm?recordID=#FORM.recordID#">
		</CFIF>
		<!--- blanket request --->
		<CFIF FORM.dupType EQ "2">
		<cflocation url="duplicateBlanket.cfm?recordID=#FORM.recordID#">
		</CFIF>		
</cfif>

</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right">
<A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: July 15, 2009</P>

</TD>
</TR>
</TABLE>

