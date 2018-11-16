<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ZadanieRekrutacyjne.Contact" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center" >
        &nbsp;<asp:Label ID="Label1" runat="server" Text="Zaimportuj listę gości" Font-Names="Monotype Corsiva" Font-Size="X-Large" ForeColor="Black"></asp:Label>
        <div style="margin-left:auto; margin-right:auto; width:200px;">
            <br />
            <!-- Przycisk do załączenia pliku do uploadu -->
    <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
        <br />
        <!-- Przycisk do zaimportowania załączonego wcześniej pliku -->
<asp:Button Text="Upload" OnClick="Upload" runat="server" class="btn btn-primary" />
    </div>
<div style="margin-left:auto; margin-right:auto; width:500px;">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <!-- Tworzymy tabelę do wyświetlania danych -->
        <asp:GridView ID="GridView1" runat="server"  GridLines="Horizontal" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"
            DataKeyNames="Id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" AllowPaging ="True" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="450px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Gray" Font-Names="Monotype Corsiva" >
            <Columns>
                <asp:TemplateField HeaderText="Imie" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblImie" runat="server" Text='<%# Eval("Imie") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtImie" runat="server" Text='<%# Eval("Imie") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nazwisko" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblNazwisko" runat="server" Text='<%# Eval("Nazwisko") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNazwisko" runat="server" Text='<%# Eval("Nazwisko") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" 
                    ItemStyle-Width="150"  >
                <ItemStyle Width="150px"  />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <!-- Tworzymy formularz do maualnego dodawania pojedynczych danych do tabeli -->
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 150px">
                    Imie:<br />
                    <asp:TextBox ID="textImie" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Nazwisko:<br />
                    <asp:TextBox ID="textNazwisko" runat="server" Width="140" />
                </td>
                <td style="width: 164px">
                    <br />
                    <asp:Button ID="btnAdd" runat="server" Text="Dodaj" OnClick="Insert" Height="25px" Width="67px" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
        </div>
</asp:Content>
