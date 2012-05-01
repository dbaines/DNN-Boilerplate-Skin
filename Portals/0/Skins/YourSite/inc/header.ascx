<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>

    <% 'Styles %>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" type="text/css">

	<% 'Initial Scripts %>
	<script src="<%=SkinPath %>js/modernizr-2.0.6.min.js"></script>
	<script runat="server">
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
       Dim skinDocType as Control = Me.Page.FindControl("skinDocType")
       If Not skinDocType is Nothing
          CType(skinDocType, System.Web.UI.WebControls.Literal).Text="<!DOCTYPE html>"
       End If
    End Sub
    </script>

	<% 'IE-Classed Container Divs %>
    <!--[if lt IE 7]> <div class="wrapper ie6 oldie"> <![endif]-->
    <!--[if IE 7]>    <div class="wrapper ie7 oldie"> <![endif]-->
    <!--[if IE 8]>    <div class="wrapper ie8 oldie"> <![endif]-->
    <!--[if gt IE 8]><!--> <div class="wrapper"> <!--<![endif]-->

        <% 'wrapperHeader %>
        <section class="wrapperHeader">
            
            <dnn:SEARCH ID="dnnSearch" runat="server" UseDropDownList="false" EnableTheming="true" Submit="Search" ShowSite="false" ShowWeb="false" />

        </section>
        <% '/wrapperHeader %>

        <% 'wrapperNavigation %>
        <section class="wrapperNavigation">

            <nav class="innerWrap clearfix" role="navigation"><dnn:MENU ID="MENU1" MenuStyle="menu" runat="server" ExcludeNodes="56"></dnn:MENU>​</nav>
            
        </section>
        <% '/wrapperNavigation %>