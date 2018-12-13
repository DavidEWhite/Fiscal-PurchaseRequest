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
	<H3>Bay Pines VA Healthcare System<BR>Approval Request for Food & Beverage<br>Purchases Using a Government<br>Purchase Card</H3>
	</TD>
	<TD WIDTH="25%" VALIGN="top">
	<DIV ALIGN="right"><A href="javascript:window.close();" CLASS="mini" TITLE="Close the Application">Close Window</A></DIV>
	</TD>
</TR>
<TR>
<TD COLSPAN="3">
<DIV ALIGN="center">

<p>You must create a new password at first login.<br>
Please create a password and confirm it.</p>
			<cfform method="POST" action="processnewpassword.cfm" name="login">
			New Password&nbsp;&nbsp;&nbsp;&nbsp;<input name="password1" type="password" class="textc" size="30" /><br /><br />
			Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password2" size="30" class="textc" /><br /><br />
			<input name="recordID" type="hidden" value="<cfoutput>#URL.recordID#</cfoutput>">
			<input name="" type="submit" class="textb" value="Login" />
			</cfform>
</DIV>

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