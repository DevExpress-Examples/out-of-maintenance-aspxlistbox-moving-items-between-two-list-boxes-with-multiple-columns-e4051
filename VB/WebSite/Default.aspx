<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <script type="text/javascript">
    // <![CDATA[
        function AddSelectedItems() {
            MoveSelectedItems(lbAvailable, lbChoosen);
            UpdateButtonState();
        }
        function AddAllItems() {
            MoveAllItems(lbAvailable, lbChoosen);
            UpdateButtonState();
        }
        function RemoveSelectedItems() {
            MoveSelectedItems(lbChoosen, lbAvailable);
            UpdateButtonState();
        }
        function RemoveAllItems() {
            MoveAllItems(lbChoosen, lbAvailable);
            UpdateButtonState();
        }
        function MoveSelectedItems(srcListBox, dstListBox) {
            srcListBox.BeginUpdate();
            dstListBox.BeginUpdate();
            var items = srcListBox.GetSelectedItems();
            for (var i = items.length - 1; i >= 0; i = i - 1) {
                var itemText = GetSplitText(items[i].text);
                dstListBox.AddItem(itemText, items[i].value);
                srcListBox.RemoveItem(items[i].index);
            }
            srcListBox.EndUpdate();
            dstListBox.EndUpdate();
        }
        function MoveAllItems(srcListBox, dstListBox) {
            srcListBox.BeginUpdate();
            var count = srcListBox.GetItemCount();
            for (var i = 0; i < count; i++) {
                var item = srcListBox.GetItem(i);
                var itemText = GetSplitText(item.text);
                dstListBox.AddItem(itemText, item.value);
            }
            srcListBox.EndUpdate();
            srcListBox.ClearItems();
        }
        function UpdateButtonState() {
            btnMoveAllItemsToRight.SetEnabled(lbAvailable.GetItemCount() > 0);
            btnMoveAllItemsToLeft.SetEnabled(lbChoosen.GetItemCount() > 0);
            btnMoveSelectedItemsToRight.SetEnabled(lbAvailable.GetSelectedItems().length > 0);
            btnMoveSelectedItemsToLeft.SetEnabled(lbChoosen.GetSelectedItems().length > 0);
        }
        function GetSplitText(text) {
            var splitedText = text.split(';');
            var index = 0;
            for (str in splitedText) {
                if (index != 0)
                    splitedText[index] = splitedText[index].slice(1);
                index++;
            }
            return splitedText;
        }
    // ]]> 
    </script>

    <dx:ASPxGlobalEvents ID="GlobalEvents" runat="server">
        <ClientSideEvents ControlsInitialized="function(s, e) { UpdateButtonState(); }" />
    </dx:ASPxGlobalEvents>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" style="width: 35%">
                <div class="BottomPadding">
                    <dx:ASPxLabel ID="lblAvailable" runat="server" Text="Available:" />
                </div>
                <dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable"
                    Width="100%" Height="240px" SelectionMode="CheckColumn" DataSourceID="ads" ValueType="System.Int32"
                    ValueField="id" TextField="name">
                    <Columns>
                        <dx:ListBoxColumn Caption="Id" Name="Id" FieldName="Id" />
                        <dx:ListBoxColumn Caption="Name" Name="Name" FieldName="Name" />
                    </Columns>
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }" />
                </dx:ASPxListBox>
            </td>
            <td valign="middle" align="center" style="padding: 10px; width: 30%">
                <div>
                    <dx:ASPxButton ID="btnMoveSelectedItemsToRight" runat="server" ClientInstanceName="btnMoveSelectedItemsToRight"
                        AutoPostBack="False" Text="Add >" Width="130px" Height="23px" ClientEnabled="False"
                        ToolTip="Add selected items">
                        <ClientSideEvents Click="function(s, e) { AddSelectedItems(); }" />
                    </dx:ASPxButton>
                </div>
                <div class="TopPadding">
                    <dx:ASPxButton ID="btnMoveAllItemsToRight" runat="server" ClientInstanceName="btnMoveAllItemsToRight"
                        AutoPostBack="False" Text="Add All >>" Width="130px" Height="23px" ToolTip="Add all items">
                        <ClientSideEvents Click="function(s, e) { AddAllItems(); }" />
                    </dx:ASPxButton>
                </div>
                <div style="height: 32px">
                </div>
                <div>
                    <dx:ASPxButton ID="btnMoveSelectedItemsToLeft" runat="server" ClientInstanceName="btnMoveSelectedItemsToLeft"
                        AutoPostBack="False" Text="< Remove" Width="130px" Height="23px" ClientEnabled="False"
                        ToolTip="Remove selected items">
                        <ClientSideEvents Click="function(s, e) { RemoveSelectedItems(); }" />
                    </dx:ASPxButton>
                </div>
                <div class="TopPadding">
                    <dx:ASPxButton ID="btnMoveAllItemsToLeft" runat="server" ClientInstanceName="btnMoveAllItemsToLeft"
                        AutoPostBack="False" Text="<< Remove All" Width="130px" Height="23px" ClientEnabled="False"
                        ToolTip="Remove all items">
                        <ClientSideEvents Click="function(s, e) { RemoveAllItems(); }" />
                    </dx:ASPxButton>
                </div>
            </td>
            <td valign="top" style="width: 35%">
                <div class="BottomPadding">
                    <dx:ASPxLabel ID="lblChosen" runat="server" Text="Chosen:" />
                </div>
                <dx:ASPxListBox ID="lbChoosen" runat="server" ClientInstanceName="lbChoosen" Width="100%"
                    Height="240px" SelectionMode="CheckColumn">
                    <Columns>
                        <dx:ListBoxColumn Caption="Id" Name="Id" FieldName="Id" />
                        <dx:ListBoxColumn Caption="Name" Name="Name" FieldName="Name" />
                    </Columns>
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { UpdateButtonState(); }">
                    </ClientSideEvents>
                </dx:ASPxListBox>
            </td>
        </tr>
    </table>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/test.mdb" SelectCommand="SELECT * FROM [table]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
