<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="ListDetails.aspx.cs" Inherits="LilSnippers_TEST.ListDetails" %>

<%@ Register src="~/DynamicData/Content/GridViewPager.ascx" tagname="GridViewPager" tagprefix="asp" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
            <asp:DataControlReference ControlID="GridView1" />
        </DataControls>
    </asp:DynamicDataManager>

    <h2 class="DDSubHeader"><%= table.DisplayName %></h2>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="DD">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                    HeaderText="List of validation errors" CssClass="DDValidator" />
                <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1" Display="None" CssClass="DDValidator" />
                <asp:DynamicValidator runat="server" ID="FormViewValidator" ControlToValidate="FormView1" Display="None" CssClass="DDValidator" />

                <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>' OnPreRender="Label_PreRender" />
                        <asp:DynamicFilter runat="server" ID="DynamicFilter" OnFilterChanged="DynamicFilter_FilterChanged" /><br />
                    </ItemTemplate>
                </asp:QueryableFilterRepeater>
                <br />
                <br />
            </div>
            <fieldset id="MultiSearchFieldSet" class="DD" runat="server" visible="True">
                <asp:TextBox ID="txbMultiColumnSearch" CssClass="DDTextBox" runat="server" Height="25px" Width="150px" />
                <asp:Button ID="btnMultiColumnSearchSubmit" CssClass="DDControl" runat="server" Text="Search"
                    OnClick="btnMultiColumnSearch_Click" Height="25px" Width="75px" />
                <asp:Button ID="btnMultiColumnSearchClear" CssClass="DDControl" runat="server" Text="Clear"
                    OnClick="btnMultiColumnSearch_Click" Height="25px" Width="75px" />
            </fieldset>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="GridDataSource" EnablePersistedSelection="True"
                AutoGenerateSelectButton="True"
                AllowPaging="True" OnDataBound="GridView1_DataBound"
                OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnPageIndexChanging="GridView1_PageIndexChanging"
                OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated"
                OnRowCreated="GridView1_RowCreated" CssClass="DDGridView"
                RowStyle-CssClass="td" HeaderStyle-CssClass="th" CellPadding="6">

                <HeaderStyle CssClass="th" />

                <PagerStyle CssClass="DDFooter" />        
                <RowStyle CssClass="td" />
                <SelectedRowStyle CssClass="DDSelected" />
                <PagerTemplate>
                    <asp:GridViewPager ID="GridViewPager1" runat="server" />
                </PagerTemplate>
                <EmptyDataTemplate>
                    There are currently no items in this table.
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:EntityDataSource ID="GridDataSource" runat="server" EnableDelete="true" EnableUpdate="true" />
            
            <asp:QueryExtender ID="GridQueryExtender" TargetControlID="GridDataSource" runat="server">
                <asp:DynamicFilterExpression ControlID="FilterRepeater" />
            </asp:QueryExtender>

            <asp:Panel ID="DetailsPanel" runat="server">
                <br /><br />

                <asp:FormView ID="FormView1" runat="server" DataSourceID="DetailsDataSource" RenderOuterTable="false"
                    OnPreRender="FormView1_PreRender" OnModeChanging="FormView1_ModeChanging" OnItemUpdated="FormView1_ItemUpdated"
                    OnItemInserted="FormView1_ItemInserted" OnItemDeleted="FormView1_ItemDeleted">
                    <HeaderTemplate>
                        <table id="detailsTable" class="DDDetailsTable" cellpadding="6">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DynamicEntity ID="DynamicEntity1" runat="server" />
                        <tr class="td">
                            <td colspan="2">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" Text="Edit" />
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" Text="Delete"
                                    OnClientClick='return confirm("Are you sure you want to delete this item?");' />
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="New" Text="New" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DynamicEntity ID="DynamicEntity2" runat="server" Mode="Edit" />
                        <tr class="td">
                            <td colspan="2">
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Update" Text="Update" />
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DynamicEntity ID="DynamicEntity3" runat="server" Mode="Insert" />
                        <tr class="td">
                            <td colspan="2">
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:FormView>

                <asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" EnableInsert="true" EnableUpdate="true" />

                <asp:QueryExtender ID="QueryExtender1" TargetControlID="DetailsDataSource" runat="server">
                    <asp:ControlFilterExpression ControlID="GridView1" />
                </asp:QueryExtender>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

