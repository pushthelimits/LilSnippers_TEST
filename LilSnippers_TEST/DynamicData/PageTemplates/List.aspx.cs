using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;
using System.Linq;
using LilSnippers_TEST.BusinessObjects;

namespace LilSnippers_TEST
{
    public partial class List : System.Web.UI.Page
    {
        protected MetaTable table;
//private  string ClientLastName;

        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
            GridView1.SetMetaTable(table, table.GetColumnValuesFromRoute(Context));
            GridDataSource.EntityTypeFilter = table.EntityType.Name;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = table.DisplayName;
            GridDataSource.Include = table.ForeignKeyColumnsNames;

            //only show search feature on the client page

            //if (table.DisplayName == "Client") { MultiSearchFieldSet.Visible = true; }
            //else
            //{ MultiSearchFieldSet.Visible = false; };


            // Disable various options if the table is readonly
            if (table.IsReadOnly)
            {
                GridView1.Columns[0].Visible = false;
                InsertHyperLink.Visible = false;
                GridView1.EnablePersistedSelection = false;
            }
        }

        protected void btnMultiColumnSearch_Click(object sender, EventArgs e)
        {
            //var button = (Button)sender;
            //if (button.ID == btnMultiColumnSearchClear.ID)
            //    txbMultiColumnSearch.Text = String.Empty;
            //else
            //    using (LilSnippersDataContext Data = new LilSnippersDataContext())
            //    {
            //        ClientLastName = txbMultiColumnSearch.Text;
            //        var SearchResults = Data.Clients.Where
            //           (Clients => (Clients.ClientLastName.Contains(ClientLastName) || (Clients.ClientLastName.Contains(ClientLastName))));

            //        GridView1.DataSourceID = "";
            //        GridView1.DataSource = SearchResults;
            //        GridView1.DataBind();
                //}

        }

        protected void Label_PreRender(object sender, EventArgs e)
        {
            Label label = (Label)sender;
            DynamicFilter dynamicFilter = (DynamicFilter)label.FindControl("DynamicFilter");
            QueryableFilterUserControl fuc = dynamicFilter.FilterTemplate as QueryableFilterUserControl;
            if (fuc != null && fuc.FilterControl != null)
            {
                label.AssociatedControlID = fuc.FilterControl.GetUniqueIDRelativeTo(label);
            }
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            RouteValueDictionary routeValues = new RouteValueDictionary(GridView1.GetDefaultValues());
            InsertHyperLink.NavigateUrl = table.GetActionPath(PageAction.Insert, routeValues);
            base.OnPreRenderComplete(e);
        }

        protected void DynamicFilter_FilterChanged(object sender, EventArgs e)
        {
            GridView1.PageIndex = 0;
        }

    }
}
