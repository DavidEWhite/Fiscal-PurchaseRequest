<cfquery name="get_approvers" datasource="FiscalPurchase">
SELECT *
FROM staff
WHERE user=1 OR user=2
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
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card</H3>
	<H5>Manage Approvers</H5>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><br><br>
<a href="index.cfm" CLASS="mini" TITLE="Back">BACK</a></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="center">
<span style="background-color:#FFFF00; font-weight:bold">&nbsp;&nbsp;CAUTION&nbsp;&nbsp;<br>
* Approver is the same for Single/Blanket Purchase Card<br>and Gift Card Requests</span>
</DIV>
<p><em><strong>Note:</strong>  The display of Name on Memo may take up to 48 hours to change on request pages.</em></p>
<TABLE border="0" width="100%">
<cfoutput query="get_approvers">
<CFIF #get_approvers.User# EQ "1">
<cfform action="processApprovers.cfm?option=1" method="post">
<TR>
<TD colspan="2"><strong>Director Approval</strong></TD>
</TR>
<TR>
<TD>Name on Memo:</TD>
<TD><cfinput type="text" name="staff" class="textc" value="#staff#"></TD>
</TR>
<TR>
<TD valign="top">Email:</TD>
<TD><cfinput type="text" name="email" class="textc" value="#email#" size="80"><br>
<em style="font-size:10px">Multiple recipients use a comma separator</em></TD>
</TR>
<TR>
<TD colspan="2" align="center">
<input name="recordID" type="hidden" value="#recordID#">
<input name="s2" type="submit" value="Update Record" class="textb">
</TD>
</TR>
</cfform>
</CFIF>
<TR>
<TD colspan="2"><HR size="1" width="75%"></TD>
</TR>
<CFIF #get_approvers.User# EQ "2">
<cfform action="processApprovers.cfm?option=2" method="post">
<TR>
<TD colspan="2"><strong>* Fiscal Approval</strong></TD>
</TR>
<TR>
<TD>Name on Memo:</TD>
<TD><cfinput type="text" name="staff" class="textc" value="#staff#"></TD>
</TR>
<TR>
<TD valign="top">Email:</TD>
<TD><cfinput type="text" name="email" class="textc" value="#email#" size="80"><br>
<em style="font-size:10px">Multiple recipients use a comma separator</em></TD>
</TR>
<TR>
<TD colspan="2" align="center">
<input name="recordID" type="hidden" value="#recordID#">
<input name="s2" type="submit" value="Update Record" class="textb">
</TD>
</TR>
</cfform>
</CFIF>
</cfoutput>
</TABLE>
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

