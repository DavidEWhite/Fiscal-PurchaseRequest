<!--- get fiscal review report --->
<!--- single requests --->
<cfquery name="get_single" datasource="FiscalPurchase">
SELECT recordID, rDate, service, fTrigger, dTrigger
FROM SinglePurchase
WHERE ((fTrigger=1) AND (dTrigger=0))
ORDER BY recordID;
</cfquery>

<!--- blanket requests --->
<cfquery name="get_blanket" datasource="FiscalPurchase">
SELECT recordID, rDate, service, fTrigger, dTrigger
FROM BlanketPurchase
WHERE ((fTrigger=1) AND (dTrigger=0))
ORDER BY recordID;
</cfquery>

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
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card<BR>Director's Review</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">

<h1 align="center">Single Purchase Requests</h1>
<CFIF #get_single.RecordCount# EQ "0">
<p align="center"><strong>There are no Single Purchase Requests awaiting your action.</strong></p>
<CFELSE>
<em>Please choose the record number to review the request.</em>
<TABLE ALIGN="center">
<TR>
<TH>Record Number</TH>
<TH>Request Submitted</TH>
<TH>Requesting Service</TH>
</TR>
<cfoutput query="get_single">
<TR>
<TD ALIGN="center"><a href="dReviewSingle.cfm?recordID=#recordID#">#recordID#</a></TD>
<TD>#DateFormat(rDate , "mm/dd/yyyy")#</TD>
<TD>#service#</TD>
</TR>
</cfoutput>
</TABLE>
</CFIF>

<h1 align="center">Blanket Purchase Requests</h1>
<CFIF #get_blanket.RecordCount# EQ "0">
<p align="center"><strong>There are no Blanket Purchase Requests awaiting your action.</strong></p>
<CFELSE>
<em>Please choose the record number to review the request.</em>
<TABLE ALIGN="center">
<TR>
<TH>Record Number</TH>
<TH>Request Submitted</TH>
<TH>Requesting Service</TH>
</TR>
<cfoutput query="get_blanket">
<TR>
<TD ALIGN="center"><a href="dReviewBlanket.cfm?recordID=#recordID#">#recordID#</TD>
<TD>#DateFormat(rDate , "mm/dd/yyyy")#</TD>
<TD>#service#</TD>
</TR>
</cfoutput>
</TABLE>
</CFIF>

</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: July 15, 2009</P>

</TD>
</TR>
</TABLE>