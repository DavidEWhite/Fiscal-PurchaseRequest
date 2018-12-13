<!--- single purchase --->
<cfquery name="get_list1" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, dDate, dtrigger
FROM singlePurchase
WHERE dTrigger=1 
ORDER BY dDate DESC
</cfquery>
<!--- blanket purchase --->
<cfquery name="get_list2" datasource="FiscalPurchase">
SELECT service, recordID, rName, fcpgpf, dDate, dtrigger
FROM blanketPurchase
WHERE dTrigger=1 
ORDER BY dDate DESC
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
   	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</HEAD>

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="../sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card<br />Approved Requests</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">

<em style="font-size:11px">Select the number for more information<br />
Requests open to a new window.  Close the open window to return here</em>
<h5 align="center">Single Purchase Requests</h5>
<CFIF get_list1.RecordCount EQ "0">
<H2 align="center">There are no records for this category</H2>
<CFELSE>
<TABLE WIDTH="500" BORDER="0" ALIGN="center">
<TR>
<TH width="50" align="center" valign="top">Number</TH>
<TH width="250" valign="top">Service</TH>
<TH width="100" valign="top">Requester</TH>
<TH width="50" valign="top">FCP / GPF</TH>
</TR>
<CFOUTPUT query="get_list1">
<TR>
<TD valign="top" align="center">
<A HREF="viewRequests.cfm?option=1&huh=1&recordID=#recordID#" target="_blank" class="mini">#recordID#</A>
</TD>
<TD valign="top">#Service#</TD>
<TD valign="top">#rName#</TD>
<TD valign="top" align="center">#FCPGPF#</TD>
</TR>
</CFOUTPUT>
</TABLE>
</CFIF>


<h5 align="center">Blanket Purchase Requests</h5>
<CFIF get_list2.RecordCount EQ "0">
<H2 align="center">There are no records for this category</H2>
<CFELSE>
<TABLE WIDTH="500" BORDER="0" ALIGN="center">
<TR>
<TH width="50" align="center" valign="top">Number</TH>
<TH width="250" valign="top">Service</TH>
<TH width="100" valign="top">Requester</TH>
<TH width="50" valign="top">FCP / GPF</TH>
</TR>
<CFOUTPUT query="get_list2">
<TR>
<TD valign="top" align="center">
<A HREF="viewRequests.cfm?option=2&huh=1&recordID=#recordID#" target="_blank" class="mini">#recordID#</A>
</TD>
<TD valign="top">#Service#</TD>
<TD valign="top">#rName#</TD>
<TD valign="top" align="center">#FCPGPF#</TD>
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
<P>Application Reviewed/ Updated: July 15, 2009</P>

</TD>
</TR>
</TABLE>