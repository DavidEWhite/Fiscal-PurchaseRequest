<!--- single purchase --->
<cfquery name="get_list1" datasource="FiscalPurchase">
Select service, recordID, rName, fcpgpf, aDate, fDate, aTrigger, fTrigger, dtrigger 
FROM singlePurchase
WHERE (((aTrigger=0) OR (aTrigger=1)) AND ((fTrigger=0) OR (ftrigger=1)) AND (dTrigger=0))
ORDER BY RecordID, Service
</cfquery>
<!--- blanket purchase --->
<cfquery name="get_list2" datasource="FiscalPurchase">
Select service, recordID, rName, fcpgpf, aDate, fDate, aTrigger, fTrigger, dtrigger
FROM blanketPurchase
WHERE (((aTrigger=0) OR (aTrigger=1)) AND ((fTrigger=0) OR (ftrigger=1)) AND (dTrigger=0))
ORDER BY recordID, Service
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
	<META NAME="DateReviewed" CONTENT="20170406">
	<META NAME="Language" CONTENT="en">
	<META NAME="Type" CONTENT="Interactive Resource">
   	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</HEAD>

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="../sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card<br />Requests in Process</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<em style="font-size:11px">Select the issue for more information<br />
Requests open to a new window.  Close the open window to return here</em>
<!--- single --->
<h5 align="center">Single Purchase Requests</h5>
<CFIF get_list1.RecordCount EQ "0">
<H2 align="center">There are no records for this category</H2>
<CFELSE>
<TABLE WIDTH="100%" border="0">
<TR>
<TH width="10%" valign="top">Number</TH>
<TH width="35%" valign="top">Service</TH>
<TH width="20%" valign="top">Requested by</TH>
<TH width="10%" valign="top">FCP/GPF</TH>
<TH width="12%" valign="top">AO Review</TH>
<TH width="13%" valign="top">Fiscal Review</TH>
<TH width="13%" valign="top">Director Review</TH>
</TR>
<CFOUTPUT query="get_list1">
<TR>
<TD align="center"><A HREF="viewRequests.cfm?option=1&huh=0&recordID=#recordID#" target="_blank">#recordID#</A></TD>
<TD>
<CFSET myVar1 = mid(Service,1,13)>
#myVar1#
</TD>
<TD valign="top">#rName#</TD>
<TD align="center">#fcpgpf#</TD>
<TD valign="top" align="center"><CFIF aTrigger EQ "1">Approved<CFELSE>Pending</CFIF></TD>
<TD valign="top" align="center"><CFIF fTrigger EQ "1">Approved<CFELSE>Pending</CFIF></TD>
<TD valign="top" align="center"><CFIF dTrigger EQ "1">Approved<CFELSE>Pending</CFIF></TD>
</TR>
</CFOUTPUT>
</TABLE>
</CFIF>
<!--- blanket --->
<h5 align="center">Blanket Purchase Requests</h5>
<CFIF get_list2.RecordCount EQ "0">
<H2 align="center">There are no records for this category</H2>
<CFELSE>
<TABLE WIDTH="100%">
<TR>
<TH width="10%" valign="top">Number</TH>
<TH width="35%" valign="top">Service</TH>
<TH width="20%" valign="top">Requested by</TH>
<TH width="10%" valign="top">FCP/GPF</TH>
<TH width="12%" valign="top">AO Review</TH>
<TH width="13%" valign="top">Fiscal Review</TH>
<TH width="13%" valign="top">Director Review</TH>
</TR>
<CFOUTPUT query="get_list2">
<TR>
<TD align="center"><A HREF="viewRequests.cfm?option=2&huh=0&recordID=#recordID#" target="_blank">#recordID#</A></TD>
<TD>
<CFSET myVar1 = mid(Service,1,13)>
#myVar1#
</TD>
<TD valign="top">#rName#</TD>
<TD align="center">#fcpgpf#</TD>
<TD valign="top" align="center"><CFIF aTrigger EQ "1">Approved<CFELSE>Pending</CFIF></TD>
<TD valign="top" align="center"><CFIF fTrigger EQ "1">Approved<CFELSE>Pending</CFIF></TD>
<TD valign="top" align="center"><CFIF dTrigger EQ "1">Approved<CFELSE>Pending</CFIF></TD>
</TR>
</CFOUTPUT>
</TABLE>
</CFIF>
</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Page Reviewed/ Updated: April 6, 2017</P>
</TD>
</TR>
</TABLE>