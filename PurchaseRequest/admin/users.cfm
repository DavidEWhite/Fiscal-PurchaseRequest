<cfquery name="get_staff" datasource="FiscalPurchase">
SELECT *
FROM staff
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
   	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</HEAD>

<TABLE WIDTH="650" ALIGN="center">
<TR>
<TD WIDTH="25%" VALIGN="top">
<IMG SRC="../sidelogo.gif" ALT="BLDG 20 Bell Tower with two palms" WIDTH="108" HEIGHT="136" BORDER="0">
</TD>
<TD ALIGN="center" WIDTH="50%">
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<BR>Purchases Using a Government<BR>Purchase Card</H3>
	<H5>Manage Restricted Access</H5>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A><BR><BR>
<A href="index.cfm" CLASS="mini" TITLE="Back">BACK</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="center">
<SPAN style="background-color:#FFFF00; font-weight:bold">&nbsp;&nbsp;CAUTION&nbsp;&nbsp;<BR>
Administrators are the same for Single/Blanket Purchase Card<BR>and Gift Card Requests</SPAN>
</DIV>
<cfform action="processUsers.cfm?option=3" method="post">
<STRONG>Add Administrator</STRONG>
<TABLE>
<TR>
<TD>Display Name:</TD>
<TD><cfinput type="text" name="staff" message="Display Name is a required field." required="yes" class="textc"></TD>
</TR>
<TR>
<TD>Network Account: <EM>vha08\</EM></TD>
<TD><cfinput type="text" name="sLogin" message="Network Account, vhabayusername, is a required field." required="yes" class="textc"> Example: vhabay<EM>username</EM></TD>
</TR>
<TR>
<TD valign="top">Roll:</TD>
<TD>
  <p>
    <label>
      <input type="radio" name="User" value="1">
      Director</label>
    <br>  
    <label>
      <input type="radio" name="User" value="3">
      Administrator</label>
    <br>
    <label>
      <input name="User" type="radio" value="2" checked>
      Fiscal</label>
    <br>
    <label>
      <input name="User" type="radio" value="4" checked>
      Reports Only</label>
    <br>	
  </p>
</TD>
</TR>
<TR>
<TD colspan="2" align="center">
<INPUT name="s1" type="submit" class="textb" value="Add Staff">
</TD>
</TR>
</TABLE>
</cfform>

<STRONG>Manage Existing Staff</STRONG>
<UL>DELETE Staff<BR />
Delete removes the ability of staff to access the Restricted Access Area of the application<BR />
<EM>(This action cannot be undone)</EM>
</UL>
<TABLE width="100%" style="border-collapse:collapse">
<TR>
<TH valign="top">Display Name</TH>
<TH valign="top">Login</TH>
<TH valign="top">Access Level</TH>
<TH>DELETE<BR />cannot be undone</TH>
</TR>
<cfoutput query="get_staff">
<TR>
<TD style="border-bottom:1px ##c0c0c0 solid">#staff#</TD>
<TD style="border-bottom:1px ##c0c0c0 solid">#mid(sLogin,7,20)#</TD>
<TD style="border-bottom:1px ##c0c0c0 solid" align="center">
<CFIF user EQ "1">Executive</CFIF>
<CFIF user EQ "2">Fiscal</CFIF>
<CFIF user EQ "3">Administrator</CFIF>
<CFIF user EQ "4">Staff</CFIF>
</TD>
<TD style="border-bottom:1px ##c0c0c0 solid" align="center"><A href="processUsers.cfm?option=2&recordID=#recordID#" onClick="return confirm('Delete CANNOT be undone. Click OK to Delete this entry (Staff: #staff#).')">DELETE</A></TD>
</TR>
</cfoutput>
</TABLE>

<P>&nbsp;</P>

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

