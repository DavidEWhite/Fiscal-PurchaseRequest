<!--- Fiscal Food & Beverage Approval version 1.00 06/30/2009 --->
<!--- version 1.01 - 5/1/2017 - Removed Reports from public to Admin space; added Reader option for restricted space --->

<!--- select services--->
<cfquery name="get_services" datasource="FiscalPurchase">
SELECT service
FROM services
ORDER BY service
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
	<META NAME="DateReviewed" CONTENT="20170502">
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
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<P align="justify">Under federal law, procurement of food and beverages utilizing appropriated government funds is prohibited; however, when food or beverages are purchased in accordance with one or more exceptions to the general rule as outlined per the GAO-04-261SP Principles of Federal Appropriation Law, they can be authorized. Food and beverage purchases being requested as an exception to the general rule require authorization prior to procurement. Each request must be reviewed and approved by the Chief, Fiscal Service and then forwarded to the HCS Director (or the individual acting in the capacity of the <strong>S</strong>enior <strong>E</strong>xecutive <strong>S</strong>ervice) for final review and approval.</P>
<P align="justify">If you have a food and/or beverage purchase that is appropriate for consideration within the guidelines outlined above, please review the standard operating procedure on Approval Request for Food & Beverage Purchases Using a Government Purchase Card (below) and then submit your request for review using one of the options below:</P>
<P align="justify"><strong>PLEASE NOTE:</strong> Approval requests should only be entered for purchases planned within the next 90 days.  If requests are entered for purchases beyond that time period <strong><u>they will be denied</u></strong> with a statement requesting a re-submission of the request at a later date.<br /> 
<strong>EXCEPTION:</strong> If an approval is required for PBD to award an annual contract, the requests can be entered 1 year in advance; however, the comment must reference that this approval request is to support an annual contract through PBD. </p> 


<UL>
<LI><a href="single.cfm"><strong>Single Purchase Request</strong></a> 
<LI><a href="blanket.cfm"><strong>Blanket Purchase Request</strong></a>
<LI><a href="duplicate.cfm"><strong>Duplicate an Existing Request</strong></a>
</UL>

<p><strong>References:</strong></p>
<UL>
<LI><A href="sop.cfm" title="Standard Operating Procedures">Standard Operating Procedures</A>
<LI><A href="sop2.cfm" title="Automated Approval Request Process/Instructions">Automated Approval Request Process/Instructions</A>
</UL>

<p><strong>Reports</strong> <em>are limited to select staff via Login</em></p>
</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="right">
<A HREF="login.cfm" class="mini">Login</A><br />
<A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
<!--- Date Last Modified --->
<P>Application Reviewed/ Updated: May 2, 2017</P>

</TD>
</TR>
</TABLE>

